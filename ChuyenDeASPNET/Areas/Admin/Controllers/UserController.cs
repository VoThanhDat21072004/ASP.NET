using System.Linq;
using System.Web.Mvc;
using ChuyenDeASPNET.Context; // Thêm namespace chứa context của bạn

namespace ChuyenDeASPNET.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        private ASPNETEntities1 db = new ASPNETEntities1(); // Khởi tạo context

        // GET: Admin/User
        public ActionResult Index()
        {
            var users = db.Users.ToList(); // Lấy danh sách người dùng
            return View(users); // Truyền danh sách người dùng vào View
        }
    }
}
