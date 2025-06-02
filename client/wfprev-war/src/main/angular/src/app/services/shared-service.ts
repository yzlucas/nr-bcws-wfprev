import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class SharedService {
  private readonly filtersSource = new BehaviorSubject<any>(null);
  filters$ = this.filtersSource.asObservable();

  private readonly displayedProjectsSource = new BehaviorSubject<any[]>([]);
  displayedProjects$ = this.displayedProjectsSource.asObservable();

<<<<<<< Updated upstream
=======
  private readonly selectedProjectSubject = new Subject<any>();
  selectedProject$ = this.selectedProjectSubject.asObservable();

  private readonly _mapCommand$ = new Subject<{ action: 'open' | 'close', project: Project }>();
  mapCommand$ = this._mapCommand$.asObservable();

>>>>>>> Stashed changes
  updateFilters(filters: any) {
    this.filtersSource.next(filters);
  }

  updateDisplayedProjects(projects: any[]) {
    this.displayedProjectsSource.next(projects);
  }
}
