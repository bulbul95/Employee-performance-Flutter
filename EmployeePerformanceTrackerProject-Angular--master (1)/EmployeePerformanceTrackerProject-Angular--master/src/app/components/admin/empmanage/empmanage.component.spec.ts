import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmpmanageComponent } from './empmanage.component';

describe('EmpmanageComponent', () => {
  let component: EmpmanageComponent;
  let fixture: ComponentFixture<EmpmanageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmpmanageComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmpmanageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
