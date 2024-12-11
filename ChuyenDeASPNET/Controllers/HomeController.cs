using ChuyenDeASPNET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class HomeController : Controller
    {
        ASPNETEntities objASPNETEntities = new ASPNETEntities();
        public ActionResult Index()
        {
            var lstProduct = objASPNETEntities.Products.ToList();
            return View(lstProduct);
        }
    }
}