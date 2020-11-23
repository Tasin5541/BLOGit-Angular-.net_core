import { Component, OnInit } from '@angular/core';
import { Blog } from '../model/blog';
import { AddCommentService } from '../services/addComment.service';
import { PostsService } from '../services/posts.service';

@Component({
  selector: 'app-userDasboard',
  templateUrl: './userDasboard.component.html',
  styleUrls: ['./userDasboard.component.css']
})
export class UserDasboardComponent implements OnInit {

  commentCount: any;
  userName = localStorage.getItem('token');
  userEmail = localStorage.getItem('email');
  posts: Blog[];
  postCount: number;

  constructor(private commentService: AddCommentService,
              private postService: PostsService) { }

  ngOnInit() {
    this.commentService.getUserCommentCount(this.userName).subscribe(
      comment => {
        this.commentCount = comment;
      }
    );

    this.postService.getUserPosts(this.userName).subscribe(
      posts => {
        this.posts = posts;
        this.postCount = posts.length;
      }
    );
  }

}
