using ChuyenDeASPNET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class UserController : Controller
    {
        // GET: User/Login
        public ActionResult Login()
        {
            return View();
        }

        // GET: User/Register
        public ActionResult Register()
        {
            return View();
        }

        // POST: User/Login
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            // Log thông tin đăng nhập
            System.Diagnostics.Debug.WriteLine($"Username: {username}, Password: {password}");

            using (var db = new MyDbContext())
            {
                var user = db.Users
                             .FirstOrDefault(u => u.UserName == username && u.Password == password);

                if (user != null)
                {
                    // Lưu thông tin người dùng vào Session
                    Session["UserID"] = user.UserID.ToString(); // Lấy UserID từ database
                    Session["UserName"] = user.UserName; // Lấy tên đăng nhập từ database
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    // Nếu không tìm thấy người dùng, hiển thị thông báo thất bại
                    ViewBag.ErrorMessage = "Tên người dùng hoặc mật khẩu không hợp lệ.";
                    return View("Login");
                }
            }
        }

        // POST: User/Register
        [HttpPost]
        public ActionResult Register(User newUser)
        {
            if (ModelState.IsValid)
            {
                using (var db = new MyDbContext())
                {
                    // Thêm người dùng mới vào database
                    db.Users.Add(newUser);
                    db.SaveChanges();
                }
                return RedirectToAction("Login");
            }
            return View();
        }
    }
}