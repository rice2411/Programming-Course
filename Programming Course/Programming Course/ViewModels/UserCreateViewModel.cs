using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.ViewModels
{
    public class UserCreateViewModel
    {
        [Required]
        public string User { get; set; }
        [Required]
 
        [RegularExpression(@"^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$", ErrorMessage = "Invalid Email")]
        public string Email { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string PassWord { get; set; }
        [Required]
        [DataType(DataType.Password)]
        [Compare("PassWord", ErrorMessage = "PassWord not maatch")]
        public string ConfirmPassword { get; set; }
        [Display(Name = "Role")]
        public string RoleId { get; set; }
    }
}
