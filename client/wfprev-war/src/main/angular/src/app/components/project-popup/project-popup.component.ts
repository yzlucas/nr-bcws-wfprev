import { CommonModule } from '@angular/common';
import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-project-popup',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './project-popup.component.html',
  styleUrls: ['./project-popup.component.scss']
})
export class ProjectPopupComponent {
  @Input() project: any;
  @Input() map!: L.Map;
  @Output() closed = new EventEmitter<void>();
  formatCurrency(val: number | undefined): string {
    return val != null ? `$${val.toLocaleString()}` : 'N/A';
  }

  navigateToProject(): void {
    if (this.project?.projectGuid) {
      window.location.href = `${window.location.origin}/edit-project?projectGuid=${this.project.projectGuid}`;
    }
  }
  closePopup(): void {
    this.closed.emit();
  }

}
