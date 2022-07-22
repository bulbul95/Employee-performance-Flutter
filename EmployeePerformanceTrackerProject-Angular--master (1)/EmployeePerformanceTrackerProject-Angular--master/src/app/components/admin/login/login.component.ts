import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { LoginService } from 'src/app/services/login.service';
import { StorageService } from 'src/app/services/storage.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  formGroup: FormGroup;
  submitted = false;
  constructor(private fb: FormBuilder, private loginService: LoginService, private storageService: StorageService,
    private route: Router, private toastr: ToastrService) {
    this.formGroup = this.fb.group(
      {
        email: ['', [Validators.required]],
        password: ['', [Validators.required]]
      }
    )
  }

  ngOnInit(): void {
    var isLoggedIn = this.storageService.isLoggedIn();
    if (isLoggedIn) this.route.navigate(['']);

  }

  get f() {
    return this.formGroup.controls;
  }


  adminLogin() {
    this.submitted = true;
    this.loginService.adminLogin(this.formGroup.value)
      .subscribe(res => {
        this.storageService.saveLoginInfo(res.data, "admin");
        // this.toastr.success("Login Success")
        this.route.navigate(['']);
      }, err => {
        console.log(err);
        this.toastr.error("invalid email or password")
        this.route.navigate(['/login']);

      })
  }

  employeeLogin() {
    console.log(this.formGroup.value);

    this.submitted = true;
    this.loginService.employeeLogin(this.formGroup.value)
      .subscribe(res => {
        this.storageService.saveLoginInfo(res.data, "employee");
        this.route.navigate(['']);
      }, err => {
        console.log(err);
        this.toastr.error("Email or password invalid")
        this.route.navigate(['/login']);


      })
  }

  signup(): void {
    this.route.navigateByUrl("signup")

  }

  empsignup(): void {
    this.route.navigateByUrl("empsignup")
  }
}