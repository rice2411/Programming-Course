using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public class SQLEmployeeRepository : IEmployeeRepository
    {
        private readonly AppDbContext context;
        public SQLEmployeeRepository(AppDbContext context)
        {
            this.context = context;

        }
        public Employee Create(Employee e)
        {
            context.Employees.Add(e);
            context.SaveChanges();
            return e;
        }



        public bool Delete(string id)
        {
            var delEmp = context.Employees.Find(id);
            if (delEmp != null)
            {
                context.Employees.Remove(delEmp);
                return context.SaveChanges() > 0;
            }
            return false;
        }

        public Employee Edit(Employee c)
        {
            var editEmp = context.Employees.Attach(c);
            editEmp.State = EntityState.Modified;
            context.SaveChanges();
            return c;
        }


        public Employee Get(string id)
        {
            return context.Employees.Find(id);
        }
        public IEnumerable<Employee> Gets()
        {
            return context.Employees;
        }
    }
}
