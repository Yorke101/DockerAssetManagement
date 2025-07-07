namespace AssetManagerAPI.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.EntityFrameworkCore;
    using global::AssetManagerAPI.Data;
    using global::AssetManagerAPI.Models;

    namespace AssetManagerAPI.Controllers
    {
        [ApiController]
        [Route("api/[controller]")]
        public class EmployeesController : ControllerBase
        {
            private readonly AppDbContext _context;

            public EmployeesController(AppDbContext context)
            {
                _context = context;
            }

            // ✅ GET: /api/employees
            [HttpGet]
            public async Task<ActionResult<IEnumerable<object>>> GetEmployees()
            {
                var employees = await _context.Employees
                    .Select(e => new
                    {
                        e.Id,
                        e.FullName,
                        e.Email
                    })
                    .ToListAsync();

                return Ok(employees);
            }

            // ✅ POST: /api/employees
            [HttpPost]
            public async Task<ActionResult<Employee>> CreateEmployee(Employee employee)
            {
                if (string.IsNullOrWhiteSpace(employee.FullName) || string.IsNullOrWhiteSpace(employee.Email))
                {
                    return BadRequest("Full name and email are required."); 
                }

                _context.Employees.Add(employee);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(GetEmployees), new { id = employee.Id }, employee);
            }
        }
    }

}
