using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PustokDb2022.DAL;
using PustokDb2022.Models;
using PustokDb2022.ViewModels;

namespace PustokDb2022.Controllers
{
    public class AccountController : Controller
    {
        private readonly PustokDbContext _pustokcontext;
        private readonly UserManager<AppUser> _userManager;

        public AccountController(PustokDbContext pustokContext, UserManager<AppUser> userManager)
        {
            _pustokcontext = pustokContext;
            _userManager= userManager;
        }
        public IActionResult Login()
        {
            return View();
        }

        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> RegisterAsync(MemberRegisterViewModel memberVM)
        {
            if(!ModelState.IsValid)
                return View();
            //AppUser user = _pustokdbcontext.AppUsers.FirstOrDefault(x=>x.NormalizedUserName == memberVM.UserName.ToUpper());

            if (await _userManager.FindByNameAsync(memberVM.UserName) != null)
            {
                ModelState.AddModelError("Username", "This Username already exist!");
                return View();
            }
            else if (await _userManager.FindByEmailAsync(memberVM.Email) != null)
            {
                ModelState.AddModelError("Email", "This Email already exist!");
                return View();
            }

            AppUser user = new AppUser
            {
                UserName = memberVM.UserName,
                Email = memberVM.Email,
                FullName= memberVM.FullName,
            };

            var result = await _userManager.CreateAsync(user, memberVM.Password);

           if(!result.Succeeded)
            {
                foreach(var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
                return View();
            }

            return RedirectToAction("login");
        }
    }
}
