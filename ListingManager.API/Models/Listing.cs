using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ListingApi.Models
{
    public class Listing
    {
        public int ListingId { get; set; }
        public string ListingName { get; set; }
        public string ListingAddress { get; set; }
        public Agent Agent { get; set; }
        public List<OpenHouse> OpenHouses { get; set; }
    }
}