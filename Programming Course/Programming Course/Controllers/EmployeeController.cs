using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Programming_Course.Models;
using Programming_Course.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Controllers
{
    [Authorize(Roles = "System Admin, Admin")]
    public class EmployeeController : Controller
    {
        private IEmployeeRepository employeeRepository;
        private IWebHostEnvironment webHostEnvironment;
   
        private readonly UserManager<ApplicationUser> userManager;
        private readonly SignInManager<ApplicationUser> signInManager;

        public EmployeeController(IEmployeeRepository employeeRepository, IWebHostEnvironment webHostEnvironment, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager)
        {
            this.employeeRepository = employeeRepository;
            this.webHostEnvironment = webHostEnvironment;
   
            this.userManager = userManager;
            this.signInManager = signInManager;
        }
        public string GetRoleName(string empId)
        {
            string role="";
            var emp = employeeRepository.Get(empId);
            if (emp != null)
                return role = emp.role;
            return role;
        }
        public IActionResult Index()
        {
            ViewBag.empolyees = employeeRepository.Gets();

            return View("~/Views/Dashboard/Employee/Index.cshtml");
        }
        [HttpGet]
        public ViewResult Create()
        {
   
            return View("~/Views/Dashboard/Employee/Create.cshtml");
        }
        public string SetEmployeeId()
        {
            var listEmp = employeeRepository.Gets();
            var empId = listEmp.Max(id => id.employeeId);
            string stringId = "";
            for (int i = 1; i < empId.Length; i++)
                stringId += empId[i];
            int id = int.Parse(stringId);
            id++;
            string result = $"E{id}";
            if (id < 10)
                return result = $"E0{id}";
            return result;
        }
        [HttpPost]
        public IActionResult Create(EmployeeCreateViewModel e)
        {
            if (ModelState.IsValid)
            {
              
               
                var newEmp = new Employee()
                {
                    name = e.name,
                    email = e.email,
                    employeeId = SetEmployeeId(),
                    department = e.department.Value,
               
                };
                var fileName = string.Empty;
                if (e.avatar != null)
                {
                    string uploadImg = Path.Combine(webHostEnvironment.WebRootPath, "images");
                    fileName = $"{Guid.NewGuid()}_{e.avatar.FileName}";
                    var filePath = Path.Combine(uploadImg, fileName);
                    using (var fs = new FileStream(filePath, FileMode.Create))
                    {
                        e.avatar.CopyTo(fs);
                    }
                }
                newEmp.avatar = fileName;
            
                var newE = employeeRepository.Create(newEmp);
                return RedirectToAction("Detail", "Employee", new { id = newEmp.employeeId });
            }
            return View();
        }
        [HttpGet]
        public ViewResult Detail(string id)
        {
            var emp = employeeRepository.Get(id);
            if (emp == null)
            {
                return View("~/Views/Error/EmployeeNotFound.cshtml");
            }
            else
            {
                var editEmp = new EmployeeEditViewModel()
                {
                    name = emp.name,
                    email = emp.email,
                    employeeId = emp.employeeId,
                    department = emp.department,
                    Avatar = emp.avatar,
                    Role = emp.role
                };
                return View("~/Views/Dashboard/Employee/Detail.cshtml",editEmp);
            }
            return View();
        }
        [HttpGet]
        public IActionResult Edit(string id)
        {
            var emp = employeeRepository.Get(id);
           
            if (emp == null)
            {
                return View("~/Views/Error/EmployeeNotFound.cshtml");
            }
            else
            {
                var editEmp = new EmployeeEditViewModel()
                {
                    name = emp.name,
                    email = emp.email,
                    employeeId = emp.employeeId,
                    department = emp.department,
                    Avatar = emp.avatar,
                    Role = emp.role
                };
                return View("~/Views/Dashboard/Employee/Edit.cshtml",editEmp);
            }
            return View();
        }
        [HttpPost]
        public IActionResult Edit(EmployeeEditViewModel e)
        {
            if (ModelState.IsValid)
            {
                var newEmp = new Employee()
                {
                    name = e.name,
                    email = e.email,
                    employeeId = e.employeeId,
                    department = e.department.Value,
                  
                };
                var fileName = string.Empty;
                if (e.avatar != null)
                {
                    string uploadImg = Path.Combine(webHostEnvironment.WebRootPath, "images");
                    fileName = $"{Guid.NewGuid()}_{e.avatar.FileName}";
                    var filePath = Path.Combine(uploadImg, fileName);
                    using (var fs = new FileStream(filePath, FileMode.Create))
                    {
                        e.avatar.CopyTo(fs);
                    }
                    newEmp.avatar = fileName;
                    if (!string.IsNullOrEmpty(e.Avatar))
                    {
                        string delFile = Path.Combine(webHostEnvironment.WebRootPath, "images", e.Avatar);
                        System.IO.File.Delete(delFile);
                    }
                } 
                else
                {
                    newEmp.avatar = e.Avatar;
                }
            
                if (employeeRepository.Edit(newEmp) != null)
                {
                    return RedirectToAction("Detail", "Employee", new { id = newEmp.employeeId });
                }
            }

            return View();
        }
        [HttpPost]

        public IActionResult Delete(EmployeeEditViewModel e)
        {
            if (employeeRepository.Delete(e.employeeId))
                return RedirectToAction("Index", "Employee");
            return RedirectToAction("Index", "Employee");
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}

