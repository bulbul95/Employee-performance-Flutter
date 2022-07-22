import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { StorageService } from 'src/app/services/storage.service';

@Component({
  selector: 'app-adminheader',
  templateUrl: './adminheader.component.html',
  styleUrls: ['./adminheader.component.css']
})
export class AdminheaderComponent implements OnInit {

  constructor(private service:StorageService, private router:Router) { }

  ngOnInit(): void {

  }

  logout(){
    this.service.logout();
    this.router.navigateByUrl("/login");
  }


  isAdmin(){
  let admin =  this.service.isAdmin();
  
  return admin;
  }
  
}
