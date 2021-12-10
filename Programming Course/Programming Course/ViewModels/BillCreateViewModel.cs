using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.ViewModels
{
    public class BillCreateViewModel 
    {
        public string couresId { get; set; }
     
        public string couresName { get; set; }
        public string couresImage { get; set; }
        [Required]
        [Display(Name = "Name")]
  
        public string customerName { get; set; }
        [Required]
        [Display(Name = "Address")]
        public string customerAddress { get; set; }
        [Required]
        [Display(Name = "PhoneNumber")]
        public string customerPhoneNumber { get; set; }
        public string user { get; set; }
        public string coursePrice { get; set; }
    }
}
