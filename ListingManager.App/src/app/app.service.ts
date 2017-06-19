import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod } from '@angular/http';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import 'rxjs/add/observable/throw';

import { IAgent } from './agent/agent';
import { IListing } from './listing/listing';
import { IOpenHouse } from './openhouse/openhouse';

@Injectable()
export class AppService {
    private _baseUrl = 'http://localhost:31407/api/';

    constructor(private _http: Http) { }

/* AGENT SECTION */
    getAgents(): Observable<IAgent[]> {
        return this._http.get(this._baseUrl + 'agents')
            .map((response: Response) => <IAgent[]> response.json())
            .do(data => console.log('All agents retrieved.'))
            .catch(this.handleError);
    }

    getAgent(id: number): Observable<IAgent> {
        return this.getAgents()
            .map((agents: IAgent[]) => agents.find(p => p.AgentId === id));
    }

    updateAgent(id: number, agent: IAgent) {
      var url = this._baseUrl + 'agents/' + id;
      let headers = new Headers({ 'Content-Type': 'application/json' });
      let options = new RequestOptions({ headers: headers });
      let body = { 'AgentId': agent.AgentId, 'AgentName': agent.AgentName };

      console.log(url + ' : ' + JSON.stringify(body));
      return this._http.put(url, body, options ).map((res: Response) => res.json());
    }

    addAgent(agent: IAgent): Observable<IAgent> {
      var url = this._baseUrl + 'agents';
	    let headers = new Headers({ 'Content-Type': 'application/json' });
      let options = new RequestOptions({ headers: headers });
      let body = JSON.stringify(agent);

      console.log(url + ' : ' + body);
      return this._http.post(url, body, options)
                   .map(this.extractData)
                   .catch(this.handleErrorObservable);
    }

    deleteAgent(id: number): Observable<IAgent> {
      var url = this._baseUrl + 'agents/' + id;

      console.log(url);
      return this._http.delete(url)
                   .map(this.extractData)
                   .catch(this.handleErrorObservable);
    }


/* LISTING SECTION */
    getListings(): Observable<IListing[]> {
        return this._http.get(this._baseUrl + 'listings')
            .map((response: Response) => <IListing[]> response.json())
            .do(data => console.log('All listings retrieved. ' + data.length))
            .catch(this.handleError);
    }

    getListingsByAgent(id: number): Observable<IListing[]> {
        return this.getListings()
            .map((listings: IListing[]) => listings.filter(p => p.AgentId === id));
    }

    getListing(id: number): Observable<IListing> {
        return this.getListings()
            .map((listings: IListing[]) => listings.find(p => p.ListingId === id));
    }

    updateListing(id: number, listing: IListing) {
      var url = this._baseUrl + 'listings/' + id;
      let headers = new Headers({ 'Content-Type': 'application/json' });
      let options = new RequestOptions({ headers: headers });
      let body = { 'ListingId': listing.ListingId, 'AgentId': listing.AgentId, 'ListingName': listing.ListingName, 'ListingAddress': listing.ListingAddress  };

      console.log(url + ' : ' + JSON.stringify(body));
      return this._http.put(url, body, options ).map((res: Response) => res.json());
    }

    addListing(listing: IListing): Observable<IListing> {
      var url = this._baseUrl + 'listings';
	    let headers = new Headers({ 'Content-Type': 'application/json' });
      let options = new RequestOptions({ headers: headers });
      let body = JSON.stringify(listing);

      console.log(url + ' : ' + body);
      return this._http.post(url, body, options)
                   .map(this.extractData)
                   .catch(this.handleErrorObservable);
    }

    deleteListing(id: number): Observable<IListing> {
      var url = this._baseUrl + 'listings/' + id;

      console.log(url);
      return this._http.delete(url)
                   .map(this.extractData)
                   .catch(this.handleErrorObservable);
    }

/* OPENHOUSE SECTION */
    getOpenHouses(): Observable<IOpenHouse[]> {
        return this._http.get(this._baseUrl + 'openHouses')
            .map((response: Response) => <IOpenHouse[]> response.json())
            .do(data => console.log('All openHouses retrieved. ' + data.length))
            .catch(this.handleError);
    }

    getOpenHousesByListing(id: number): Observable<IOpenHouse[]> {
        return this.getOpenHouses()
            .map((openHouses: IOpenHouse[]) => openHouses.filter(p => p.ListingId === id));
    }

    getOpenHouse(id: number): Observable<IOpenHouse> {
        return this.getOpenHouses()
            .map((openHouses: IOpenHouse[]) => openHouses.find(p => p.OpenHouseId === id));
    }

    updateOpenHouse(id: number, openHouse: IOpenHouse) {
      var url = this._baseUrl + 'openHouses/' + id;
      let headers = new Headers({ 'Content-Type': 'application/json' });
      let options = new RequestOptions({ headers: headers });
      let body = { 'OpenHouseId': openHouse.OpenHouseId, 'ListingId': openHouse.ListingId, 'OpenHouseBeginDate': openHouse.OpenHouseBeginDate, 'OpenHouseEndDate': openHouse.OpenHouseEndDate  };

      console.log(url + ' : ' + JSON.stringify(body));
      return this._http.put(url, body, options ).map((res: Response) => res.json());
    }

    addOpenHouse(openHouse: IOpenHouse): Observable<IOpenHouse> {
      var url = this._baseUrl + 'openHouses';
	    let headers = new Headers({ 'Content-Type': 'application/json' });
      let options = new RequestOptions({ headers: headers });
      let body = JSON.stringify(openHouse);

      console.log(url + ' : ' + body);
      return this._http.post(url, body, options)
                   .map(this.extractData)
                   .catch(this.handleErrorObservable);
    }

    deleteOpenHouse(id: number): Observable<IOpenHouse> {
      var url = this._baseUrl + 'openHouses/' + id;

      console.log(url);
      return this._http.delete(url)
                   .map(this.extractData)
                   .catch(this.handleErrorObservable);
    }


    private handleError(error: Response) {
        // in a real world app, we may send the server to some remote logging infrastructure
        // instead of just logging it to the console
        console.error(error);
        return Observable.throw(error.json().error || 'Server error');
    }

    private extractData(res: Response) {
      let body = res.json();
      return body.data || {};
    }

    private handleErrorObservable (error: Response | any) {
      console.error(error.message || error);
      return Observable.throw(error.message || error);
    }
}
