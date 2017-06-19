import { Pipe, PipeTransform } from '@angular/core';
import { IListing } from './listing';

@Pipe({
  name: 'listingFilter'
})
export class ListingFilterPipe implements PipeTransform {

    transform(value: IListing[], filterBy: string): IListing[] {
        filterBy = filterBy ? filterBy.toLowerCase() : null;
        return filterBy ? value.filter((listing: IListing) =>
            listing.ListingName.toLowerCase().indexOf(filterBy) !== -1
            || listing.ListingAddress.toLowerCase().indexOf(filterBy) !== -1) : value;
    }

}

