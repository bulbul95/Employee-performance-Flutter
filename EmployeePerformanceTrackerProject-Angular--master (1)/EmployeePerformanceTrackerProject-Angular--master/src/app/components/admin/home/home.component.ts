import { Component, OnInit } from '@angular/core';
import { EChartsOption } from 'echarts';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  option: EChartsOption = {
    xAxis: {
      type: 'category',
      data: ['Amina', 'Nayeem', 'Khalil', 'Mehdi', 'Rakib', 'Rabu', 'Bodrul']
    },
    yAxis: {
      type: 'value'
    },
    series: [
      {
        data: [
          450,
          {
            value: 1000,
            itemStyle: {
              color: '#a90000'
            }
          },
          900,
          700,
          100,
          600,
          770,
          110,
          900
        ],
        type: 'bar'
      }
    ]
  };

  constructor() { }

  ngOnInit(): void {
  }


  
  

}
