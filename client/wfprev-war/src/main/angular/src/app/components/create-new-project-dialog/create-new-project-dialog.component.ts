import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatDialog , MatDialogRef } from '@angular/material/dialog';
import { ConfirmationDialogComponent } from 'src/app/components/confirmation-dialog/confirmation-dialog.component';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Messages } from 'src/app/utils/messages';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Project } from 'src/app/models/project.model';
import { ProjectEventService } from 'src/app/services/shareservice';
@Component({
  selector: 'app-create-new-project-dialog',
  standalone: true,
  imports: [
    ReactiveFormsModule,
    CommonModule,
  ],
  templateUrl: './create-new-project-dialog.component.html',
  styleUrls: ['./create-new-project-dialog.component.scss']
})
export class CreateNewProjectDialogComponent {
  projectForm: FormGroup;
  messages = Messages;
  // Regions and sections mapping
  regionToSections: { [key: string]: string[] } = {
    'Northern': ['Omineca', 'Peace', 'Skeena'],
    'Thompson Cariboo': ['Cariboo', 'Thompson'],
    'Kootenay Okanagan': ['Kootenay', 'Okanagan'],
    'South Coast': ['South Coast'],
    'West Coast': ['Central Coast/North Island', 'Haida Gwaii/South Island']
  };

  businessAreas = ['Area 1', 'Area 2', 'Area 3']; // Example data
  forestRegions = ['Region 1', 'Region 2', 'Region 3']; // Example data
  forestDistricts = ['District 1', 'District 2', 'District 3']; // Example data
  bcParksRegions = Object.keys(this.regionToSections);
  bcParksSections: string[] = []; // Dynamically updated based on the selected region

  constructor(
    private readonly fb: FormBuilder,
    private readonly dialog: MatDialog,
    private readonly dialogRef: MatDialogRef<CreateNewProjectDialogComponent>,
    private readonly snackbarService: MatSnackBar,
    private http: HttpClient,
    private projectEventService: ProjectEventService
  ) {
    this.projectForm = this.fb.group({
      projectName: ['', [Validators.required, Validators.maxLength(50)]],
      latLong: ['', [Validators.maxLength(25)]],
      businessArea: ['', [Validators.required]],
      forestRegion: ['', [Validators.required]],
      forestDistrict: ['', [Validators.required]],
      bcParksRegion: ['', [Validators.required]],
      bcParksSection: [{ value: '', disabled: true }, Validators.required],
      projectLead: ['', [Validators.maxLength(50)]],
      projectLeadEmail: ['', [Validators.email, Validators.maxLength(50)]],
      siteUnitName: ['', [Validators.maxLength(50)]],
      closestCommunity: ['', [Validators.required, Validators.maxLength(50)]],
  });

  // Dynamically enable/disable bcParksSection based on bcParksRegion selection
  this.projectForm.get('bcParksRegion')?.valueChanges.subscribe((region: string | number) => {
    if (region) {
      this.projectForm.get('bcParksSection')?.enable();
      this.bcParksSections = this.regionToSections[region] || [];
    } else {
      this.projectForm.get('bcParksSection')?.reset();
      this.projectForm.get('bcParksSection')?.disable();
      this.bcParksSections = [];
    }
  });
  }

  getErrorMessage(controlName: string): string | null {
    const control = this.projectForm.get(controlName);
    if (!control || !control.errors) return null;

    if (control.hasError('required')) {
      return this.messages.requiredField;
    }
    if (control.hasError('maxlength')) {
      return this.messages.maxLengthExceeded;
    }
    if (control.hasError('email')) {
      return this.messages.invalidEmail;
    }

    return null; // No errors
  }

  onCreate(): void {
    if (this.projectForm.valid) {
      const projectData = new Project({
        projectTypeCode: { projectTypeCode: 'FUEL_MGMT' },
        projectNumber: undefined,
        siteUnitName: 'Vancouver Forest Unit',
        forestAreaCode: { forestAreaCode: 'WEST' },
        generalScopeCode: { generalScopeCode: 'SL_ACT' },
        programAreaGuid: '27602cd9-4b6e-9be0-e063-690a0a0afb50',
        projectName: this.projectForm.get('projectName')?.value,
        projectLead: this.projectForm.get('projectLead')?.value,
        projectLeadEmailAddress: this.projectForm.get('projectLeadEmail')?.value,
        projectDescription: 'This is a comprehensive forest management project focusing on sustainable practices',
        closestCommunityName: this.projectForm.get('closestCommunity')?.value,
        totalFundingRequestAmount: 100000.0,
        totalAllocatedAmount: 95000.0,
        totalPlannedProjectSizeHa: 500.0,
        totalPlannedCostPerHectare: 200.0,
        totalActualAmount: 0.0,
        isMultiFiscalYearProj: false,
        forestRegionOrgUnitId: 1001,
        forestDistrictOrgUnitId: 2001,
        fireCentreOrgUnitId: 3001,
        bcParksRegionOrgUnitId: 4001,
        bcParksSectionOrgUnitId: 5001,
      });
      console.log('Form data:', this.projectForm.value);

      // Prepare headers with Bearer token
      const token = '290702B1B4A4C08DE0630409228E8D7D'; // Replace with your actual token
      const headers = new HttpHeaders().set('Authorization', `Bearer ${token}`);

      // API endpoint URL
      const url = 'http://localhost:8080/wfprev-api/projects'; // Replace with your actual endpoint

      // Send POST request to create a new project
      this.http.post(url, projectData, { headers }).subscribe(
        (response: any) => {
          console.log('Project created successfully:', response);
          // Show success message
          this.snackbarService.open(
            this.messages.projectCreatedSuccess,
            'OK',
            { duration: 10000, panelClass: 'snackbar-success' }
          );
          this.projectEventService.triggerRefreshProjects(); // Emit the event

          // Close the dialog and pass the response data if needed
          this.dialogRef.close(true);
        },
        (error: any) => {
          console.error('Error creating project:', error);
          // Check if the error is due to a duplicate project name
            // Handle other errors
            this.snackbarService.open(
              'An error occurred while creating the project. Please try again.',
              'OK',
              { duration: 10000, panelClass: 'snackbar-error' }
            );
          }
      );
    }
  }
  onCancel(): void {
    const dialogRef = this.dialog.open(ConfirmationDialogComponent, {
      data: {
        indicator: 'confirm-cancel',
      },
      width: '500px',
    });

    dialogRef.afterClosed().subscribe((result: any) => {
      if (result) {
        this.dialogRef.close(); // Close the "Create New Project" dialog
      }
    });
  }
}
