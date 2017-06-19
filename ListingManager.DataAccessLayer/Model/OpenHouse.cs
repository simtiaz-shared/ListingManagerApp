using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ListingManager.DataAccessLayer.Model
{
    public class OpenHouse
    {
        [Key]
        public long OpenHouseId { get; set; }

        //[ForeignKey("Listing")]
        public long ListingId { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime OpenHouseBeginDate { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime OpenHouseEndDate { get; set; }

        public virtual Listing OpenHouseListing { get; set; }

        public OpenHouse()
        {

        }
    }
}
