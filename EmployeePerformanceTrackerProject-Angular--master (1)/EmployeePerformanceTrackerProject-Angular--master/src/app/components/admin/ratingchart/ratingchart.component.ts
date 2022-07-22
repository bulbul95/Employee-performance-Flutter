import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { EChartsCoreOption, EChartsOption } from 'echarts';
import { EmployeeRatings } from '../empmanage/empmanageModel';

@Component({
  selector: 'app-ratingchart',
  templateUrl: './ratingchart.component.html',
  styleUrls: ['./ratingchart.component.css']
})
export class RatingchartComponent implements OnInit {
  Employees: EmployeeRatings[] = [];
  nameList: string[] = [];
  rankList: object[] = [];

  constructor(private http: HttpClient) {
    this.showEmployeePerformance();
  }

  option: EChartsOption = {
    xAxis: {
      type: 'category',
      data: this.nameList
    },
    yAxis: {
      type: 'value'
    },
    series: [
      {
        data: this.rankList,
        type: 'bar'
      }
    ]
  };
  ngOnInit(): void {


  }


  showEmployeePerformance() {
    const headers = { 'content-Type': 'application/json' };
    this.http.get<any>('http://localhost:9090/employeeInformation/getAll', { headers: headers }).subscribe(map => {
      console.log(map.Data);
      this.Employees = map.Data;
      this.Employees.forEach(emp => {
        emp.rank = this.getRank(emp)
        this.nameList.push(emp.firstname);

        if (emp.rank > 50) {
          this.rankList.push(
            {
              value: emp.rank,
              itemStyle: {
                color: '#1F618D'
              }
            }
          );
        } else if (emp.rank > 40) {
          this.rankList.push(
            {
              value: emp.rank,
              itemStyle: {
                color: '#90E04E'
              }
            }
          );

        } else if (emp.rank > 30) {
          this.rankList.push(
            {
              value: emp.rank,
              itemStyle: {
                color: '#F1C40F'
              }
            }
          );

        } else {
          this.rankList.push({
            value: emp.rank,
            itemStyle: {
              color: '#EC7063'
            }

          });
        }
        console.log("foreach called");
      });
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
