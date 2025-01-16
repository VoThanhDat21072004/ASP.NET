using System;
using System.Linq;
using System.Web.Mvc;
using ChuyenDeASPNET.Context;  // Sử dụng context của bạn
using ChuyenDeASPNET.Models;   // Sử dụng model cho Order

namespace ChuyenDeASPNET.Areas.Admin.Controllers
{
    public class OrderController : Controller
    {
        ASPNETEntities1 db = new ASPNETEntities1(); // Đảm bảo db là context của bạn

        // GET: Admin/Order
        public ActionResult Index()
        {
            var lstOrder = db.Orders.ToList();  // Lấy danh sách các đơn hàng từ cơ sở dữ liệu
            return View(lstOrder);  // Trả về view với danh sách đơn hàng
        }

        // GET: Admin/Order/Details/5
        [HttpGet]
        public ActionResult Details(int? id)
        {
            if (id == null) return HttpNotFound();

            var order = db.Orders.FirstOrDefault(o => o.Id == id);
            if (order == null) return HttpNotFound();

            return View(order);  // Trả về view chi tiết đơn hàng
        }
    }
}
