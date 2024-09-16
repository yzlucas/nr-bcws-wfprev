import { moduleMetadata, type Meta, type StoryObj } from '@storybook/angular';
import { AppComponent } from '@app/app.component';

const meta: Meta<AppComponent> = {
  title: 'First-Storyboook',
  component: AppComponent,
  tags: ['autodocs'], 
  decorators: [
    moduleMetadata({
      declarations: [AppComponent]
    })
  ]
};

export default meta;
type Story = StoryObj<AppComponent>;

export const example: Story = {
};
