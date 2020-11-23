import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Comment } from '../model/comment';

@Injectable({
  providedIn: 'root'
})
export class AddCommentService {

constructor(private http:HttpClient) { }

addComment(comment: Comment) {
  return this.http.post('http://localhost:53744/api/Comment/post', comment);
}

getComments(postId: number): Observable<Comment[]> {
  return this.http.get<Comment[]>('http://localhost:53744/api/Comment/findComment/'+postId);
}

getUserCommentCount(username:string) {
  return this.http.get('http://localhost:53744/api/Comment/userComment/'+username);
}

updateComment(id:number, newComment:string) {
  return this.http.put('http://localhost:53744/api/Comment/edit/'+id,{Id:id,newComment:newComment});
}

deleteComment(id:number) {
  return this.http.delete('http://localhost:53744/api/Comment/delete/'+id);
}

deleteAllComment(postId:number) {
  return this.http.delete('http://localhost:53744/api/Comment/deleteAll/'+postId);
}
}
