import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router } from '@angular/router';

@Injectable()
export class OpenHouseGuardService implements CanActivate {

    constructor(private _router: Router) {
    }

    canActivate(route: ActivatedRouteSnapshot): boolean {
        let id = +route.url[1].path;
        if (isNaN(id) || id < 1) {
            alert('Invalid Listing Id');
            // start a new navigation to redirect to list page
            this._router.navigate(['/listing']);
            // abort current navigation
            return false;
        };
        return true;
    }
}
