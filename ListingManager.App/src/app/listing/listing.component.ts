import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { IAgent } from '../agent/agent';
import { IListing } from './listing';
import { AppService } from '../app.service';

import { Subscription } from 'rxjs/Subscription';
import { Observable } from 'rxjs/Observable';

@Component({
  templateUrl: './listing.component.html',
  providers: [ AppService ]
})
export class ListingComponent implements OnInit, OnDestroy {
    pageTitle: string = 'Listings';
    listFilter: string;
    errorMessage: string;
    actionTitle: string = "Add New Listing";
    inputListingId: number;
    inputListingName: string;
    inputListingAddress: string;

    listings: IListing[];
    selectedListing: IListing;
    selectedListingId: number;
    selectedAgent: IAgent;

    private sub: Subscription;

    constructor(private _route: ActivatedRoute,
                private _router: Router,
                private _appService: AppService) {
    }

    ngOnInit(): void {
      this.loadListings();
    }

    loadListings() {
      this.sub = this._route.params.subscribe(
          params => {
              let id = +params['id'];
              this.getAgentByAgentId(id);
              this.getListingsByAgent(id);
      });
      if (this.selectedAgent != null)
        this.pageTitle = 'Listings for ' + this.selectedAgent.AgentName;
    }

    ngOnDestroy() {
        this.sub.unsubscribe();
    }

    getAgentByAgentId(id: number) {
      this._appService.getAgent(id)
      .subscribe(agent => this.selectedAgent = agent,
                  error => this.errorMessage = <any>error);

      if (this.selectedAgent != null)
        console.log('Agent retrieved: ' + this.selectedAgent.AgentName);
    }

    getListingsByAgent(id: number) {
        this._appService.getListingsByAgent(id)
        .subscribe(listings => this.listings = listings,
                    error => this.errorMessage = <any>error);

      if (this.listings != null)
        console.log('Listing retrieved: ' + this.listings.length);
    }

    onBack(): void {
        this._router.navigate(['/listings']);
    }


    onEditClicked(id: number, listing: IListing): void {
      this.actionTitle = "Edit Listing";
      this.selectedListing = listing;
      this.selectedListingId = listing.ListingId;
      this.inputListingId = listing.ListingId;
      this.inputListingName = listing.ListingName;
      this.inputListingAddress = listing.ListingAddress;
    }

    onDeleteClicked(id: number): void {
      this.actionTitle = "Delete";
      this.selectedListingId = id;

      this.onSaveClicked('');
    }

    onSaveClicked(message: string): void {
      this.pageTitle = 'Listings for ' + this.selectedAgent.AgentName + ' : ' + message;

      if (this.actionTitle.startsWith("Edit")) {
        this.selectedListing.AgentId = this.selectedAgent.AgentId;
        this.selectedListing.ListingName =  this.inputListingName;
        this.selectedListing.ListingAddress =  this.inputListingAddress;
        this._appService.updateListing(this.selectedListingId, this.selectedListing)
          .subscribe(data => {
              // refresh the list
              this.loadListings();
              return true;
            },
            error => {
              console.error("Error updating listing!");
              return Observable.throw(error);
            }
          );
      }
      else if (this.actionTitle.startsWith("Add")) {
        this.selectedListing = { ListingId: 0, AgentId: this.selectedAgent.AgentId, ListingName: this.inputListingName, ListingAddress: this.inputListingAddress, AgentName: '' };

        this._appService.addListing(this.selectedListing)
          .subscribe(data => {
              // refresh the list
              this.loadListings();
              return true;
            },
            error => {
              console.error("Error adding listing!");
              return Observable.throw(error);
            }
          );
      }
      else if (this.actionTitle.startsWith("Delete")) {
        this._appService.deleteListing(this.selectedListingId)
          .subscribe(data => {
              // refresh the list
              this.loadListings();
              return true;
            },
            error => {
              console.error("Error deleting listing!");
              return Observable.throw(error);
            }
          );
      }

      this.actionTitle = "Add New Listing";
      this.inputListingId = 0;
      this.inputListingName = "";
      this.inputListingAddress = "";
      this.loadListings();
    }
}
