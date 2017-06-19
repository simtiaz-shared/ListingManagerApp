using ListingManager.DataAccessLayer.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;

namespace ListingManager.DataAccessLayer
{

    // Note: to avoid recreation of the DB, use DropCreateDatabaseIfModelChanges<ListingManagerDBContext>  
    public class ListingManagerDBInitializer : DropCreateDatabaseIfModelChanges<ListingManagerDBContext> 
    {
        //protected override void Seed(ListingManagerDBContext context)
        //{
        //    // Agent 
        //    var agent1 = new Agent()
        //    {
        //        AgentName = "Audiophile LP",
        //        AgentId = 1
        //    };

        //    var agent2 = new Agent()
        //    {
        //        AgentName = "Regular LP",
        //        AgentId = 2
        //    };

        //    var agent3 = new Agent()
        //    {
        //        AgentName = "Audiophile Single",
        //        AgentId = 3
        //    };

        //    var agent4 = new Agent()
        //    {
        //        AgentName = "Regular Single",
        //        AgentId = 4
        //    };

        //    context.Agents.Add(agent1);
        //    context.Agents.Add(agent2);
        //    context.Agents.Add(agent3);
        //    context.Agents.Add(agent4);

        //    // Listing
        //    var l1 = new Listing()
        //    {
        //        ListingId = 1,
        //        AgentId = 1,
        //        ListingName = "Kevin",
        //        ListingAddress = "address 1"
        //    };

        //    var l2 = new Listing()
        //    {
        //        ListingId = 2,
        //        AgentId = 1,
        //        ListingName = "Kevin",
        //        ListingAddress = "address 1"
        //    };

        //    var l3 = new Listing()
        //    {
        //        ListingId = 3,
        //        AgentId = 2,
        //        ListingName = "Kevin",
        //        ListingAddress = "address 1"
        //    };

        //    /*
        //    // Add friends & records for Kevin
        //    l1.ListingAgent.Listings = new List<Agent>()
        //    {
        //        agentSven, agentNils, agentTim
        //    };
        //    agentKevin.Listings = new List<Listing>()
        //    {
        //        new Listing()
        //        {
        //            Artist = "Nirvana",
        //            Title = "Nevermind",
        //            CatalogNumber = "ABC/111",
        //            Agent = pressingDetailAudiophileLP,
        //            Year= 1991
        //        },
        //        new Listing()
        //        {
        //            Artist = "Arctic Monkeys",
        //            Title = "AM",
        //            CatalogNumber = "EUI/111",
        //            Agent = pressingDetailAudiophileLP,
        //            Year = 2013
        //        },
        //        new Listing()
        //        {
        //            Artist = "Beatles",
        //            Title = "The White Album",
        //            CatalogNumber = "DEI/113",
        //            Agent = pressingDetailRegularLP,
        //            Year = 1968
        //        },
        //        new Listing()
        //        {
        //            Artist = "Beatles",
        //            Title = "Sergeant Pepper's Lonely Hearts Club Band",
        //            CatalogNumber = "DPI/123",
        //            Agent = pressingDetailRegularLP,
        //            Year = 1967
        //        },
        //        new Listing()
        //        {
        //            Artist = "Nirvana",
        //            Title = "Bleach",
        //            CatalogNumber = "DPI/123",
        //            Agent = pressingDetailRegularLP,
        //            Year = 1989
        //        },
        //        new Listing()
        //        {
        //            Artist = "Leonard Cohen",
        //            Title = "Suzanne",
        //            CatalogNumber = "PPP/783",
        //            Agent = pressingDetailRegularSingle,
        //            Year = 1967
        //        },
        //        new Listing()
        //        {
        //            Artist = "Marvin Gaye",
        //            Title = "What's Going On",
        //            CatalogNumber = "MVG/445",
        //            Agent = pressingDetailRegularLP,
        //            Year = null
        //        },
        //    };

        //    // get Sven, add friends & records
        //    agentSven.Listings = new List<Agent>()
        //    {
        //        agentKevin, agentNils, agentTim, agentNele
        //    };
        //    agentSven.Listings = new List<Listing>()
        //    {
        //        new Listing()
        //        {
        //            Artist = "Nirvana",
        //            Title = "Nevermind",
        //            CatalogNumber = "ABC/111",
        //            Agent = pressingDetailAudiophileLP,
        //            Year = 1991
        //        },
        //        new Listing()
        //        {
        //            Artist = "Cher",
        //            Title = "Closer to the Truth",
        //            CatalogNumber = "CHE/190",
        //            Agent = pressingDetailRegularLP,
        //            Year = 2013
        //        }
        //     };

        //    // get Nils, add friends & records
        //    agentNils.Listings = new List<Agent>()
        //    {
        //        agentSven, agentKevin, agentBob, agentKenneth
        //    };
        //    agentNils.Listings = new List<Listing>()
        //    {
        //        new Listing()
        //        {
        //            Artist = "Justin Bieber",
        //            Title = "Baby",
        //            CatalogNumber = "OOP/098",
        //            Agent = pressingDetailAudiophileSingle
        //        },
        //        new Listing()
        //        {
        //            Artist = "The Prodigy",
        //            Title = "Music for the Jilted Generation",
        //            CatalogNumber = "NBE/864",
        //            Agent = pressingDetailRegularLP
        //        }
        //     };

