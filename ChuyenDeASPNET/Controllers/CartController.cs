using ChuyenDeASPNET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChuyenDeASPNET.Models;

namespace ChuyenDeASPNET.Controllers
{
    public class CartController : Controller
    {
        // Khởi tạo đối tượng kết nối cơ sở dữ liệu
        ASPNETEntities1 objASPNETEntities = new ASPNETEntities1();

        // Hiển thị giỏ hàng
        public ActionResult Index()
        {
            // Trả về danh sách sản phẩm trong giỏ hàng từ session
            return View((List<CartModel>)Session["cart"]);
        }

        // Thêm sản phẩm vào giỏ hàng
        public ActionResult AddToCart(int id, int quantity)
        {
            // Nếu giỏ hàng chưa tồn tại, khởi tạo giỏ hàng mới
            if (Session["cart"] == null)
            {
                List<CartModel> cart = new List<CartModel>();
                cart.Add(new CartModel
                {
                    Product = objASPNETEntities.Products.Find(id),
                    Quantity = quantity
                });
                Session["cart"] = cart;
                Session["count"] = 1; // Cập nhật số lượng sản phẩm trong giỏ hàng
            }
            else
            {
                // Nếu giỏ hàng đã tồn tại, kiểm tra sản phẩm
                List<CartModel> cart = (List<CartModel>)Session["cart"];
                int index = isExist(id);

                if (index != -1)
                {
                    // Nếu sản phẩm đã tồn tại, tăng số lượng
                    cart[index].Quantity += quantity;
                }
                else
                {
                    // Nếu chưa tồn tại, thêm sản phẩm mới
                    cart.Add(new CartModel
                    {
                        Product = objASPNETEntities.Products.Find(id),
                        Quantity = quantity
                    });
                    Session["count"] = Convert.ToInt32(Session["count"]) + 1; // Tăng số lượng sản phẩm
                }
                Session["cart"] = cart; // Cập nhật giỏ hàng vào session
            }

            return Json(new { Message = "Thành công", JsonRequestBehavior.AllowGet });
        }

        // Hàm kiểm tra sản phẩm đã tồn tại trong giỏ hàng
        private int isExist(int id)
        {
            List<CartModel> cart = (List<CartModel>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].Product.ProductID.Equals(id))
                    return i;
            }
            return -1; // Trả về -1 nếu không tìm thấy
        }

        // Xóa sản phẩm khỏi giỏ hàng
        public ActionResult Remove(int id)
        {
            List<CartModel> cart = (List<CartModel>)Session["cart"];
            cart.RemoveAll(x => x.Product.ProductID == id); // Xóa sản phẩm theo ID
            Session["cart"] = cart;

            // Cập nhật số lượng sản phẩm trong giỏ hàng
            if (Session["count"] != null)
            {
                Session["count"] = Convert.ToInt32(Session["count"]) - 1;
            }

            return Json(new { Message = "Thành công", JsonRequestBehavior.AllowGet });
        }
    }
}
