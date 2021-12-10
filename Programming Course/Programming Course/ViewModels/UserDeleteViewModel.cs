using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.ViewModels
{
    public class UserDeleteViewModel
    {
        public string id { get; set; }
        [Required]
        [Display(Name ="Confirm")]
        public string confirm { get; set; }
    }
}
