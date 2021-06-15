using ModelEF;
using ModelEF.DAO;
using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.ShopGiayTheThao.Controllers
{
    public class UserController : BaseController
    {
        public ActionResult Index(string searchString, int page = 1, int pagesize = 5)
        {
            var user = new UserAccountDao();
            var model = user.ListWhereAll(searchString, page, pagesize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(UserAccount user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserAccountDao();
                if (dao.GetById(user.UserName) != null)
                {
                    SetAlert("Người dùng này đã tồn tại", "warning");
                    return RedirectToAction("Create", "User");
                }
                var pass = Common.EncryptMD5(user.PassWord);
                user.PassWord = pass;
                long id = dao.Insert(user);
                if (id > 0)
                {
                    SetAlert("Thêm người dùng thành công", "success");
                    return RedirectToAction("Index", "User");
                }
            }
            return View("Index");
        }

        public ActionResult Edit(int id)
        {
            var user = new UserAccountDao().Find(id);
            return View(user);
        }
        [HttpPost]
        public ActionResult Edit(UserAccount user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserAccountDao();
                if (!string.IsNullOrEmpty(user.PassWord))
                {
                    var pass = Common.EncryptMD5(user.PassWord);
                    user.PassWord = pass;
                }

                var result = dao.Update(user);

                if (result)
                {
                    SetAlert("Cập nhật thông tin người dùng thành công", "success");
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("Index");
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new UserAccountDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}
