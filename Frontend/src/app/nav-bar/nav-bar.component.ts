import { Component, OnInit } from '@angular/core';
import { AlertifyService } from '../services/alertify.service';

@Component({
  selector: 'app-nav-bar',
  templateUrl: './nav-bar.component.html',
  styleUrls: ['./nav-bar.component.css']
})
export class NavBarComponent implements OnInit {

  loggedinUser: string;
  admin: string;

  constructor(private alertify: AlertifyService) { }

  ngOnInit() {
  }

  loggedin() {
    this.loggedinUser = localStorage.getItem('token');
    return this.loggedinUser;
  }

  isAdmin() {
    this.admin = localStorage.getItem('admin');
    return this.admin;
  }

  onLogout() {
    localStorage.removeItem('token');
    localStorage.removeItem('email');
    localStorage.removeItem('admin');
    localStorage.removeItem('ban');
    localStorage.removeItem('id');
    this.alertify.error("Logged out");
  }

}
