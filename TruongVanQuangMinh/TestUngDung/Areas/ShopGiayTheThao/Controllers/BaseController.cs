using ModelEF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using TestUngDung.Areas.ShopGiayTheThao.Data;

namespace TestUngDung.Areas.ShopGiayTheThao.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var session = (LoginModel)Session[Constants.USER_SESSION];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new
                    RouteValueDictionary(new { controller = "Login", action = "Index", Areas = "ShopGiayTheThao" }));
            }
            base.OnActionExecuted(filterContext);
        }
        protected void SetAlert(String message, String type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else
            if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            else
            if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }
    }
}