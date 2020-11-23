import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AddCommentService } from '../services/addComment.service';
import { AlertifyService } from '../services/alertify.service';

@Component({
  selector: 'app-comment-card',
  templateUrl: './comment-card.component.html',
  styleUrls: ['./comment-card.component.css']
})
export class CommentCardComponent implements OnInit {

  @Input() comment : any;

  isEdit = false;
  newComment: string;
  commentId: number;
  loggedinUser: string;
  admin: string;

  constructor(private addCommentService: AddCommentService,
              private alertify: AlertifyService,
              private router: Router) { }

  ngOnInit() {
  }

  edit() {
    this.newComment=this.comment.comment;
    this.isEdit = true;
  }

  updateComment(id: any) {
    this.commentId = Number(id);
    this.addCommentService.updateComment(this.commentId, this.newComment).subscribe(
      data => {
        this.isEdit = false;
        this.newComment = "";
        this.router.routeReuseStrategy.shouldReuseRoute = () => false;
        this.router.onSameUrlNavigation = 'reload';
        this.router.navigate([this.router.url]);
      });

  }

  deleteComment(id:number) {
    this.addCommentService.deleteComment(id).subscribe(
      data => {
        this.alertify.success("Comment deleted");
        this.router.routeReuseStrategy.shouldReuseRoute = () => false;
        this.router.onSameUrlNavigation = 'reload';
        this.router.navigate([this.router.url]);
      }
    )
  }

  loggedin() {
    this.loggedinUser = localStorage.getItem('token');
    return this.loggedinUser;
  }

  isAdmin() {
    this.admin = localStorage.getItem('admin');
    return this.admin;
  }

}
