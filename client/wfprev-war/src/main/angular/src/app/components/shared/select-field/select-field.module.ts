import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { SelectFieldComponent } from './select-field.component';

@NgModule({
  declarations: [SelectFieldComponent],
  imports: [CommonModule, ReactiveFormsModule],
  exports: [SelectFieldComponent]
})
export class SelectFieldModule {} 