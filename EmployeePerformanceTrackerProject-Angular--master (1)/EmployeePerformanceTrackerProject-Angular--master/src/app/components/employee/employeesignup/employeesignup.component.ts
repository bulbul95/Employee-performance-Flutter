import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { EmployeeModel } from './employeesignup.model';

@Component({
  selector: 'app-employeesignup',
  templateUrl: './employeesignup.component.html',
  styleUrls: ['./employeesignup.component.css']
})
export class EmployeesignupComponent implements OnInit {

  submitted = false;

  empsign: EmployeeModel = new EmployeeModel();
  
  constructor(private http: HttpClient,private toastr:ToastrService) { }

  ngOnInit(): void {
  }

  employeesave() {
    this.submitted = true;
    const headers = { 'content-Type': 'application/json' };
    this.http.post("http://localhost:9090/empSignup", JSON.stringify(this.empsign), { headers: headers }).subscribe(data => {
      console.log(data);
      this.toastr.info("Sign up Compleate")
    })
  }

}
