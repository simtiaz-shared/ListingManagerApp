using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.Cors;
using ListingManager.DataAccessLayer.DTO;
using ListingManager.DataAccessLayer.Model;
using ListingManager.DataAccessLayer;

namespace ListingManagerApi.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class AgentsController : ApiController
    {
        private ListingManagerDBContext db = new ListingManagerDBContext();

        public AgentsController()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }

        // GET: api/Agents
        public IEnumerable<AgentDTO> GetAgents()
        {
            var agents = db.Agents.Include(b => b.AgentListings).Select(b =>
                new AgentDTO()
                {
                    AgentId = b.AgentId,
                    AgentName= b.AgentName,
                    AgentListings = b.AgentListings,
                    ListingCount = b.AgentListings.Count()
                });

            return agents; // db.Agents.Include(a => a.AgentListings).ToList();
        }

        // GET: api/Agents/5
        [ResponseType(typeof(AgentDTO))]
        public async Task<IHttpActionResult> GetAgent(int id)
        {
            var agent = await db.Agents.Include(b => b.AgentListings).Select(b =>
                new AgentDTO()
                {
                    AgentId = b.AgentId,
                    AgentName = b.AgentName,
                    AgentListings = b.AgentListings,
                    ListingCount = b.AgentListings.Count()
                }).SingleOrDefaultAsync(b => b.AgentId == id);

            if (agent == null)
            {
                return NotFound();
            }

            return Ok(agent);
        }

        // PUT: api/Agents/5
        [HttpPut]
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutAgent(int id, Agent agent)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != agent.AgentId)
            {
                return BadRequest();
            }

            db.Entry(agent).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AgentExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Agents
        [HttpPost]
        [ResponseType(typeof(Agent))]
        public async Task<IHttpActionResult> PostAgent(Agent agent)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Agents.Add(agent);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = agent.AgentId }, agent);
        }

        // DELETE: api/Agents/5
        [ResponseType(typeof(Agent))]
        public async Task<IHttpActionResult> DeleteAgent(int id)
        {

            Agent agent = await db.Agents.FindAsync(id);
            if (agent == null)
            {
                return NotFound();
            }

            ////delete openhouses and listings first
            //var selectedAgentListings = db.Listings.Include(o => o.ListingOpenHouses).Where(l => l.AgentId == id);
            //if (selectedAgentListings != null && selectedAgentListings.Count() > 0)
            //{
            //    foreach (var listing in selectedAgentListings)
            //    {
            //        foreach (var oh in listing.ListingOpenHouses)
            //        {
            //            db.OpenHouses.Remove(oh);
            //        }
            //        db.Listings.Remove(listing);
            //    }
            //}

            db.Agents.Remove(agent);
            await db.SaveChangesAsync();

            return Ok(agent);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AgentExists(int id)
        {
            return db.Agents.Count(e => e.AgentId == id) > 0;
        }
    }
}