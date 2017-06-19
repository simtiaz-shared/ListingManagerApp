using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ListingManager.DataAccessLayer.Model
{
    public class Listing
    {
        [Key]
        public long ListingId { get; set; }

        //[ForeignKey("Agent")]
        public long AgentId { get; set; }

        [StringLength(50)]
        [Required]
        public string ListingName { get; set; }

        [StringLength(200)]
        [Required]
        public string ListingAddress { get; set; }

        public virtual Agent ListingAgent { get; set; }

        public virtual ICollection<OpenHouse> ListingOpenHouses { get; set; }

        public Listing()
        {
            ListingOpenHouses = new List<OpenHouse>();
        }
    }
}
