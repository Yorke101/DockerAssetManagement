using System.Text.Json.Serialization; 

namespace AssetManagerAPI.Models
{
    public class Asset
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
        public string SerialNumber { get; set; }
        public int MaintenanceIntervalDays { get; set; }
        public DateTime? LastMaintenanceDate { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        [JsonIgnore]
        public ICollection<AssetAssignment> AssetAssignments { get; set; }

    }
}
