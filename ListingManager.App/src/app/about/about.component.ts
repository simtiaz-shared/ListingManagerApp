import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html'
})
export class AboutComponent implements OnInit {
  pageTitle: string = "About Listing Manager App";
  constructor() { }

  ngOnInit() {
  }

}
