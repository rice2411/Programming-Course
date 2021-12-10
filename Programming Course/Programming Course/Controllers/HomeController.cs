using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Programming_Course.Models;
using Programming_Course.ViewModels;

namespace Programming_Course.Controllers
{
    public class HomeController : Controller
    {
        private ICourseRepository courseRepository;
        private IWebHostEnvironment webHostEnvironment;

        public HomeController(ICourseRepository courseRepository, IWebHostEnvironment webHostEnvironment)
        {
            this.courseRepository = courseRepository;
            this.webHostEnvironment = webHostEnvironment;
        }
        [AllowAnonymous]
        public IActionResult Index()
        {
            ViewBag.Course = courseRepository.Gets();
            return View();
        }
        [AllowAnonymous]
        public IActionResult Detail(string id)
        {
            var course = courseRepository.Get(id);
            var listCourse = new List<HomeDetailViewModel>();
            if(course == null)
            {
                return View("~/Views/Error/CourseNotFound.cshtml");
            }   
            else
            {
                var detailCourse = new HomeDetailViewModel()
                {
                    name = course.name,
                    courseId = course.courseId,
                    description = course.description,
                    image = course.image,
                    price = course.price
                };
                listCourse.Add(detailCourse);
                return View(listCourse);
            }
            return View();
         
        }
   
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Search(List<HomeDetailViewModel> model)
        {
            if (model[0].name == null)
            {
                return RedirectToAction("index","home");
            }
            else
            {
                try
                {
                    var courseResult = new List<HomeDetailViewModel>();
                    var courses = courseRepository.Gets();
                    var names = from course in courses select course.name;
                    var keyBefore = model[0].name.Trim().ToLower();
                    string key = "";
                    for(int i =0; i< keyBefore.Length;i++)
                    {
                        if (!Char.IsWhiteSpace(keyBefore[i]))
                            key += keyBefore[i];
                    }
                  foreach (var name in names)
                    {
                        if(name.ToLower().Contains(key))
                        {
                            var result = courses.FirstOrDefault(c => c.name.ToLower() == name.ToLower());
                            if(result!=null)
                            {
                                var course = new HomeDetailViewModel()
                                {
                                    courseId = result.courseId,
                                    description = result.description,
                                    image = result.image,
                                    name = result.name,
                                    price = result.price
                                };
                                courseResult.Add(course);
                            }
                        }
                    }
                    if(courseResult.Count==0)
                    {
                        return View("~/Views/Error/SearchNull.cshtml");
                    }
                    else
                    {
                        return View(courseResult);
                    }
                 
                }
                catch (Exception e)
                {
                    return View("~/Views/Error/SearchNull.cshtml");
                }
            }
            return View();
        }
        
    }
}
