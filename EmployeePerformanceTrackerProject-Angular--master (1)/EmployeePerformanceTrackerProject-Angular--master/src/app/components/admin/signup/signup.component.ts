import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { User } from './user.model';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {
  submitted = false;

  user: User = new User();
  constructor(private http: HttpClient,private toastr:ToastrService) { }

  ngOnInit(): void {
  }

  save() {
    this.submitted = true;
    const headers = { 'content-Type': 'application/json' };
    this.http.post("http://localhost:9090/signup", JSON.stringify(this.user), { headers: headers }).subscribe(data => {
      console.log(data);
      this.toastr.info("Sign up Compleate")
    })
  }



}
