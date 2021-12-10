using Microsoft.AspNetCore.Http;
using Programming_Course.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.ViewModels
{
    public class CourseCreateViewModel 
    {
     
        [Display(Name ="Course Id")]
        public string courseId { get; set; }
    
        public IFormFile image { get; set; }
        [Required]
        [Display(Name ="Coures's Name")]
        public string name { get; set; }
        [Required(ErrorMessage ="Price is invalid")]
        [Display(Name ="Price")]
        public int? price { get; set; }
        [Required]
        [Display(Name = "Description")]
        public string description { get; set; }
    }
}
