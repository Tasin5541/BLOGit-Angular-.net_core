import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {HttpClientModule} from '@angular/common/http'
import { Routes, RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavBarComponent } from './nav-bar/nav-bar.component';
import { HomeComponent } from './home/home.component';
import { WelcomeComponent } from './welcome/welcome.component';
import { BlogCardComponent } from './blog-card/blog-card.component';
import { PostsService } from './services/posts.service';
import { PostComponent } from './post/post.component';
import { RegistrationComponent } from './registration/registration.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { UserServiceService } from './services/user-service.service';
import { AlertifyService } from './services/alertify.service';
import { LoginComponent } from './login/login.component';
import { AuthService } from './services/auth.service';
import { NewBlogComponent } from './newBlog/newBlog.component';
import { NewBlogService } from './services/newBlog.service';
import { CommentCardComponent } from './comment-card/comment-card.component';
import { AdminPanelComponent } from './adminPanel/adminPanel.component';
import { TableComponent } from './table/table.component';
import { ScrollToTopComponent } from './scrollToTop/scrollToTop.component';
import { UserDasboardComponent } from './userDasboard/userDasboard.component';

const appRoutes: Routes = [
  {path: '', component: WelcomeComponent},
  {path: 'home', component: HomeComponent},
  {path: 'post/:id', component: PostComponent},
  {path: 'register', component: RegistrationComponent},
  {path: 'login', component: LoginComponent},
  {path: 'newBlog', component: NewBlogComponent},
  {path: 'adminPanel', component: AdminPanelComponent},
  {path: 'dashboard', component: UserDasboardComponent}
]

@NgModule({
  declarations: [
    AppComponent,
      NavBarComponent,
      HomeComponent,
      WelcomeComponent,
      BlogCardComponent,
      PostComponent,
      RegistrationComponent,
      LoginComponent,
      NewBlogComponent,
      CommentCardComponent,
      AdminPanelComponent,
      TableComponent,
      ScrollToTopComponent,
      UserDasboardComponent
   ],
  imports: [
    BrowserModule,
    HttpClientModule,
    RouterModule.forRoot(appRoutes),
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [
    PostsService,
    UserServiceService,
    AlertifyService,
    AuthService,
    NewBlogService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
