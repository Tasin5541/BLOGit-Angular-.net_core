import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Blog } from '../model/blog';
import { AlertifyService } from '../services/alertify.service';
import { NewBlogService } from '../services/newBlog.service';

@Component({
  selector: 'app-newBlog',
  templateUrl: './newBlog.component.html',
  styleUrls: ['./newBlog.component.css']
})
export class NewBlogComponent implements OnInit {

  addBlogForm: FormGroup;
  blog: Blog;
  userSubmitted: boolean;
  file: any;
  fileExtension: any;
  filepostedOn= new Date().toString().split("+")[0].split(':').join('_');
  //filepostedOn= new Date().toString().split(':').join('_');
  imageUrl: string | ArrayBuffer = "https://www.adc-awards.archi/images/joomlart/demo/default.jpg"

  constructor(private fb: FormBuilder,
              private newBlogService: NewBlogService,
              private alertify: AlertifyService,
              private router: Router,
              private http:HttpClient) { }

  ngOnInit() {
    this.CreateAddBlogForm();
  }

  onSubmit(){
    this.userSubmitted = true;

    if(this.addBlogForm.valid) {
      console.log(this.addBlogForm);
      const formData: FormData = new FormData();
      formData.append('file', this.file, this.file.name+this.filepostedOn+this.fileExtension);
      this.http.post('http://localhost:53744/api/Post', formData).subscribe(
        data => {
          console.log(data);
        }
      );
      //this.newBlogService.addBlog(this.blogData());
      this.newBlogService.addBlog(this.blogData()).subscribe(
        data => {
          console.log(data);
          this.alertify.warning("Please wait for the blog to be uploaded");
          setTimeout(() => {
            this.alertify.success("You have successfully posted a new blog");
            this.router.navigate(['/home']);
            this.addBlogForm.reset();
        }, 2000);
        }
      );

      this.userSubmitted = false;

    } else {
      this.alertify.error("Kindly provide the required fields");
    }
  }

  CreateAddBlogForm() {
    this.addBlogForm = this.fb.group({
      Title: [null, Validators.required],
      Description: [null, Validators.required],
      Banner_Image: [null, Validators.required]
    })
  }

  get Title(){
    return this.addBlogForm.get('Title') as FormControl;
  }

  get Description(){
    return this.addBlogForm.get('Description') as FormControl;
  }

  get Banner_Image(){
    return this.addBlogForm.get('Banner_Image') as FormControl;
  }

  blogData(): Blog {
    return this.blog = {
      //Id: this.newBlogService.newpostID(),
      banner_Image: this.file.name+this.filepostedOn+this.fileExtension,
      title: this.Title.value,
      description: this.Description.value,
      author: localStorage.getItem('token'),
      postedOn: new Date().toString()
    }
  }

  onFileSelect(event) {
    this.file = event.target.files[0];
    this.fileExtension = (".").concat(this.file.name.split('.').pop());

    const reader = new FileReader();
    reader.readAsDataURL(this.file);

    reader.onload = event => {
      this.imageUrl = reader.result;
    };
  }

}
