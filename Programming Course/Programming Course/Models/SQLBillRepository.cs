using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public class SQLBillRepository : IBillRepository
    {
        private readonly AppDbContext context;
        public SQLBillRepository(AppDbContext context)
        {
            this.context = context;

        }
        public Bill Create(Bill e)
        {
            context.Bills.Add(e);
            context.SaveChanges();
            return e;
        }



        public bool Delete(string id)
        {
            var delEmp = context.Bills.Find(id);
            if (delEmp != null)
            {
                context.Bills.Remove(delEmp);
                return context.SaveChanges() > 0;
            }
            return false;
        }

        public Bill Edit(Bill c)
        {
            var editEmp = context.Bills.Attach(c);
            editEmp.State = EntityState.Modified;
            context.SaveChanges();
            return c;
        }


        public Bill Get(string id)
        {
            return context.Bills.Find(id);
        }
        public IEnumerable<Bill> Gets()
        {
            return context.Bills;
        }
    }
}
