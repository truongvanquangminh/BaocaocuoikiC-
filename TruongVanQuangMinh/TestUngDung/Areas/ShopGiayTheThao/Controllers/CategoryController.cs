using ModelEF.DAO;
using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.ShopGiayTheThao.Controllers
{
    public class CategoryController : BaseController
    {
        // GET: ShopGiayTheThao/Category
        public ActionResult Index(string searchString, int page = 1, int pagesize = 5)
        {
            var user = new CategoryDao();
            var model = user.ListWhereAll(searchString, page, pagesize);
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Category model)
        {
            if (ModelState.IsValid)
            {
                var dao = new CategoryDao();
                string result = dao.Insert(model);
                if (!string.IsNullOrEmpty(result))
                {
                    SetAlert("Tạo mới loại sản phẩm thành công!", "success");
                    return RedirectToAction("Index", "Category");
                }
                else
                {
                    SetAlert("Tạo mới loại sản phẩm không thành công!", "error");
                }
            }
            return View();
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new CategoryDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}