import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ProjectEventService {
  private refreshProjectsSubject = new Subject<void>();

  refreshProjects$ = this.refreshProjectsSubject.asObservable();

  triggerRefreshProjects(): void {
    this.refreshProjectsSubject.next();
  }
}