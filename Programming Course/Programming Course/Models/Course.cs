using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public class Course
    {
        public string courseId { get; set; }
        public string image { get; set; }
        public string name { get; set; }
        public int price { get; set; }
        public string description { get; set; }
        public List<Bill> bill { get; set; }
    }
}
