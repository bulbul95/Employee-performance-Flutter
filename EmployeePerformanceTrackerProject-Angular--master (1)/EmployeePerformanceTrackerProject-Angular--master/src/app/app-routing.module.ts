import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeAddComponent } from './components/admin/employee-add/employee-add.component';
import { HomeComponent } from './components/admin/home/home.component';
import { ShowemployeeComponent } from './components/admin/showemployee/showemployee.component';
import { DashbordComponent } from './components/admin/dashbord/dashbord.component';
import { LoginComponent } from './components/admin/login/login.component';
import { SignupComponent } from './components/admin/signup/signup.component';
import { AdminlayoutComponent } from './components/adminlayout/adminlayout.component';
import { AuthGuard } from './guards/auth.guard';
import { EmpmanageComponent } from './components/admin/empmanage/empmanage.component';

import { EmployeehomeComponent } from './components/employee/employeehome/employeehome.component';
import { EmployeesignupComponent } from './components/employee/employeesignup/employeesignup.component';
import { EmployeePerformanceComponent } from './components/admin/employee-performance/employee-performance.component';
import { ReportpdfComponent } from './components/admin/reportpdf/reportpdf.component';
import { RatingchartComponent } from './components/admin/ratingchart/ratingchart.component';
import { ChartsComponent } from './components/admin/charts/charts.component';
import { PerformanceChartComponent } from './components/admin/performance-chart/performance-chart.component';

const routes: Routes = [
  
  {path:'login', component:LoginComponent},


  {path:'' , component:AdminlayoutComponent, canActivateChild: [AuthGuard], children:[
    {path:'dash', component: DashbordComponent},
    {path:'', component: DashbordComponent},
    {path : "addemp" , component:EmployeeAddComponent},
    {path : "home" , component:HomeComponent},
    {path : "show" , component:ShowemployeeComponent},
    {path : "empmanage" , component:EmpmanageComponent},
    {path : "empperform" , component:EmployeePerformanceComponent},
    {path : "pdf", component:ReportpdfComponent},
    {path : "chart", component:RatingchartComponent},
    {path : "allchart", component:ChartsComponent},
    {path : "performChart", component:PerformanceChartComponent},
    

  ]},
  {path: 'signup', component: SignupComponent},  
  {path: 'empsignup', component: EmployeesignupComponent},  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
