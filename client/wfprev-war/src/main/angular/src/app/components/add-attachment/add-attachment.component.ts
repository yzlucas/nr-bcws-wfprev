import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { TokenService } from 'src/app/services/token.service';
import { CommonModule } from '@angular/common';
import { MatInputModule } from '@angular/material/input';
import { FormsModule } from '@angular/forms';


@Component({
  selector: 'add-attachment',
  templateUrl: './add-attachment.component.html',
  styleUrls: ['./add-attachment.component.scss'],
  standalone: true,
  imports: [CommonModule, MatInputModule, FormsModule]
})
export class AddAttachmentComponent {
  selectedFile: File | null = null;
  selectedFileName: string = '';
  attachmentType: string = '';
  description: string = '';
  attachmentTypes = [''];
  isDescriptionTooLong: boolean = false;
  constructor(
    private readonly tokenService: TokenService,
    private readonly dialogRef: MatDialogRef<AddAttachmentComponent>,
    @Inject(MAT_DIALOG_DATA) public data: { indicator: string; name: string }
  ) {
    // only show Gross Project Area Boundary as a dropdown option if project boundary is being updated
    const isProjectFiles = data.indicator === 'project-files';

    this.attachmentTypes = isProjectFiles
      ? ['Gross Project Area Boundary']
      : ['Gross Project Area Boundary', 'Other'];

    this.attachmentType = isProjectFiles ? 'Gross Project Area Boundary' : '';
  }

  onFileSelected(event: any): void {
    const file = event.target.files[0];
    if (file) {
      this.selectedFile = file;
      this.selectedFileName = file.name;
    }
  }

  checkDescriptionLength(): void {
    this.isDescriptionTooLong = this.description.length > 150;
  }

  onGoBack(): void {
    this.dialogRef.close(false);
  }

  onConfirm(): void {
    if (this.isFormValid()) {
      this.dialogRef.close({ file: this.selectedFile, filename: this.selectedFileName, type: this.attachmentType, description: this.description });
    }
  }

  isFormValid(): boolean {
    return !!this.selectedFileName && !!this.attachmentType && this.description.length > 0 && this.description.length <= 150;
  }

  chooseFile() {
    document.getElementById('fileInput')?.click();
  }

  getFileName(): string {
    return this.selectedFileName || 'No File Chosen';
  }

  getAcceptedFileTypes(): string {
    switch (this.attachmentType) {
      case 'Gross Project Area Boundary':
        return '.kml,.kmz,.shp,.gdb,.zip';
      case 'Other':
        return '.pdf,.doc,.docx,.jpg,.png';
      default:
        return '';
    }
  }
}
