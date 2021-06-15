using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class UserAccountDao
    {
        private TruongVanQuangMinhDbContext db;

        public UserAccountDao()
        {
            db = new TruongVanQuangMinhDbContext();
        }

        public int login(string user, string pass)
        {
            var result = db.UserAccount.SingleOrDefault(x => x.UserName == user);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.Status == "Blocked")
                {
                    return -1;
                }
                else
                {
                    if (result.PassWord == pass)
                    {
                        return 1;
                    }
                    else
                        return -2;
                }
            }
        }
        public long Insert(UserAccount entity)
        {
            db.UserAccount.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(UserAccount entity)
        {
            try
            {
                var user = db.UserAccount.Find(entity.ID);
                user.UserName = entity.UserName;
                if (!string.IsNullOrEmpty(entity.PassWord))
                {
                    user.PassWord = entity.PassWord;
                }
                user.Status = entity.Status;
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public bool Delete(int id)
        {
            try
            {
                var user = db.UserAccount.Find(id);
                db.UserAccount.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public UserAccount GetById(string userName)
        {
            return db.UserAccount.SingleOrDefault(x => x.UserName == userName);
        }
        public UserAccount Find(int username)
        {
            return db.UserAccount.Find(username);
        }
        public IEnumerable<UserAccount> ListWhereAll(string keysearch, int page, int pagesize)
        {
            IQueryable<UserAccount> model = db.UserAccount;
            if (!string.IsNullOrEmpty(keysearch))
                return model.Where(x => x.UserName.Contains(keysearch)).OrderBy(x => x.UserName).ToPagedList(page, pagesize);
            return model.OrderBy(x => x.UserName).ToPagedList(page, pagesize);
        }
    }
}
