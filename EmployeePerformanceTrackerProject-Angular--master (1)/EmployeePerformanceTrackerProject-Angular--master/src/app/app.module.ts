import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AdminlayoutComponent } from './components/adminlayout/adminlayout.component';
import { AdminheaderComponent } from './components/adminlayout/adminheader/adminheader.component';
import { AdminfooterComponent } from './components/adminlayout/adminfooter/adminfooter.component';
import { DashbordComponent } from './components/admin/dashbord/dashbord.component';
import { LoginComponent } from './components/admin/login/login.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SignupComponent } from './components/admin/signup/signup.component';
import { EmployeeAddComponent } from './components/admin/employee-add/employee-add.component';
import { HomeComponent } from './components/admin/home/home.component';
import { ShowemployeeComponent } from './components/admin/showemployee/showemployee.component';
import { EmpmanageComponent } from './components/admin/empmanage/empmanage.component';
import { CommonModule } from '@angular/common';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrModule } from 'ngx-toastr';

import { EmployeehomeComponent } from './components/employee/employeehome/employeehome.component';
import { EmployeesignupComponent } from './components/employee/employeesignup/employeesignup.component';
import { EmployeePerformanceComponent } from './components/admin/employee-performance/employee-performance.component';
import { ReportpdfComponent } from './components/admin/reportpdf/reportpdf.component';
import { RatingchartComponent } from './components/admin/ratingchart/ratingchart.component';
import { NgxEchartsModule } from 'ngx-echarts';

import { ChartsComponent } from './components/admin/charts/charts.component';
import { PerformanceChartComponent } from './components/admin/performance-chart/performance-chart.component';


@NgModule({
  declarations: [
    AppComponent,
    AdminlayoutComponent,
    AdminheaderComponent,
    AdminfooterComponent,
    DashbordComponent,
    LoginComponent,
    SignupComponent,
    EmployeeAddComponent,
    HomeComponent,
    ShowemployeeComponent,
    EmpmanageComponent,
    EmployeehomeComponent,
    EmployeesignupComponent,
    EmployeePerformanceComponent, 
    ReportpdfComponent, RatingchartComponent, ChartsComponent, PerformanceChartComponent,



  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
    CommonModule,
    BrowserAnimationsModule, // required animations module
    ToastrModule.forRoot(),
    
   
      NgxEchartsModule.forRoot({
        /**
         * This will import all modules from echarts.
         * If you only need custom modules,
         * please refer to [Custom Build] section.
         */
        echarts: () => import('echarts'), // or import('./path-to-my-custom-echarts')
      }),
    
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
