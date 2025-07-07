namespace AssetManagerAPI.Models
{
    public class AssetAssignment
    {
        public int Id { get; set; }

        public int AssetId { get; set; }
        public Asset Asset { get; set; }

        public int EmployeeId { get; set; }
        public Employee Employee { get; set; }

        public DateTime AssignedAt { get; set; } = DateTime.Now;
        public DateTime? UnassignedAt { get; set; }
    }
}
