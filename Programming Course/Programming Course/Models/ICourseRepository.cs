using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public interface ICourseRepository
    {
        IEnumerable<Course> Gets();
        Course Get(string id);
        Course Create(Course c);
        Course Edit(Course c);
        bool Delete(string id);
    }
}
