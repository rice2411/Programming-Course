using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.ViewModels
{
    public class UserEditViewModel
    {
        public string userId { get; set; }
        [Required]
        [EmailAddress]
        [RegularExpression(@"^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$", ErrorMessage = "Invalid Email")]
        public string email { get; set; }
        public string phoneNumber { get; set; }
        [Display(Name = "Role")]
        public string RoleId { get; set; }
    }
}
