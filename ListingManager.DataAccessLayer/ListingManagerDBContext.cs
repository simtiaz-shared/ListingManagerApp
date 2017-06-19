using ListingManager.DataAccessLayer.Model;
using System.Data.Entity;
using System.Configuration;

namespace ListingManager.DataAccessLayer
{
    public class ListingManagerDBContext : DbContext
    {
        public DbSet<Agent> Agents { get; set; }
        public DbSet<Listing> Listings { get; set; }
        public DbSet<OpenHouse> OpenHouses { get; set; }
    
        public ListingManagerDBContext()
            : base(ConnectionString("ListingManagerApiDB_CS"))
        {
            this.Database.Log = s => System.Diagnostics.Debug.WriteLine(s);

            Database.SetInitializer<ListingManagerDBContext>(null);
            //Database.SetInitializer(new ListingManagerDBInitializer());
            //Database.SetInitializer<ListingManagerDBContext>();
            // disable lazy loading
            Configuration.LazyLoadingEnabled = false;          
        }

        private static string ConnectionString(string connKey)
        {
            var conn = ConfigurationManager.ConnectionStrings[connKey].ConnectionString;
            return conn;
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Agent>().ToTable("Agent");
            modelBuilder.Entity<Listing>().ToTable("Listing");
            modelBuilder.Entity<OpenHouse>().ToTable("OpenHouse");

            //one-to-many 
            modelBuilder.Entity<Listing>()
                        .HasRequired<Agent>(s => s.ListingAgent)
                        .WithMany(s => s.AgentListings)
                        .HasForeignKey(s => s.AgentId)
                        .WillCascadeOnDelete(true);

            //one-to-many 
            modelBuilder.Entity<OpenHouse>()
                        .HasRequired<Listing>(s => s.OpenHouseListing)
                        .WithMany(s => s.ListingOpenHouses)
                        .HasForeignKey(s => s.ListingId)
                        .WillCascadeOnDelete(true);


            //modelBuilder.Entity<Agent>().HasMany(m => m.AgentListings);
            //modelBuilder.Entity<Listing>().HasMany(p => p.ListingOpenHouses);
        }
    }
}
