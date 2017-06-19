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
    public class OpenHousesController : ApiController
    {
        private ListingManagerDBContext db = new ListingManagerDBContext();

        // GET: api/OpenHouses
        public IQueryable<OpenHouseDTO> GetOpenHouses()
        {
            //return db.OpenHouses;
            var openHouses = db.OpenHouses.Include(b => b.OpenHouseListing).Select(b =>
                new OpenHouseDTO()
                {
                    OpenHouseId = b.OpenHouseId,
                    ListingId = b.ListingId,
                    OpenHouseBeginDate = b.OpenHouseBeginDate,
                    OpenHouseEndDate = b.OpenHouseEndDate,
                    ListingName = b.OpenHouseListing.ListingName,
                    ListingAddress = b.OpenHouseListing.ListingAddress
                });

            return openHouses;
        }

        // GET: api/OpenHouses/5
        [ResponseType(typeof(OpenHouseDTO))]
        public async Task<IHttpActionResult> GetOpenHouse(int id)
        {
            var openHouse = await db.OpenHouses.Include(b => b.OpenHouseListing).Select(b =>
                new OpenHouseDTO()
                {
                    OpenHouseId = b.OpenHouseId,
                    ListingId = b.ListingId,
                    OpenHouseBeginDate = b.OpenHouseBeginDate,
                    OpenHouseEndDate = b.OpenHouseEndDate,
                    ListingName = b.OpenHouseListing.ListingName,
                    ListingAddress = b.OpenHouseListing.ListingAddress
                }).SingleOrDefaultAsync(b => b.OpenHouseId == id);

            if (openHouse == null)
            {
                return NotFound();
            }

            return Ok(openHouse);
        }

        // PUT: api/OpenHouses/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutOpenHouse(int id, OpenHouse openHouse)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != openHouse.OpenHouseId)
            {
                return BadRequest();
            }

            db.Entry(openHouse).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OpenHouseExists(id))
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

        // POST: api/OpenHouses
        [ResponseType(typeof(OpenHouse))]
        public async Task<IHttpActionResult> PostOpenHouse(OpenHouse openHouse)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.OpenHouses.Add(openHouse);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = openHouse.OpenHouseId }, openHouse);
        }

        // DELETE: api/OpenHouses/5
        [ResponseType(typeof(OpenHouse))]
        public async Task<IHttpActionResult> DeleteOpenHouse(int id)
        {
            OpenHouse openHouse = await db.OpenHouses.FindAsync(id);
            if (openHouse == null)
            {
                return NotFound();
            }

            db.OpenHouses.Remove(openHouse);
            await db.SaveChangesAsync();

            return Ok(openHouse);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool OpenHouseExists(int id)
        {
            return db.OpenHouses.Count(e => e.OpenHouseId == id) > 0;
        }
    }
}