import { Component, Input, OnInit } from '@angular/core';
import { Iposts } from '../Iposts.interface';
import { Blog } from '../model/blog';

@Component({
  selector: 'app-blog-card',
  templateUrl: './blog-card.component.html',
  styleUrls: ['./blog-card.component.css']
})
export class BlogCardComponent implements OnInit {

  @Input() post : any
  constructor() { }

  ngOnInit() {
  }

}
