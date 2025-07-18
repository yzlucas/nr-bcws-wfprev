import { HttpClient, HttpHandler, HttpHeaders } from "@angular/common/http";
import { Injectable, Injector } from "@angular/core";
import { MatSnackBar } from "@angular/material/snack-bar";
import { OAuthService } from "angular-oauth2-oidc";
import momentInstance from "moment";
import { AsyncSubject, Observable, catchError, firstValueFrom, map, of } from "rxjs";
import { AppConfigService } from "./app-config.service";

const moment = momentInstance;
const OAUTH_LOCAL_STORAGE_KEY = 'oauth';

@Injectable({
  providedIn: 'root',
})
export class TokenService {
  private LOCAL_STORAGE_KEY = OAUTH_LOCAL_STORAGE_KEY;
  private useLocalStore = false;
  private oauth: any;
  private tokenDetails: any;

  private readonly credentials = new AsyncSubject<any>();
  private readonly authToken = new AsyncSubject<string>();
  public credentialsEmitter: Observable<any> = this.credentials.asObservable();
  public authTokenEmitter: Observable<string> = this.authToken.asObservable();

  constructor(private readonly injector: Injector, protected appConfigService: AppConfigService, protected snackbarService: MatSnackBar) {
    const config = this.appConfigService.getConfig().application;

    const lazyAuthenticate: boolean = config.lazyAuthenticate ?? false;
    const enableLocalStorageToken: boolean = config.enableLocalStorageToken ?? false;
    const localStorageTokenKey: string = config.localStorageTokenKey ?? OAUTH_LOCAL_STORAGE_KEY;
    const allowLocalExpiredToken: boolean = config.allowLocalExpiredToken ?? false;

    if (localStorageTokenKey) {
      this.LOCAL_STORAGE_KEY = localStorageTokenKey;
    }

    if (enableLocalStorageToken) {
      this.useLocalStore = true;
    }

    this.checkForToken(undefined, lazyAuthenticate, allowLocalExpiredToken);
  }

  public async checkForToken(redirectUri?: string, lazyAuth = false, allowLocalExpiredToken = false): Promise<void> {
    const hash = window.location.hash;

    if (hash?.includes('access_token')) {
      this.parseToken(hash);
    } else if (this.useLocalStore && !navigator.onLine) {
      let tokenStore = localStorage.getItem(this.LOCAL_STORAGE_KEY);

      if (tokenStore) {
        try {
          await this.initAuthFromSession();
        } catch (err) {
          this.tokenDetails = undefined;
          localStorage.removeItem(this.LOCAL_STORAGE_KEY);
          this.initIDIRLogin(redirectUri);
        }
      } else {
        this.initIDIRLogin(redirectUri);
      }

      if (!allowLocalExpiredToken && this.isTokenExpired(this.tokenDetails)) {
        localStorage.removeItem(this.LOCAL_STORAGE_KEY);
        this.initIDIRLogin(redirectUri);
      }
    } else if (hash?.includes('error')) {
      this.snackbarService.open(
        'Error occurred during authentication',
        'OK',
        { duration: 10000, panelClass: 'snackbar-error' },
      );
      return;
    } else if (!lazyAuth) {
      this.initIDIRLogin(redirectUri);
    }
  }

  public isTokenExpired(token: any): boolean {
    if (token?.exp) {
      const expiryDate = moment.unix(token.exp);
      return !moment().isBefore(expiryDate);
    }
    return true;
  }

  private parseToken(hash: string): void {
    hash = hash.startsWith('#') ? hash?.substr(1) : hash;
    const params = new URLSearchParams(hash);
    const paramMap: { [key: string]: string } = {};

    params.forEach((value, key) => {
      paramMap[key] = value;
    });

    if (paramMap['access_token']) {
      location.hash = '';
      this.initAuth(paramMap);
    }
  }

  private initIDIRLogin(redirectUri?: string): void {
    const configuration = this.appConfigService.getConfig();
    const authConfig = {
      oidc: false,
      issuer: configuration.application.baseUrl,
      loginUrl: configuration.webade.oauth2Url,
      redirectUri: redirectUri ?? window.location.href,
      clientId: configuration.webade.clientId,
      scope: configuration.webade.authScopes
    };

    const oauthService = this.injector.get(OAuthService);
    oauthService.configure(authConfig);
    oauthService.initImplicitFlow();
  }

