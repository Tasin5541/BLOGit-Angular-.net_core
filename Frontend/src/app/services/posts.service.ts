import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {map} from 'rxjs/operators';
import { Iposts } from '../Iposts.interface';
import { Observable } from 'rxjs';
import { Blog } from '../model/blog';

@Injectable({
  providedIn: 'root'
})
export class PostsService {

constructor(private http:HttpClient) { }

// getPost(id: number) {
//   console.log(this.getAllPosts());
//   return this.getAllPosts().pipe(
//     map(post => {
//       return post.find(p => p.Id === id);
//     })
//   );
// }

getPost(id: number) {
  return this.http.get('http://localhost:53744/api/Post/findPost/'+id);
}

// http://localhost:53744/api/Post?

getAllPosts(): Observable<Blog[]> {
  return this.http.get<Blog[]>('http://localhost:53744/api/Post');
}

getUserPosts(userName: string) {
  return this.http.get<Blog[]>('http://localhost:53744/api/Post/userPost/'+userName);
}

updatePost(id:number, title:string, description:string) {
  return this.http.put('http://localhost:53744/api/Post/edit/'+id,
  {Id:id,newTitle:title,newDescription:description});
}

deletePost(id:number) {
  return this.http.delete('http://localhost:53744/api/Post/delete/'+id);
}
}
