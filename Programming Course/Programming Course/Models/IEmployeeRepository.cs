using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public interface IEmployeeRepository
    {
        IEnumerable<Employee> Gets();
        Employee Get(string id);
        Employee Create(Employee e);
        Employee Edit(Employee e);
        bool Delete(string id);
    }
}
