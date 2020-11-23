import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { AlertifyService } from '../services/alertify.service';
import { AuthService } from '../services/auth.service';
import { EncryptionService } from '../services/encryption.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private authService: AuthService,
              private alertify: AlertifyService,
              private router: Router) { }

  ngOnInit() {

  }

  onLogin(loginForm: NgForm) {
    let UserArray = [];
    if (this.authService.getAllUsers()) {
      this.authService.getAllUsers().subscribe(data => {
        UserArray = data;
        console.log(UserArray)

        console.log(loginForm.value);
        const token = this.authService.authUser(loginForm.value, UserArray);
        console.log(token);
        if(token){
          if(!token.ban){
            localStorage.setItem('token', token.userName);
            localStorage.setItem('email', token.email);
            localStorage.setItem('admin', token.admin);
            localStorage.setItem('id', token.id);
            this.alertify.success("Login Successfull");
            this.router.navigate(['/home']);
          } else {
            this.alertify.error("You have been banned");
          }

        } else {
          this.alertify.error("Login unsuccessfull");
        }
      });
    } else {
      this.alertify.error("Login unsuccessfull");
    }
  }

}
