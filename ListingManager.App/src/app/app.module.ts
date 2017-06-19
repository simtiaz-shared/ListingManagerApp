import { BrowserModule } from '@angular/platform-browser';
import { HttpModule } from '@angular/http';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from './app.component';
import { WelcomeComponent } from './welcome/welcome.component';
import { AboutComponent } from './about/about.component';
import { AgentComponent } from './agent/agent.component';
import { ListingComponent } from './listing/listing.component';
import { OpenHouseComponent } from './openhouse/openhouse.component';
import { AgentFilterPipe } from './agent/agent-filter.pipe';
import { ListingFilterPipe } from './listing/listing-filter.pipe';

import { ListingGuardService } from './listing/listing-guard.service';
import { OpenHouseGuardService } from './openhouse/openhouse-guard.service';
/* Feature Modules */
//import { ListingModule } from './listing/listing.module';

const routes: Routes = [
  { path: '', redirectTo: 'home', pathMatch: 'full' },
  { path: 'welcome', component: WelcomeComponent },
  { path: 'home', component: WelcomeComponent },
  { path: 'about', component: AboutComponent },
  { path: 'agent', component: AgentComponent },
  { path: 'listing', component: ListingComponent },
  { path: 'listing/:id',
    canActivate: [ ListingGuardService ],
    component: ListingComponent
  },
  { path: 'openhouse', component: OpenHouseComponent },
  { path: 'openhouse/:id',
    canActivate: [ OpenHouseGuardService ],
    component: OpenHouseComponent
  },
];

@NgModule({
  declarations: [
    AppComponent,
    WelcomeComponent,
    AboutComponent,
    AgentComponent,
    ListingComponent,
    OpenHouseComponent,
    AgentFilterPipe,
    ListingFilterPipe
  ],
  imports: [
    BrowserModule,
    HttpModule,
    RouterModule.forRoot(routes),
    FormsModule
  ],
  providers: [ ListingGuardService, OpenHouseGuardService ],
  bootstrap: [AppComponent]
})
export class AppModule { }
