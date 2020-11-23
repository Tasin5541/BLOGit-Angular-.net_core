import { Component, OnInit } from '@angular/core';
import { AlertifyService } from '../services/alertify.service';
import { AuthService } from '../services/auth.service';
import { UserServiceService } from '../services/user-service.service';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})
export class TableComponent implements OnInit {

  users: any[];
  isSearch = false;
  searchName: string;
  searchInput: string;

  constructor(private authService: AuthService,
              private userService: UserServiceService,
              private alertify: AlertifyService) { }



  ngOnInit() {
    this.fetchUsers();
  }

  fetchUsers() {
    this.authService.getAllUsers().subscribe(data => {
      this.users = data;
      console.log(this.users);
    });
  }

  banFunc(idstring) {
    var id = Number(idstring);
    console.log(id);
    this.userService.banUser(id).subscribe(data => {
      console.log(data);
      if(!this.isSearch) {
        this.fetchUsers();
      } else {
        this.searchUser(this.searchName);
      }

    });
  }

  adminFunc(idstring) {
    var id = Number(idstring);
    this.userService.adminUser(id).subscribe(data => {
      console.log(data);
      if(!this.isSearch) {
        this.fetchUsers();
      } else {
        this.searchUser(this.searchName);
      }
    });
  }

  search() {
    console.log(this.searchInput);
    this.searchUser(this.searchInput);
  }

  searchUser(name) {
    this.searchName = name;
    this.isSearch = true;
    this.userService.getUserByName(name).subscribe(data => {
      if(data) {
        this.users = [(data)];
        this.searchInput = '';
      } else {
        this.alertify.error("No such user");
      }

    });
  }

  refreshSearch() {
    this.isSearch = false;
    this.fetchUsers();
  }

}
