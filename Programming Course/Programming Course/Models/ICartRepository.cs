using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public interface ICartRepository
    {
        IEnumerable<Cart> Gets();
        Cart Get(string id);
        Cart Create(Cart e);
        Cart Edit(Cart e);
        bool Delete(string id);
    }
}