        //    // get Bob, add records
        //    agentBob.Listings = new List<Listing>()
        //    {
        //        new Listing()
        //        {
        //            Artist = "Arctic Monkeys",
        //            Title = "Favourite Worst Nightmare",
        //            CatalogNumber = "IOC/113",
        //            Agent = pressingDetailAudiophileLP
        //        }
        //    };


        //    // get Tim, add friends & records
        //    agentTim.Listings = new List<Agent>()
        //    {
        //        agentNele, agentKenneth, agentNils
        //    };
        //    agentTim.Listings = new List<Listing>()
        //    {
        //        new Listing()
        //        {
        //            Artist = "Anne Clarke",
        //            Title = "Our Darkness",
        //            CatalogNumber = "TII/339",
        //            Agent = pressingDetailAudiophileSingle
        //        },
        //        new Listing()
        //        {
        //            Artist = "Dead Kennedys",
        //            Title = "Give Me Convenience or Give Me Death",
        //            CatalogNumber = "DKE/864",
        //            Agent = pressingDetailRegularLP
        //        },
        //        new Listing()
        //        {
        //            Artist = "Sisters of Mercy",
        //            Title = "Temple of Love",
        //            CatalogNumber = "IIE/824",
        //            Agent = pressingDetailRegularSingle
        //        }
        //     };

        //    // get Nele, add friends & records
        //    agentNele.Listings = new List<Agent>()
        //    {
        //        agentTim, agentKenneth, agentSven
        //    };
        //    agentNele.Listings = new List<Listing>()
        //    {
        //        new Listing()
        //        {
        //            Artist = "The Dandy Warhols",
        //            Title = "Thirteen Tales From Urban Bohemia",
        //            CatalogNumber = "TDW/516",
        //            Agent = pressingDetailRegularLP
        //        }
        //     };

        //    // get Kenneth, add friends & records
        //    agentKenneth.Listings = new List<Agent>()
        //    {
        //        agentTim, agentKevin, agentSven
        //    };
        //    agentKenneth.Listings = new List<Listing>()
        //    {
        //        new Listing()
        //        {
        //            Artist = "Abba",
        //            Title = "Gimme Gimme Gimme",
        //            CatalogNumber = "TDW/516",
        //            Agent = pressingDetailRegularSingle
        //        }
        //     };

        //    context.Agents.Add(agentKevin);
        //    context.Agents.Add(agentSven);
        //    context.Agents.Add(agentKenneth);
        //    context.Agents.Add(agentBob);
        //    context.Agents.Add(agentNele);
        //    context.Agents.Add(agentNils);

        //    context.Agents.Add(agentTim);

        //    // OpenHouse
        //    var recordStores = new List<OpenHouse>()
        //    {
        //        new SpecializedOpenHouse()
        //        {
        //            Name = "Indie Records, Inc",
        //            StoreAddress = new Address()
        //            {
        //                City = "Antwerp",
        //                PostalCode = "2000",
        //                Street = "1, Main Street",
        //                Country = "Belgium"
        //            },
        //            Tags = new List<string>() {"Rock", "Indie", "Alternative"},
        //            Ratings = new List<Rating>()
        //            {
        //                new Rating() {
        //                    RatedBy = agentKevin,
        //                    Value = 5
        //                },
        //                new Rating() {
        //                    RatedBy = agentSven,
        //                    Value = 4
        //                }
        //            },
        //            Specialization = "Indie"
        //        },
        //         new SpecializedOpenHouse()
        //        {
        //            Name = "Rock Records, Inc",
        //            StoreAddress = new Address()
        //            {
        //                City = "Antwerp",
        //                PostalCode = "2000",
        //                Street = "5, Big Street",
        //                Country = "Belgium"
        //            },
        //            Tags = new List<string>() {"Rock", "Pop"},
        //            Ratings = new List<Rating>()
        //            {
        //                new Rating() {
        //                    RatedBy = agentKevin,
        //                    Value = 5
        //                },
        //                new Rating() {
        //                    RatedBy = agentSven,
        //                    Value = 4
        //                }
        //            },
        //            Specialization = "Rock"
        //        },
        //        new OpenHouse()
        //        {
        //            Name = "All Your Music Needs",
        //            StoreAddress = new Address()
        //            {
        //                City = "Antwerp",
        //                PostalCode = "2000",
        //                Street = "25, Fluffy Road",
        //                Country = "Belgium"
        //            },
        //            Tags = new List<string>() {"Rock", "Pop", "Indie", "Alternative" },
        //            Ratings = new List<Rating>()
        //            {
        //                new Rating() {
        //                    RatedBy = agentKevin,
        //                    Value = 4
        //                },
        //                new Rating() {
        //                    RatedBy = agentSven,
        //                    Value = 4
        //                },
        //                new Rating() {
        //                    RatedBy = agentNele,
        //                    Value = 4
        //                }
        //            }
        //        }
        //    };
        //    */

        //    //context.OpenHouses.AddRange(openhouse);

        //    base.Seed(context);
        //}
    }
}
