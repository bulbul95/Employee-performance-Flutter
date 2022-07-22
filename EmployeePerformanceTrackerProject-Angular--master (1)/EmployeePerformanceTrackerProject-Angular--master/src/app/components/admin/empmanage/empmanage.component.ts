import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { EmployeeRatings } from './empmanageModel';

@Component({
  selector: 'app-empmanage',
  templateUrl: './empmanage.component.html',
  styleUrls: ['./empmanage.component.css']
})
export class EmpmanageComponent implements OnInit {
  isSubmitted = false;
  employeeRatings:EmployeeRatings = new EmployeeRatings()

  constructor( private http:HttpClient, private toastr: ToastrService) { }

  ngOnInit(): void {   
  }

  save() {  
   this.isSubmitted = true;
    console.log(this.employeeRatings.isEligibleForPromotion);
    const headers = { 'content-Type': 'application/json' };
    this.http.post<any>("http://localhost:9090/saveEmpRatings", JSON.stringify(this.employeeRatings), { headers: headers })
      .subscribe(data => {
        console.log(data);     
        this.toastr.success( "","Save Success")   
      } ,err => {
        console.log(err);
        this.toastr.error("Save Failed")
      })
       
  }

}
