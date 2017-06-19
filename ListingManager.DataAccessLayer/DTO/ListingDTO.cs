using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using ListingManager.DataAccessLayer.Model;

namespace ListingManager.DataAccessLayer.DTO
{
    public class ListingDTO
    {
        [Key]
        public long ListingId { get; set; }
        public long AgentId { get; set; }
        public string ListingName { get; set; }
        public string ListingAddress { get; set; }
        public string AgentName { get; set; }
    }
}
