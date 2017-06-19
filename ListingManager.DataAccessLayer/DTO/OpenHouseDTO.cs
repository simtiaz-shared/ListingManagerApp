using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ListingManager.DataAccessLayer.Model;

namespace ListingManager.DataAccessLayer.DTO
{
    public class OpenHouseDTO
    {
        public long OpenHouseId { get; set; }
        public long ListingId { get; set; }
        public DateTime OpenHouseBeginDate { get; set; }
        public DateTime OpenHouseEndDate { get; set; }
        public string ListingName { get; set; }
        public string ListingAddress { get; set; }
    }
}
