using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestUngDung.Areas.ShopGiayTheThao.Data
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Tên danh mục là bắt buộc")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Mời nhập password!")]
        public string PassWord { get; set; }
    }
}