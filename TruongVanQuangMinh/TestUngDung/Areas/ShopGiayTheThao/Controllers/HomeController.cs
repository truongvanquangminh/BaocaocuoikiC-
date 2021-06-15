using ModelEF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Areas.ShopGiayTheThao.Data;

namespace TestUngDung.Areas.ShopGiayTheThao.Controllers
{
    public class HomeController : Controller
    {
        // GET: ShopGiayTheThao/Home
        public ActionResult Index()
        {
            var session = (LoginModel)Session[Constants.USER_SESSION];
            if (session == null) return RedirectToAction("Index", "Login");
            return View();
        }
        public ActionResult Logout()
        {
            Session[Constants.USER_SESSION] = null;
            return RedirectToAction("Index", "Login");
        }
    }
}