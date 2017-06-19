using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ListingManager.DataAccessLayer.Model
{
    public class Agent
    {
        [Key]
        public long AgentId { get; set; }

        [Required]
        [StringLength(50)]
        public string AgentName { get; set; }

        public virtual ICollection<Listing> AgentListings { get; set; }

        public Agent()
        {
            AgentListings = new List<Listing>();
        }
    }
}
