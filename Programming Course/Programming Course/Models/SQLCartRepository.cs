using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public class SQLCartRepository : ICartRepository
    {
        private readonly AppDbContext context;
        public SQLCartRepository(AppDbContext context)
        {
            this.context = context;

        }
        public Cart Create(Cart e)
        {
            context.Carts.Add(e);
            context.SaveChanges();
            return e;
        }



        public bool Delete(string id)
        {
            var delEmp = context.Carts.Find(id);
            if (delEmp != null)
            {
                context.Carts.Remove(delEmp);
                return context.SaveChanges() > 0;
            }
            return false;
        }

        public Cart Edit(Cart c)
        {
            var editEmp = context.Carts.Attach(c);
            editEmp.State = EntityState.Modified;
            context.SaveChanges();
            return c;
        }


        public Cart Get(string id)
        {
            return context.Carts.Find(id);
        }
        public IEnumerable<Cart> Gets()
        {
            return context.Carts;
        }
    }
}
