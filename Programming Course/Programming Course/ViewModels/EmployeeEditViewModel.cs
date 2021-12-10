    using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.ViewModels
{
    public class EmployeeEditViewModel : EmployeeCreateViewModel
    {
        public string Avatar { get; set; }
        public string Role { get; set; }
    }
}
