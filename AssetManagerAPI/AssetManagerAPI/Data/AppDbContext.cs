namespace AssetManagerAPI.Data;
using Microsoft.EntityFrameworkCore;
using AssetManagerAPI.Models;

    public class AppDbContext : DbContext
    {
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Employee> Employees { get; set; }
    public DbSet<Asset> Assets { get; set; }
    public DbSet<AssetAssignment> AssetAssignments { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Employee>()
            .HasIndex(e => e.Email)
            .IsUnique();

        modelBuilder.Entity<Asset>()
            .HasIndex(a => a.SerialNumber)
            .IsUnique();

        modelBuilder.Entity<AssetAssignment>()
            .HasOne(aa => aa.Asset)
            .WithMany(a => a.AssetAssignments)
            .HasForeignKey(aa => aa.AssetId);

        modelBuilder.Entity<AssetAssignment>()
            .HasOne(aa => aa.Employee)
            .WithMany(e => e.AssetAssignments)
            .HasForeignKey(aa => aa.EmployeeId);
    }
}

