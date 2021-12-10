using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public class Bill
    {
        public string billId { get; set; }
        public Course coures { get; set; }
        public string couresId { get; set; }
        public string couresName { get; set; }
        public string customerName { get; set; }
        public string customerAddress { get; set; }
        public string customerPhoneNumber { get; set; }
    }
}
