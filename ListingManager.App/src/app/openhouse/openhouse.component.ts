import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { IListing } from '../listing/listing';
import { IOpenHouse } from './openHouse';
import { AppService } from '../app.service';

import { Subscription } from 'rxjs/Subscription';
import { Observable } from 'rxjs/Observable';

@Component({
  templateUrl: './openHouse.component.html',
  providers: [ AppService ]
})
export class OpenHouseComponent implements OnInit, OnDestroy {
    pageTitle: string = 'OpenHouses';
    listFilter: string;
    errorMessage: string;
    actionTitle: string = "Add New OpenHouse";
    inputOpenHouseId: number;
    inputOpenHouseBeginDate: string;
    inputOpenHouseEndDate: string;

    openHouses: IOpenHouse[];
    selectedOpenHouse: IOpenHouse;
    selectedOpenHouseId: number;
    selectedListing: IListing;

    private sub: Subscription;

    constructor(private _route: ActivatedRoute,
                private _router: Router,
                private _appService: AppService) {
    }

    ngOnInit(): void {
      this.loadOpenHouses();
    }

    loadOpenHouses() {
        this.sub = this._route.params.subscribe(
            params => {
                let id = +params['id'];
                this.getListingByListingId(id);
                this.getOpenHousesByListing(id);
        });

        if (this.selectedListing != null)
          this.pageTitle = 'OpenHouses for ' + this.selectedListing.ListingName;
    }

    ngOnDestroy() {
        this.sub.unsubscribe();
    }

    getListingByListingId(id: number) {
        this._appService.getListing(id)
        .subscribe(agent => this.selectedListing = agent,
                    error => this.errorMessage = <any>error);

      if (this.selectedListing != null)
        console.log('Listing retrieved: ' + this.selectedListing.ListingName);
    }

    getOpenHousesByListing(id: number) {
        this._appService.getOpenHousesByListing(id)
        .subscribe(openHouses => this.openHouses = openHouses,
                    error => this.errorMessage = <any>error);

      if (this.openHouses != null)
        console.log('OpenHouse retrieved: ' + this.openHouses.length);
    }

    onBack(): void {
        this._router.navigate(['/openHouses']);
    }


    onEditClicked(id: number, openHouse: IOpenHouse): void {
      this.actionTitle = "Edit OpenHouse";
      this.selectedOpenHouse = openHouse;
      this.selectedOpenHouseId = openHouse.OpenHouseId;
      this.inputOpenHouseId = openHouse.OpenHouseId;
      this.inputOpenHouseBeginDate = openHouse.OpenHouseBeginDate;
      this.inputOpenHouseEndDate = openHouse.OpenHouseEndDate;
    }

    onDeleteClicked(id: number): void {
      this.actionTitle = "Delete";
      this.selectedOpenHouseId = id;

      this.onSaveClicked('');
    }

    onSaveClicked(message: string): void {
      if (this.selectedListing != null)
        this.pageTitle = 'OpenHouses for ' + this.selectedListing.ListingName + ' : ' + message;

      if (this.actionTitle.startsWith("Edit")) {
        this.selectedOpenHouse.ListingId = this.selectedListing.ListingId;
        this.selectedOpenHouse.OpenHouseBeginDate =  this.inputOpenHouseBeginDate;
        this.selectedOpenHouse.OpenHouseEndDate =  this.inputOpenHouseEndDate;
        this._appService.updateOpenHouse(this.selectedOpenHouseId, this.selectedOpenHouse)
          .subscribe(data => {
              // refresh the list
              this.loadOpenHouses();
              return true;
            },
            error => {
              console.error("Error updating openHouse!");
              return Observable.throw(error);
            }
          );
      }
      else if (this.actionTitle.startsWith("Add")) {
        this.selectedOpenHouse = { OpenHouseId: 0, ListingId: this.selectedListing.ListingId, OpenHouseBeginDate: this.inputOpenHouseBeginDate, OpenHouseEndDate: this.inputOpenHouseEndDate, ListingName: '', ListingAddress: '' };

        this._appService.addOpenHouse(this.selectedOpenHouse)
          .subscribe(data => {
              // refresh the list
              this.loadOpenHouses();
              return true;
            },
            error => {
              console.error("Error adding openHouse!");
              return Observable.throw(error);
            }
          );
      }
      else if (this.actionTitle.startsWith("Delete")) {
        this._appService.deleteOpenHouse(this.selectedOpenHouseId)
          .subscribe(data => {
              // refresh the list
              this.loadOpenHouses();
              return true;
            },
            error => {
              console.error("Error deleting openHouse!");
              return Observable.throw(error);
            }
          );
      }

      this.actionTitle = "Add New OpenHouse";
      this.inputOpenHouseId = 0;
      this.inputOpenHouseBeginDate = "";
      this.inputOpenHouseEndDate = "";
      this.loadOpenHouses();
    }
}
