import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Employee } from '../employee-add/employee.model';

@Component({
  selector: 'app-showemployee',
  templateUrl: './showemployee.component.html',
  styleUrls: ['./showemployee.component.css']
})
export class ShowemployeeComponent implements OnInit {
  employee: Employee = new Employee();
  constructor(private http: HttpClient, private router: Router,private toastr:ToastrService) {
    this.loadEmployee();
  }
  Employees: any ;
  isShowTable: boolean = false;
  isSave: boolean = true;

  ngOnInit(): void {
    this.loadEmployee();
  }


  toggleProductList() {
    this.isShowTable = !this.isShowTable;
    console.log(this.isShowTable);
  }


  loadEmployee() {    
    const headers = { 'content-Type': 'application/json' };
    this.http.get<any>('http://localhost:9090/employee/getAll', { headers: headers }).subscribe(map => {
      console.log(map.data);
      this.Employees = map.data;
    })
  }

  
  getFormattedDate(ts:any){
return new Date(ts).toLocaleDateString('en-BD')
  }

  editEmployee(employee: any) {       
    this.employee.id = employee.id;
    this.employee.firstname = employee.firstname;
    this.employee.lastname = employee.lastname;
    this.employee.email = employee.email;
    this.employee.gender = employee.gender;
    this.employee.qualification = employee.qualification;
    this.employee.department = employee.department;
    this.employee.date_of_birth = employee.date_of_birth;
    this.employee.nationality = employee.nationality;
    this.employee.employeementHistory = employee.employeementHistory;
    this.router.navigate(['/addemp'],{state:{emp:employee, isSave:false}}) 
  }

  deleteEmployee(employee: any) {    
    const headers = { 'content-Type': 'application/json' };
    this.http.get("http://localhost:9090/employee/delete/" + employee.id, { headers: headers })
      .subscribe(data => {
        console.log(data);
        this.loadEmployee();
        this.toastr.warning( "Employee delete") ;
      })


  }


  

}


