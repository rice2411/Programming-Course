using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Models
{
    public class SQLCourseRepository : ICourseRepository
    {
        private readonly AppDbContext context;
        public SQLCourseRepository(AppDbContext context)
        {
            this.context = context;
     
        }
        public Course Create(Course c)
        {
            context.Course.Add(c);
            context.SaveChanges();
            return c;
        }

    

        public bool Delete(string id)
        {
            var delCourse = context.Course.Find(id);
            if (delCourse != null)
            {
                context.Course.Remove(delCourse);
                return context.SaveChanges() > 0;
            }
            return false;
        }

        public Course Edit(Course c)
        {
            var editCourse = context.Course.Attach(c);
            editCourse.State = EntityState.Modified;
            context.SaveChanges();
            return c;
        }

   
        public Course Get(string id)
        {
            return context.Course.Find(id);
        }
        public IEnumerable<Course> Gets()
        {
            return context.Course;
        }
    }
}
