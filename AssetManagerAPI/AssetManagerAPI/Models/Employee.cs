namespace AssetManagerAPI.Models
{
    public class Employee
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;

        public ICollection<AssetAssignment> AssetAssignments { get; set; } = new List<AssetAssignment>(); 
    }
}
