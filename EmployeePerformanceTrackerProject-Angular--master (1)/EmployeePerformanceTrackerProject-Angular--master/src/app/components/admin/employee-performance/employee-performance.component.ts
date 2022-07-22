import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { EmployeeRatings } from '../empmanage/empmanageModel';

@Component({
  selector: 'app-employee-performance',
  templateUrl: './employee-performance.component.html',
  styleUrls: ['./employee-performance.component.css']
})
export class EmployeePerformanceComponent implements OnInit {
  employee: EmployeeRatings = new EmployeeRatings();
  constructor(private http: HttpClient, private router: Router, private toastr: ToastrService) {
    this.showEmployeePerformance();
  }
  Employees: EmployeeRatings[] = [];
  isShowTable: boolean = false;
  isSave: boolean = true;

  ngOnInit(): void {
  }

  showEmployeePerformance() {
    const headers = { 'content-Type': 'application/json' };
    this.http.get<any>('http://localhost:9090/employeeInformation/getAll', { headers: headers }).subscribe(map => {
      console.log(map.Data);
      this.Employees = map.Data;

      this.Employees.forEach(emp => {
        emp.rank = this.getRank(emp)
        console.log("foreach called");

      });

      this.Employees.sort((first, second) => {
        return second.rank - first.rank
      })
    })





  }


  getRank(employee: any) {
    let rank = employee.acceptsCriticismScore
      + employee.regardingTrainingScore
      + employee.equiSoftHandleScore
      + employee.rulsPolicyFolloScore
      + employee.knoledgeShareWithCoworkersScore

      + employee.coworkersTreatedRespectScore
      + employee.acceptsCriticismScore
      + employee.teamPlayerScore
      + employee.teameResourcesShareScore
      + employee.executesTaskScore

      + employee.acceptsMistakeScore
      + employee.canWorkWithoutSuperviseScore
      + employee.capableTakingAnyDecisionScore
      + employee.highPressureSiruationManageScore
      + employee.motivateCoworkersToFinishScore


    return rank;
  }

}
