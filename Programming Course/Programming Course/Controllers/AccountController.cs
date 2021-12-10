using Microsoft.AspNetCore.Authorization;
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
    [Authorize(Roles = "System Admin, Admin")]
    public class AccountController : Controller
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly SignInManager<ApplicationUser> signInManager;
        private readonly RoleManager<IdentityRole> roleManager;

        public AccountController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, RoleManager<IdentityRole> roleManager)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.roleManager = roleManager;
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Login()
        {
            
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = await signInManager.PasswordSignInAsync(model.User, model.Password, isPersistent: model.Rememberme, lockoutOnFailure: false);
                if (result.Succeeded)
                {
                    
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Wrong User or Password");

                }
            }
            return View(model);
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser()
                {
                    Email = model.Email,
                    UserName = model.User,
                    PhoneNumber = model.Password
                };
                var result = await userManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    await signInManager.SignInAsync(user, isPersistent: false);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }
                }
            }
            return View(model);
        }
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Logout()
        {
            await signInManager.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }
        public string GetRoleName(string userId)
        {
            var user = Task.Run(async () => await userManager.FindByIdAsync(userId)).Result;
            var roles = Task.Run(async () => await userManager.GetRolesAsync(user)).Result;
            return roles != null ? string.Join(",", roles) : string.Empty;
        }
        public IActionResult Index()
        {
            var users = userManager.Users;
            if (users != null)
            {
                var model = new List<UserViewModel>();
                model = users.Select(u => new UserViewModel()
                {
                    User = u.UserName,
                    Id = u.Id,
                    Email = u.Email,
                    PhoneNumber = u.PhoneNumber
                }).ToList();
                foreach (var user in model)
                {
                    user.Role = GetRoleName(user.Id);
                }

                return View(model);
            }
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> Delete(string id)
        {
            var user = await userManager.FindByIdAsync(id);
            if(user == null)
            {
                return View("~/Views/Error/AccountNotFound.cshtml");
            }   
            else
            {
                var delUser = new UserDeleteViewModel()
                {
                    id = user.Id
                };
                return View("~/Views/Dashboard/Account/Delete.cshtml",delUser);

            }
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Delete(UserDeleteViewModel model)

        {
            if(ModelState.IsValid)
            {
                if (model.confirm.Equals("I'm not a robot"))
                {
                    var user = await userManager.FindByIdAsync(model.id);
                    if (user != null)
                    {
                        var result = await userManager.DeleteAsync(user);
                        if (result.Succeeded)
                        {
                            return RedirectToAction("index", "account");
                        }
                        foreach (var error in result.Errors)
                        {
                            ModelState.AddModelError("", error.Description);
                        }
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Confirm not match");

                }
            }    
       
            return View();
        }
        [HttpGet]
        public IActionResult Create()
        {
            ViewBag.Roles = roleManager.Roles;
            return View("~/Views/Dashboard/Account/Create.cshtml");
        }
        [HttpPost]
        public async Task<IActionResult> CreateAsync(UserCreateViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser()
                {
                    UserName = model.User,
                    Email= model.Email

                };
                var result = await userManager.CreateAsync(user, model.PassWord);
                if (result.Succeeded)
                {
                    if (!string.IsNullOrEmpty(model.RoleId))
                    {
                        var role = await roleManager.FindByIdAsync(model.RoleId);
                        var addRoleResult = await userManager.AddToRoleAsync(user, role.Name);
                        if (addRoleResult.Succeeded)
                            return RedirectToAction("Index", "account");
                        foreach (var error in addRoleResult.Errors)
                        {
                            ModelState.AddModelError("", error.Description);
                        }
                    }
                }
                else
                {
                    foreach (var error in result.Errors)
                    {
                       
                        ModelState.AddModelError("", error.Description);
                    }
                }
            }
            ViewBag.Roles = roleManager.Roles;
            return View(model);
        }
        [HttpGet]
        public async Task<IActionResult> Edit(string id)
        {
            var user = await userManager.FindByIdAsync(id);
            if (user == null)
            {
                return View("~/Views/Error/AccountNotFound.cshtml");
            }
            else
            {
                var model = new UserEditViewModel()
                {
                    userId = user.Id,
                    phoneNumber = user.PhoneNumber,
                    email = user.Email
                };
                var rolesName = await userManager.GetRolesAsync(user);
                if (rolesName != null && rolesName.Any())
                {
                    var role = await roleManager.FindByNameAsync(rolesName.FirstOrDefault());
                    model.RoleId = role.Id;
                }
                ViewBag.Roles = roleManager.Roles;
                return View("~/Views/Dashboard/Account/Edit.cshtml",model);
            }    
    
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Edit(UserEditViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await userManager.FindByIdAsync(model.userId);
                if (user != null)
                {
                    user.Id = model.userId;
                    user.PhoneNumber = model.phoneNumber;
                    user.Email = model.email;
                    var result = await userManager.UpdateAsync(user);
                    if (result.Succeeded)
                    {
                        var rolesName = await userManager.GetRolesAsync(user);
                        var delRole = await userManager.RemoveFromRolesAsync(user, rolesName);
                        if (!string.IsNullOrEmpty(model.RoleId))
                        {
                            var role = await roleManager.FindByIdAsync(model.RoleId);
                            var addRoleResult = await userManager.AddToRoleAsync(user, role.Name);
                            if (addRoleResult.Succeeded)
                                return RedirectToAction("Index", "account");
                            foreach (var error in addRoleResult.Errors)
                            {
                                ModelState.AddModelError("", error.Description);
                            }
                        }
                        return RedirectToAction("index", "account");
                    }

                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }

                }
            }
            ViewBag.Roles = roleManager.Roles;
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
        public IActionResult ChangePassWord()
        {

            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> ChangePassWord(ChangePassWordViewModel model)
        {
            if(ModelState.IsValid)
            {
                var user = await userManager.FindByNameAsync(model.userName);
                var result = await userManager.ChangePasswordAsync(user, model.currentPassword, model.newPassword);
                if(result.Succeeded)
                {
                    ModelState.AddModelError("", "Password Changed"); ;
                }
                foreach(var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
            }
            return View();
        }
    }
}
