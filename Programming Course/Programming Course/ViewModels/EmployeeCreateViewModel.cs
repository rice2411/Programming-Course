using Microsoft.AspNetCore.Http;
using Programming_Course.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.ViewModels
{
    public class EmployeeCreateViewModel
    {
       

        [Display(Name ="Employee Id")]
        public string employeeId { get; set; }
        [Required]
        [Display(Name = "Full Name")]
        public string name { get; set; }
        public IFormFile avatar { get; set; }
        [Required]
        [RegularExpression(@"^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$", ErrorMessage = "Invalid Email")]
        [Display(Name = "Email")]
        public string email { get; set; }
        [Required(ErrorMessage = "Department is required")]
        [Display(Name = "Department")]
        public DPM? department { get; set; }
        [Display(Name="Role")]
        public string RoleId { get; set; }
    }
}
