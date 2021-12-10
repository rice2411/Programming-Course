using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public class Employee
    {
        public string employeeId { get; set; }
        public string name { get; set; }
        public string avatar { get; set; }
        public string email { get; set; }
        public string role { get; set; }
        public DPM department { get; set; }
        public List<Bill> bill { get; set; }
    }
}
