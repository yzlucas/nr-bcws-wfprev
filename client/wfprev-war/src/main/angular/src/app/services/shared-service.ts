import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class SharedService {
  private readonly filtersSource = new BehaviorSubject<any>(null);
  filters$ = this.filtersSource.asObservable();

  private readonly displayedProjectsSource = new BehaviorSubject<any[]>([]);
  displayedProjects$ = this.displayedProjectsSource.asObservable();

  private readonly selectedProjectSource = new BehaviorSubject<any | null>(null);
  selectedProject$ = this.selectedProjectSource.asObservable();

  updateFilters(filters: any) {
    this.filtersSource.next(filters);
  }

  updateDisplayedProjects(projects: any[]) {
    this.displayedProjectsSource.next(projects);
  }

  updateSelectedProject(project: any | null) {
    this.selectedProjectSource.next(project);
  }

}
