using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.ViewModels
{
    public class ChangePassWordViewModel
    {
        public string userName { get; set; }
        [Display(Name ="Current Password")]
        [Required]
        [DataType(DataType.Password)]
        public string currentPassword { get; set; }
        [Display(Name = "New Password")]
        [Required]
        [DataType(DataType.Password)]
        public string newPassword { get; set; }
        [Display(Name = "Confirm Password")]
        [Required]
        [DataType(DataType.Password)]
        [Compare("newPassword", ErrorMessage = "Password not match")]
        public string confirmPassword { get; set; }
    }
}
