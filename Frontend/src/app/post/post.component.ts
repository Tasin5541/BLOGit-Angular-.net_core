import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Blog} from '../model/blog';
import { Comment} from '../model/comment';
import { AddCommentService } from '../services/addComment.service';
import { AlertifyService } from '../services/alertify.service';
import { BlogBannerService } from '../services/blogBanner.service';
import { CommentBoxService } from '../services/commentBox.service';
import { PostsService } from '../services/posts.service';

@Component({
  selector: 'app-post',
  templateUrl: './post.component.html',
  styleUrls: ['./post.component.css']
})
export class PostComponent implements OnInit {

public postId: number;
post: Blog;
userSubmitted: boolean;
addCommentForm: FormGroup;
comment: Comment;
comments: any[];
currentUser = localStorage.getItem('token');
isEdit = false;
newTitle: string;
newDescription: string;
loggedinUser: string;
admin: string;

  constructor(private route: ActivatedRoute,
              private postsService: PostsService,
              private addCommentService: AddCommentService,
              private fb: FormBuilder,
              private commentBoxJS: CommentBoxService,
              private blogaBannerService: BlogBannerService,
              private alertify: AlertifyService,
              private router: Router) { }

  ngOnInit() {
    this.commentBoxJS.commentBox();
    this.CreateAddCommentForm();
    this.postId = +this.route.snapshot.params['id'];

    //fetch post
    this.route.params.subscribe(
      (params) => {
        this.postId = +params['id'];
        console.log(this.postId);
        this.fetchpost();
      }
    );

    //fetch comments
    this.fetchComments();
  }

  edit() {
    this.isEdit = true;
  }

  cancelUpdate() {
    this.isEdit = false;
  }

  updatePost(id: number) {
    this.postsService.updatePost(id, this.newTitle, this.newDescription).subscribe(
      data => {
        this.isEdit = false;
        this.fetchpost();
      }
    );

  }

  deletePost(id: number) {
    this.postsService.deletePost(id).subscribe(
      data => {
        this.addCommentService.deleteAllComment(id).subscribe(
          comment_data => {
            this.alertify.success("You have deleted the post");
            this.router.navigate(['/home']);
          }
        );
      }
    );
  }

  onSubmit() {
    this.userSubmitted = true;

    if(this.addCommentForm.valid) {
      this.addCommentService.addComment(this.commentData()).subscribe(
        data => {
          console.log(data);
          this.fetchComments();
        }
      );
      this.addCommentForm.reset();
      this.userSubmitted = false;

    }
  }

  CreateAddCommentForm() {
    this.addCommentForm = this.fb.group({
      CommentBody: [null]
    })
  }

  get CommentBody(){
    return this.addCommentForm.get('CommentBody') as FormControl;
  }

  commentData(): Comment {
    return this.comment = {
      postId: this.postId,
      comment: this.CommentBody.value,
      userName: localStorage.getItem('token'),
      commentedOn: new Date().toString()
    }
  }

  fetchComments() {
    this.addCommentService.getComments(this.postId).subscribe(
      comment_data=>{
        this.comments = comment_data.reverse();
        console.log(this.comments);
      }, error => {
        console.log('error');
      }
    );
  }

  fetchpost() {
    this.postsService.getPost(this.postId).subscribe(
      (data: Blog) => {
        this.post = data;
        this.blogaBannerService.banner();
        this.newTitle = this.post.title;
        this.newDescription = this.post.description;
      }
    );
  }

  loggedin() {
    this.loggedinUser = localStorage.getItem('token');
    this.commentBoxJS.commentBox();
    return this.loggedinUser;
  }

  isAdmin() {
    this.admin = localStorage.getItem('admin');
    return this.admin;
  }

}
