using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class CategoryDao
    {
        private TruongVanQuangMinhDbContext db = null;
        public CategoryDao()
        {
            db = new TruongVanQuangMinhDbContext();
        }
        public string Insert(Category enity)
        {
            db.Category.Add(enity);
            db.SaveChanges();
            return enity.Name;
        }
        public bool Delete(int id)
        {
            try
            {
                var dao = db.Category.Find(id);
                db.Category.Remove(dao);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public IEnumerable<Category> ListWhereAll(string keysearch, int page, int pagesize)
        {
            IQueryable<Category> model = db.Category;
            if (!string.IsNullOrEmpty(keysearch))
                return model.Where(x => x.Name.Contains(keysearch)).OrderBy(x => x.Name).ToPagedList(page, pagesize);
            return model.OrderBy(x => x.Name).ToPagedList(page, pagesize);
        }
        public List<Category> ListAll()
        {
            return db.Category.ToList();
        }
    }
}
