using System;
using System.Linq;
using System.Web.Mvc;
using ChuyenDeASPNET.Context;

namespace ChuyenDeASPNET.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        ASPNETEntities1 objASPNETEntities = new ASPNETEntities1();

        // GET: Admin/Category
        public ActionResult Index()
        {
            var lstCategory = objASPNETEntities.Categories.ToList();
            return View(lstCategory);
        }

        // GET: Admin/Category/Create
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Category/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Category category)
        {
            if (ModelState.IsValid)
            {
                objASPNETEntities.Categories.Add(category);
                objASPNETEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category);
        }

        // GET: Admin/Category/Edit/5
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var category = objASPNETEntities.Categories.Find(id);
            if (category == null) return HttpNotFound();

            return View(category);
        }

        // POST: Admin/Category/Edit/5
        [HttpPost]
        public ActionResult Edit(Category category)
        {
            if (ModelState.IsValid)
            {
                objASPNETEntities.Entry(category).State = System.Data.Entity.EntityState.Modified;
                objASPNETEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category);
        }

        // GET: Admin/Category/Delete/5
        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id == null) return HttpNotFound();

            var category = objASPNETEntities.Categories.Find(id);
            if (category == null) return HttpNotFound();

            return View(category);
        }

        // POST: Admin/Category/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult ConfirmDelete(int id)
        {
            var category = objASPNETEntities.Categories.Find(id);
            if (category == null) return HttpNotFound();

            objASPNETEntities.Categories.Remove(category);
            objASPNETEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Details(int? id)
        {
            if (id == null) return HttpNotFound();

            var category = objASPNETEntities.Categories.Find(id);
            if (category == null) return HttpNotFound();

            return View(category);
        }
    }
}
