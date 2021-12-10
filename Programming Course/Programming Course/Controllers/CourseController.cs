using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Programming_Course.Models;
using Programming_Course.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Controllers
{
    [Authorize(Roles = "System Admin, Admin")]
    public class CourseController : Controller
    {
        private ICourseRepository courseRepository;
        private IWebHostEnvironment webHostEnvironment;

        public CourseController(ICourseRepository courseRepository, IWebHostEnvironment webHostEnvironment)
        {
            this.courseRepository = courseRepository;
            this.webHostEnvironment = webHostEnvironment;

        }
        public string SetCourseId()
        {
            var listEmp = courseRepository.Gets();
            var empId = listEmp.Max(id => id.courseId);
            string stringId = "";
            for (int i = 1; i < empId.Length; i++)
                stringId += empId[i];
            int id = int.Parse(stringId);
            id++;
            string result = $"C{id}";
            if (id < 10)
                return result = $"C0{id}";
            return result;
        }
        public IActionResult Index()
        {
            ViewBag.courses = courseRepository.Gets();

            return View("~/Views/Dashboard/Course/Index.cshtml");
        }
        [HttpGet]
        public ViewResult Create()
        {
            return View("~/Views/Dashboard/Course/Create.cshtml");
        }
        [HttpPost]
        public IActionResult Create(CourseCreateViewModel c)
        {
            if (ModelState.IsValid)
            {
                var newCourse = new Course()
                {
                    courseId = SetCourseId(),
                    name=c.name.ToUpper(),
                    price=c.price.Value,
                    description=c.description
                };
                var fileName = string.Empty;
                if (c.image != null)
                {
                    string uploadImg = Path.Combine(webHostEnvironment.WebRootPath, "images");
                    fileName = $"{Guid.NewGuid()}_{c.image.FileName}";
                    var filePath = Path.Combine(uploadImg, fileName);
                    using (var fs = new FileStream(filePath, FileMode.Create))
                    {
                        c.image.CopyTo(fs);
                    }
                }
                newCourse.image = fileName;
                var newF = courseRepository.Create(newCourse);
                return RedirectToAction("Detail", "Home", new { id = newCourse.courseId });
            }
            return View();
        }
        [HttpGet]
        public ViewResult Edit(string id)
        {
            var course = courseRepository.Get(id);
            if(course == null)
            {
                return View("~/Views/Error/CourseNotFound.cshtml");
            }    
            else
            {
                var editCourse = new CourseEditViewModel()
                {
                    courseId = course.courseId,
                    name = course.name,
                    price = course.price,
                    description = course.description,
                    Image = course.image
                };
                return View("~/Views/Dashboard/Course/Edit.cshtml",editCourse);
            }
            return View();
        }
        [HttpPost]
        public IActionResult Edit(CourseEditViewModel c)
        {
            if (ModelState.IsValid )
            {
                var newCourse = new Course()
                {
                    courseId = c.courseId,
                    name = c.name,
                    price = c.price.Value,
                    description = c.description
                };
                var fileName = string.Empty;
                if (c.image != null)
                {
                    string uploadImg = Path.Combine(webHostEnvironment.WebRootPath, "images");
                    fileName = $"{Guid.NewGuid()}_{c.image.FileName}";
                    var filePath = Path.Combine(uploadImg, fileName);
                    using (var fs = new FileStream(filePath, FileMode.Create))
                    {
                        c.image.CopyTo(fs);
                    }
                    newCourse.image = fileName;
                    if (!string.IsNullOrEmpty(c.Image))
                    {
                        string delFile = Path.Combine(webHostEnvironment.WebRootPath, "images", c.Image);
                        System.IO.File.Delete(delFile);
                    }
                }
                else
                {
                    newCourse.image = c.Image;
                }

                if (courseRepository.Edit(newCourse) != null)
                {
                    return RedirectToAction("Index", "Course", new { id = newCourse.courseId });
                }
            }
          
            return View(c);
        }
        [HttpPost]

        public IActionResult Delete(CourseEditViewModel c)
        {
            if (courseRepository.Delete(c.courseId))
                return RedirectToAction("Index", "Course");
            return RedirectToAction("Index", "Course");
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}
