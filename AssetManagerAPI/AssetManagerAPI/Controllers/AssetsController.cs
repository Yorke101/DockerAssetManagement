namespace AssetManagerAPI.Controllers;

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
//sing AssetManagerAPI.Data;
//using AssetManagerAPI.Models;
//using AssetManagerAPI.DTO;
using global::AssetManagerAPI.Data;
using global::AssetManagerAPI.DTO;
using global::AssetManagerAPI.Models;

[ApiController]
[Route("api/[controller]")]
public class AssetsController : ControllerBase
{
    private readonly AppDbContext _context;

    public AssetsController(AppDbContext context)
    {
        _context = context;
    }

    // GET: /api/assets
    [HttpGet]
    public async Task<ActionResult<IEnumerable<object>>> GetAssets()
    {
        var assets = await _context.Assets
            .Include(a => a.AssetAssignments)
                .ThenInclude(aa => aa.Employee)
            .Select(a => new
            {
                a.Id,
                a.Name,
                a.Category,
                a.SerialNumber,
                a.CreatedAt,
                AssignedTo = a.AssetAssignments
                    .Where(aa => aa.UnassignedAt == null)
                    .Select(aa => new { aa.Employee.Id, aa.Employee.FullName, aa.Employee.Email })
                    .FirstOrDefault()
            })
            .ToListAsync();

        return Ok(assets);
    }

    // ✅ GET: /api/assets/{id}
   [HttpGet("{id}")]
    public async Task<ActionResult<object>> GetAsset(int id)
    {
        var asset = await _context.Assets
            .Include(a => a.AssetAssignments)
               .ThenInclude(aa => aa.Employee)
            .Where(a => a.Id == id)
            .Select(a => new
            {
               a.Id,
                a.Name,
                a.Category,
                a.SerialNumber,
               a.CreatedAt,
               a.MaintenanceIntervalDays,
               a.LastMaintenanceDate,
                AssignedTo = a.AssetAssignments
                    .Where(aa => aa.UnassignedAt == null)
                   .Select(aa => new { aa.Employee.Id, aa.Employee.FullName, aa.Employee.Email })
                    .FirstOrDefault()
           })
            .FirstOrDefaultAsync();

        if (asset == null)
            return NotFound();

        return Ok(asset);
    }

    //POST: /api/assets
    [HttpPost]
    public async Task<ActionResult<Asset>> CreateAsset(CreateAssetDto dto)
    {
        var asset = new Asset
        {
            Name = dto.Name,
            Category = dto.Category,
            SerialNumber = dto.SerialNumber,
            MaintenanceIntervalDays = dto.MaintenanceIntervalDays,
            LastMaintenanceDate = dto.LastMaintenanceDate,
            CreatedAt = DateTime.Now
        };

        _context.Assets.Add(asset);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetAssets), new { id = asset.Id }, asset);
    }

    // PUT: /api/assets/{id}/assign
    [HttpPut("{id}/assign")]
    public async Task<IActionResult> AssignAsset(int id, [FromBody] int employeeId)
    {
        var asset = await _context.Assets.FindAsync(id);
        var employee = await _context.Employees.FindAsync(employeeId);

        if (asset == null || employee == null)
            return NotFound("Asset or employee not found.");

        var currentAssignment = await _context.AssetAssignments
            .Where(aa => aa.AssetId == id && aa.UnassignedAt == null)
            .FirstOrDefaultAsync();

        if (currentAssignment != null)
        {
            currentAssignment.UnassignedAt = DateTime.Now;
        }

        var newAssignment = new AssetAssignment
        {
            AssetId = id,
            EmployeeId = employeeId,
            AssignedAt = DateTime.Now
        };

        _context.AssetAssignments.Add(newAssignment);
        await _context.SaveChangesAsync();

        return Ok(new
        {
            message = $"Asset '{asset.Name}' has been successfully assigned to {employee.FullName}."
        });
    }

    // PUT: /api/assets/{id}/unassign
    [HttpPut("{id}/unassign")]
    public async Task<IActionResult> UnassignAsset(int id)
    {
        var assignment = await _context.AssetAssignments
            .Include(aa => aa.Asset)
            .Include(aa => aa.Employee)
            .Where(aa => aa.AssetId == id && aa.UnassignedAt == null)
            .FirstOrDefaultAsync();

        if (assignment == null)
            return NotFound("No active assignment found for this asset.");

        assignment.UnassignedAt = DateTime.Now;
        await _context.SaveChangesAsync();

        return Ok(new
        {
            message = $"Asset '{assignment.Asset.Name}' has been successfully unassigned from {assignment.Employee.FullName}."
        });
    }
}
