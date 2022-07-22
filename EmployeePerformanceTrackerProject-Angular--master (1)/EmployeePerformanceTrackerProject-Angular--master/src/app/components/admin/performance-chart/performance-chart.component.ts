import { Component, OnInit } from '@angular/core';
import { EmployeeRatings } from '../empmanage/empmanageModel';
import { EChartsCoreOption, EChartsOption } from 'echarts';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-performance-chart',
  templateUrl: './performance-chart.component.html',
  styleUrls: ['./performance-chart.component.css']
})
export class PerformanceChartComponent implements OnInit {
  Employees: EmployeeRatings[] = [];
  vg = 0;
  g = 0;
  avg = 0;
  bavg = 0;
  option: any

  nameList: string[] = [];
  rankList: object[] = [];
  constructor(private http: HttpClient) {


  }


  ngOnInit(): void {
    this.showEmployeePerformance();


  }


  showEmployeePerformance() {
    const headers = { 'content-Type': 'application/json' };
    this.http.get<any>('http://localhost:9090/employeeInformation/getAll', { headers: headers }).subscribe(map => {
      console.log(map.Data);
      this.Employees = map.Data;
      this.Employees.forEach(emp => {
        emp.rank = this.getRank(emp)

        if (emp.rank > 50) {
          this.vg++
        } else if (emp.rank > 40) {
          this.g++


        } else if (emp.rank > 30) {
          this.avg++
        } else {
          this.bavg++
        }
        console.log("foreach called");
      });


      this.generateChart();

    })
  }
  generateChart() {
    this.option = {
      legend: {},
      tooltip: {
        trigger: 'axis',
        showContent: false
      },
      dataset: {
        source: [
          ['name', 'count'],
          ['very Good', this.vg],
          ['Good', this.g],
          ['average', this.avg],
          ['below average', this.bavg]

        ]
      },
      xAxis: { type: 'category' },
      yAxis: { gridIndex: 0 },
      grid: { top: '55%' },
      series: [
        {
          type: 'pie',
          id: 'pie',
          radius: '30%',
          center: ['50%', '25%'],
          emphasis: {
            focus: 'self'
          },
          label: {
            formatter: '{b}: {@count}  ({d}%)'
          },
          encode: {
            itemName: 'name',
            value: 'count',
            tooltip: 'count'
          }
        }
      ]
    };
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
