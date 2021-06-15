using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class ProductDao
    {
        private TruongVanQuangMinhDbContext db;

        public ProductDao()
        {
            db = new TruongVanQuangMinhDbContext();
        }
        public string Insert(Product enity)
        {
            db.Product.Add(enity);
            db.SaveChanges();
            return enity.Name;
        }
        public bool Delete(int id)
        {
            try
            {
                var dao = db.Product.Find(id);
                db.Product.Remove(dao);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public List<Product> ListAll()
        {
            return db.Product.ToList();
        }
        public IEnumerable<Product> ListWhereAll(string keysearch, int page, int pagesize)
        {
            IQueryable<Product> model = db.Product;
            if (!string.IsNullOrEmpty(keysearch))
                return model.Where(x => x.Name.Contains(keysearch)).OrderBy(x => x.Name).ToPagedList(page, pagesize);
            return model.OrderBy(x => x.Quantity).ToPagedList(page, pagesize);
        }
        public Product Find(int id)
        {
            return db.Product.Find(id);
        }
        public Product GetByName(string name)
        {
            return db.Product.SingleOrDefault(x => x.Name == name);
        }
    }
}
