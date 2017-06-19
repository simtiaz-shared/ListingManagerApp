using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ListingApi.Models
{
    public class OpenHouse
    {
        public int OpenHouseId { get; set; }
        public DateTime OpenHouseBeginDate { get; set; }
        public DateTime OpenHouseEndDate { get; set; }
    }
}