using ModelEF.DAO;
using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.ShopGiayTheThao.Controllers
{
    public class ProductController : BaseController
    {
        // GET: ShopGiayTheThao/Product
        public ActionResult Index(string searchString, int page = 1, int pagesize = 10)
        {
            var dao = new ProductDao();
            var product = dao.ListWhereAll(searchString, page, pagesize);
            return View(product);
        }
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
        [HttpPost]
        public ActionResult Create(Product model)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                string result = dao.Insert(model);
                if (!string.IsNullOrEmpty(result))
                {
                    SetAlert("Tạo mới sản phẩm thành công!", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    SetAlert("Tạo mới sản phẩm không thành công!", "error");
                }
            }
            return View("Index");
        }
        public void SetViewBag(int? selectedId = null)
        {
            var dao = new CategoryDao();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
        }
        public ActionResult Detail(int id)
        {
            var detail = new ProductDao().Find(id);
            return View(detail);
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new ProductDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}