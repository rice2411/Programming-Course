using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public interface IBillRepository
    {
        IEnumerable<Bill> Gets();
        Bill Get(string id);
        Bill Create(Bill c);
        Bill Edit(Bill c);
        bool Delete(string id);
    }
}
