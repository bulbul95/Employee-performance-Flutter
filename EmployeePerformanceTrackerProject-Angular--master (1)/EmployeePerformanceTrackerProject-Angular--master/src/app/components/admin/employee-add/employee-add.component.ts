import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Employee } from './employee.model';

@Component({
  selector: 'app-employee-add',
  templateUrl: './employee-add.component.html',
  styleUrls: ['./employee-add.component.css']
})
export class EmployeeAddComponent implements OnInit {
  employee: Employee = new Employee();
  formGroup: FormGroup;
  submitted = false;
  constructor(private fb: FormBuilder, private router: Router, private http: HttpClient, private toastr: ToastrService) {
    this.formGroup = this.fb.group(
      {
        firstname: ['', [Validators.required]],
        lastname: ['', [Validators.required]],
        email: ['', [Validators.required]],
        male: ['', [Validators.required]],
        female: ['', [Validators.required]],
        qualification: ['', [Validators.required]],
        department: ['', [Validators.required]],
        date_of_birth: ['', [Validators.required]],
        nationality: ['', [Validators.required]],
        employeementHistory: ['', [Validators.required]],

      }
    )
  }

  get f() {
    return this.formGroup.controls;
  }

  Employees: any;
  isShowTable: boolean = false;
  isSave: boolean = true;

  ngOnInit(): void {

    if (history.state.isSave != undefined) {
      this.employee = history.state.emp
      this.isSave = history.state.isSave
    }

  }

  saveEmployee() {
    if (this.formGroup.invalid) {
      this.toastr.error("save failed")

    } else {
      this.submitted = true;
      console.log(this.employee.firstname);
      const headers = { 'content-Type': 'application/json' };
      this.http.post<any>("http://localhost:9090/employee/saveEmployee", JSON.stringify(this.employee), { headers: headers })
        .subscribe(data => {
          console.log(data);
          this.toastr.success("save successfull");
        }
        )
      //this.router.navigate(["/admin/show"]);
    }
  }
  toggleEmployeeList() {
    this.isShowTable = !this.isShowTable;
    console.log(this.isShowTable);
  }

  updateEmployee() {
    this.isSave = true;
    const headers = { 'content-Type': 'application/json' };
    this.http.post("http://localhost:9090/employee/update", JSON.stringify(this.employee), { headers: headers })
      .subscribe(data => {
        console.log(data);
      })
    this.employee = new Employee()
    // this.router.navigateByUrl("/admin/show");
    // this.submitted = true;
    this.toastr.info("Employee Update Compleate")
  }

  loadEmployee() {
    const headers = { 'content-Type': 'application/json' };
    this.http.get<any>('http://localhost:9090/employee/getAll', { headers: headers }).subscribe(map => {
      console.log(map.Data);
      this.Employees = map.Data;


    })
  }


}