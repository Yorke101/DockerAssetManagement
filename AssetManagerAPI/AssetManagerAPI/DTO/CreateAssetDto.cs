namespace AssetManagerAPI.DTO
{
    public class CreateAssetDto
    {
        public string Name { get; set; }
        public string Category { get; set; }
        public string SerialNumber { get; set; }
        public int MaintenanceIntervalDays { get; set; }
        public DateTime? LastMaintenanceDate { get; set; }
    }
}
