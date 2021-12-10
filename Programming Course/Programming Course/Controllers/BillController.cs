using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Programming_Course.Models;
using Programming_Course.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Programming_Course.Controllers
{
    [Authorize(Roles = "System Admin, Admin, Sale")]
    public class BillController : Controller
    {
        private IBillRepository billRepository;
        private IWebHostEnvironment webHostEnvironment;
        public ICourseRepository courseRepository;
        private readonly UserManager<ApplicationUser> userManager;
        private readonly ICartRepository cartRepository;

        public BillController(ICourseRepository courseRepository, IBillRepository billRepository, IWebHostEnvironment webHostEnvironment, UserManager<ApplicationUser> userManager, ICartRepository cartRepository)
        {
            this.billRepository = billRepository;
            this.webHostEnvironment = webHostEnvironment;
            this.userManager = userManager;
            this.cartRepository = cartRepository;
            this.courseRepository = courseRepository;
        }

        public IActionResult Index()
        {
            ViewBag.Bills = billRepository.Gets();
            return View("~/Views/Dashboard/Bill/Index.cshtml");
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Create(string id)
        {
            var course = courseRepository.Get(id);
            if (course == null)
            {
                return View("~/Views/Error/CourseNotFound.cshtml");
            }
            else
            {
                var model = new BillCreateViewModel()
                {
                    couresId = course.courseId,
                    couresName = course.name,
                    couresImage = course.image,
                    coursePrice = course.price.ToString()
                };
                return View(model);
            }
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public IActionResult Create(BillCreateViewModel model)
        {
            if(ModelState.IsValid)
            {
                var course = courseRepository.Get(model.couresId);
                var bill = new Bill()
                {
                    billId = $"{Guid.NewGuid()}",
                    customerName = model.customerName,
                    customerAddress = model.customerAddress,
                    customerPhoneNumber = model.customerPhoneNumber,
                    couresId = model.couresId,
                    couresName = course.name

                };
                var cart = new Cart()
                {
                    cartId = $"{Guid.NewGuid()}",
                    user = model.user,
                    courseImage = model.couresImage,
                    courseName = model.couresName,
                    coursePrice = model.coursePrice
                };
                billRepository.Create(bill);
                cartRepository.Create(cart);
                return RedirectToAction("Thank", "Bill");
            }
            return View(model);
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult AccessDenied()
        {
            return View();
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Thank()
        {
            return View();
        }
        [AllowAnonymous]
        public IActionResult Cart()
        {
            ViewBag.Carts = cartRepository.Gets();
            return View();
        }
    }
}
