using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.ViewModels
{
    public class CourseEditViewModel 
    {
        [Display(Name = "Course Id")]
        public string courseId { get; set; }

        public IFormFile image { get; set; }
        [Required]
        [Display(Name = "Coures's Name")]
        public string name { get; set; }
        [Required(ErrorMessage = "Price is invalid")]
        [Display(Name = "Price")]
        public int? price { get; set; }
        [Required]
        [Display(Name = "Description")]
        public string description { get; set; }
        public string Image { get; set; }
    }
}
