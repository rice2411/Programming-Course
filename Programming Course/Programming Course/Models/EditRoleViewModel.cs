using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public class EditRoleViewModel
    {
        public string id { get; set; }
        [Required]
        [Display(Name ="Role Name")]
        public string roleName { get; set; }
    }
}
