import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-welcome',
  templateUrl: './welcome.component.html'
})
export class WelcomeComponent implements OnInit {
  public pageTitle: string = 'Welcome to Listing Manager';

  constructor() { }

  ngOnInit() {
  }

}
