import { Component, OnInit } from '@angular/core';
import { Iposts } from '../Iposts.interface';
import { Blog } from '../model/blog';
import { PostsService } from '../services/posts.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  //posts: Blog[];
  posts: any[];
  constructor(private postsService: PostsService) { }

  ngOnInit() {
    this.postsService.getAllPosts().subscribe(
      post_data=>{
        this.posts = post_data.reverse();
        console.log(this.posts);
      }, error => {
        console.log('error');
      }
    )
    // this.http.get('data/posts.json').subscribe(
    //   post_data=>{
    //     this.posts = post_data;
    //   }
    // );
  }

}
