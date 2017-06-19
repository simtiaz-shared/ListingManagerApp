using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ListingManager.DataAccessLayer.Model;

namespace ListingManager.DataAccessLayer.DTO
{
    public class AgentDTO
    {
        public long AgentId { get; set; }
        public string AgentName { get; set; }
        public int ListingCount { get; set; }
        public ICollection<Listing> AgentListings { get; set; }
    }
}
