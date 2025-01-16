using System;
using System.Linq;
using System.Web.Mvc;
using ChuyenDeASPNET.Context;
using ChuyenDeASPNET.Models; // Thêm namespace chứa các mô hình của bạn (nếu có)

namespace ChuyenDeASPNET.Areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        ASPNETEntities1 db = new ASPNETEntities1(); // Đảm bảo db là context của bạn

        // GET: Admin/Brand
        public ActionResult Index()
        {
            var lstBrand = db.Brands.ToList();
            return View(lstBrand);
        }

        // GET: Admin/Brand/Details/5
        [HttpGet]
        public ActionResult Details(int? id)
        {
            if (id == null) return HttpNotFound();

            var brand = db.Brands.FirstOrDefault(b => b.BrandID == id);
            if (brand == null) return HttpNotFound();

            return View(brand);
        }

        // GET: Admin/Brand/Create
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Brand/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Brand brand)
        {
            if (ModelState.IsValid)
            {
                db.Brands.Add(brand);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(brand);
        }

        // GET: Admin/Brand/Edit/5
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var brand = db.Brands.FirstOrDefault(b => b.BrandID == id);
            if (brand == null) return HttpNotFound();

            return View(brand);
        }

        // POST: Admin/Brand/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, Brand brand)
        {
            if (ModelState.IsValid)
            {
                var existingBrand = db.Brands.FirstOrDefault(b => b.BrandID == id);
                if (existingBrand != null)
                {
                    existingBrand.BrandName = brand.BrandName;
                    existingBrand.Description = brand.Description;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                return HttpNotFound();
            }
            return View(brand);
        }

        // GET: Admin/Brand/Delete/5
        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id == null) return HttpNotFound();

            var brand = db.Brands.FirstOrDefault(b => b.BrandID == id);
            if (brand == null) return HttpNotFound();

            return View(brand);
        }

        // POST: Admin/Brand/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult ConfirmDelete(int id)
        {
            var brand = db.Brands.FirstOrDefault(b => b.BrandID == id);
            if (brand != null)
            {
                db.Brands.Remove(brand);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
    }
}
