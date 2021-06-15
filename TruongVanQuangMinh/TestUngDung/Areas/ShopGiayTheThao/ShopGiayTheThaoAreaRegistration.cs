using System.Web.Mvc;

namespace TestUngDung.Areas.ShopGiayTheThao
{
    public class ShopGiayTheThaoAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "ShopGiayTheThao";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            //context.MapRoute(
            //    "Create_default",
            //    "ShopGiayTheThao/{controller}/{action}/{users}",
            //    new { controller = "User", action = "Create", users = UrlParameter.Optional }
            //);
            //context.MapRoute(
            //    "Delete_default",
            //    "ShopGiayTheThao/{controller}/{action}/{users}",
            //    new { controller = "User", action = "Delete", users = UrlParameter.Optional }
            //);
            //context.MapRoute(
            //    "User_Index_default",
            //    "ShopGiayTheThao/{controller}",
            //    new { controller = "User", id = UrlParameter.Optional }
            //);
            context.MapRoute(
                "ShopGiayTheThao_default",
                "ShopGiayTheThao/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}