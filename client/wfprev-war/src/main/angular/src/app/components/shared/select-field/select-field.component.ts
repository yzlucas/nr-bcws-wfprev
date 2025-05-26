import { Component, Input } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-select-field',
  templateUrl: './select-field.component.html',
  styleUrls: ['./select-field.component.scss']
})
export class SelectFieldComponent {
  @Input() label!: string;
  @Input() options: { value: string, label: string }[] = [];
  @Input() control!: FormControl;
  @Input() id: string = '';
  @Input() placeholder: string = 'Select';
  @Input() required: boolean = false;
} 