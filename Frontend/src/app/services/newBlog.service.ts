import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Blog } from '../model/blog';

@Injectable({
  providedIn: 'root'
})
export class NewBlogService {

constructor(private http:HttpClient) { }

// addBlog(blog: Blog){
//   let newBlog = [];
//   if(localStorage.getItem('Blogs')) {
//     newBlog = JSON.parse(localStorage.getItem('Blogs'));
//     newBlog = [blog, ...newBlog];
//   } else {
//     newBlog = [blog];
//   }
//   localStorage.setItem('Blogs', JSON.stringify(newBlog));
// }

addBlog(blog: Blog) {
  return this.http.post('http://localhost:53744/api/Post/post', blog);
}

newpostID() {
  if(localStorage.getItem('PID')) {
    localStorage.setItem('PID', String(+localStorage.getItem('PID')+1));
    return +localStorage.getItem('PID');
  } else {
    localStorage.setItem('PID', '101');
    return 101;
  }
}
}
