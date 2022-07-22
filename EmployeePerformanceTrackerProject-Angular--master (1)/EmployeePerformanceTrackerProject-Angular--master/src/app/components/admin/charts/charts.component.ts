import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { EChartsOption } from 'echarts';
import { EmployeeRatings } from '../empmanage/empmanageModel';

@Component({
  selector: 'app-charts',
  templateUrl: './charts.component.html',
  styleUrls: ['./charts.component.css']
})
export class ChartsComponent implements OnInit {

  Employees: EmployeeRatings[] = [];
  nameList: string[] = [];
  rankList: object[] = [];
  vg = 0;
  g = 0;
  avg = 0;
  bavg = 0;
  option1: any;
 

  constructor(private http: HttpClient) {
    this.showEmployeePerformance();
    this.showEmployeePerformance1();
    this.showEmployeePerformance2();
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
        type: 'line'
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

        if(emp.rank>50){
          this.rankList.push(
            {
              value:emp.rank,
              itemStyle: {
                color: '#1F618D'
              }
            }
            );
        }else if(emp.rank>40){
          this.rankList.push(
            {
              value:emp.rank,
              itemStyle: {
                color: '#90E04E'
              }
            }
            );

        }else if(emp.rank>30){
          this.rankList.push(
            {
              value:emp.rank,
              itemStyle: {
                color: '#F1C40F'
              }
            }
            );

        }else {
          this.rankList.push({
            value:emp.rank,
            itemStyle: {
              color: '#EC7063'
            }
          
          });
        }
        console.log("foreach called");
      });
    })
  }





//bar chart
showEmployeePerformance1() {
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
  this.option1 = {
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




//pie chart
option2: EChartsOption = {
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



showEmployeePerformance2() {
  const headers = { 'content-Type': 'application/json' };
  this.http.get<any>('http://localhost:9090/employeeInformation/getAll', { headers: headers }).subscribe(map => {
    console.log(map.Data);
    this.Employees = map.Data;
    this.Employees.forEach(emp => {
      emp.rank = this.getRank(emp)
      this.nameList.push(emp.firstname);

      if(emp.rank>50){
        this.rankList.push(
          {
            value:emp.rank,
            itemStyle: {
              color: '#1F618D'
            }
          }
          );
      }else if(emp.rank>40){
        this.rankList.push(
          {
            value:emp.rank,
            itemStyle: {
              color: '#90E04E'
            }
          }
          );

      }else if(emp.rank>30){
        this.rankList.push(
          {
            value:emp.rank,
            itemStyle: {
              color: '#F1C40F'
            }
          }
          );

      }else {
        this.rankList.push({
          value:emp.rank,
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