  async initAuthFromSession(): Promise<void> {
    try {
      const localOauth = localStorage.getItem(this.LOCAL_STORAGE_KEY);
      this.oauth = localOauth ? JSON.parse(localOauth) : null;
      await this.initAndEmit();
    } catch (err) {
      localStorage.removeItem(this.LOCAL_STORAGE_KEY);
      this.handleError(err, 'Failed to handle token');
    }
  }

  public initAuth(response: any): void {
    if (response) {
      try {
        if (this.useLocalStore) {
          const tokenStore = {
            access_token: response.access_token,
            expires_in: response.expires_in
          };
          localStorage.setItem(this.LOCAL_STORAGE_KEY, JSON.stringify(tokenStore));
        }
        this.oauth = response;
        this.initAndEmit();
      } catch (err) {
        if (this.useLocalStore) {
          localStorage.removeItem(this.LOCAL_STORAGE_KEY);
        }
        console.error('Failed to handle token payload', this.oauth);
        this.handleError(err, 'Failed to handle token');
      }
    }
  }

  public validateToken(token: string): Observable<any> {
    const http = new HttpClient(this.injector.get(HttpHandler));
    const config = this.appConfigService.getConfig();
    const checkTokenUrl = config.webade.checkTokenUrl ? config.webade.checkTokenUrl : "null";

    const headers = new HttpHeaders({
      'Authorization': 'Bearer ' + `${token}`,
    });
    
    return http.get(
      checkTokenUrl,
      {
        headers,
        observe: 'response'
      }
    ).pipe(
      map(response => response.body),
      catchError(() => of(false))
    );

  }

  private async initAndEmit(): Promise<void> {
    const config = this.appConfigService.getConfig();

    if (config.webade.enableCheckToken) {
      try {
        this.tokenDetails = await firstValueFrom(this.validateToken(this.oauth.access_token));
        this.emitTokens();
      } catch (error: any) {
        console.error('Error occurred while checking token: ', error);
        this.snackbarService.open(
          `App initialization failed with HttpStatus ${error.status} for authorization token check`,
          'OK',
          { duration: 10000, panelClass: 'snackbar-error' },
        );
        throw error;
      }
    } else {
      const oauthInfo = this.oauth?.access_token?.split('.');

      if (oauthInfo?.length > 1) {
        this.tokenDetails = JSON.parse(atob(oauthInfo[1]));
      }

      this.emitTokens();
    }
  }

  private emitTokens(): void {
    this.authToken.next(this.oauth?.access_token);
    this.authToken.complete();
    this.credentials.next(this.tokenDetails);
    this.credentials.complete();
  }

  public updateToken(oauthToken: any): void {
    this.oauth = oauthToken;
    this.initAndEmit();
  }

  public getOauthToken(): string | null {
    return this.oauth?.access_token ?? null;
  }

  public getUserFullName(reverseNameOrder: boolean = false): string | null {
    const first = (this.tokenDetails?.given_name ?? this.tokenDetails?.givenName) ?? '';
    const last = (this.tokenDetails?.family_name ?? this.tokenDetails?.familyName) ?? '';

    if (!first && !last) {
      return null;
    }

    if (reverseNameOrder) {
      if (last && first) {
        return `${last}, ${first}`;
      }
      return last || first;
    }

    return `${first} ${last}`.trim();
  }


  public doesUserHaveApplicationPermissions(scopes?: string[]): boolean {
    if (this.tokenDetails?.scope?.length > 0 && scopes?.length) {
      return scopes.every(scope => this.tokenDetails.scope.includes(scope));
    }
    return false;
  }

  public clearLocalStorageToken(): void {
    localStorage.removeItem(this.LOCAL_STORAGE_KEY);
  }

  private handleError(err: any, message?: string): never {
    console.error('Unexpected error', err);
    const errorMessage = message ? `${message}` : `${err}`;
    this.snackbarService.open(
      'Unexpected error occurred: ' + errorMessage,
      'OK',
      { duration: 10000, panelClass: 'snackbar-error' },
    );
    throw err;
  }
}