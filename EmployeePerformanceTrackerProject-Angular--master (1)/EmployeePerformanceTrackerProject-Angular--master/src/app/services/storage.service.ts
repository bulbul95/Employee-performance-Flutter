import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class StorageService {

  constructor() { }
  saveLoginInfo(data: any, usertype: string) {
    let newData = JSON.stringify(data);
    localStorage.setItem("current_user", newData);
    localStorage.setItem("isLoggedIn", 'true');
    localStorage.setItem("usertype", usertype)
  }

  getCurrentUser() {
    try {
      let struser = localStorage.getItem("current_user") || "{}"
      let user = JSON.parse(struser);
      return user;
    } catch (e) {
      return {};
    }

  }
  getUserType() {
    let userType = ""
    try {
      let userType = localStorage.getItem("usertype")     
      return userType;
    } catch (e) {
      return userType;
    }
  }

  isAdmin() {
    console.log(this.getUserType());
    if (this.getUserType() == "admin") {
      return true;
    } else {
      return false;
    }
  }
  isLoggedIn() {
    try {
      let isLoggedinStr = localStorage.getItem("isLoggedIn") || false
      return Boolean(isLoggedinStr);
    } catch (e) {
      return false;
    }
  }

  logout() {
    try {
      localStorage.clear();
    } catch (e) {
      console.log(e);

    }

  }


}
