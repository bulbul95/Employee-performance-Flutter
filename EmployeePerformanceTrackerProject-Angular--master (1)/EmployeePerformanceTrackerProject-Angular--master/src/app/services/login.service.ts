import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(private http: HttpClient) { }

  adminLogin(data: any): Observable<any>{
    return this.http.post<any>('http://localhost:9090/adminlogin', data);
  }


  employeeLogin(data: any): Observable<any>{
    return this.http.post<any>('http://localhost:9090/employeelogin', data);
 
}
}
