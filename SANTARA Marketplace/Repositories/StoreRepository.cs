using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class StoreRepository
    {
        private static SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();

        public Store GetStore(String StoreID)
        {
            return (from s in db.Stores where s.StoreID.Equals(StoreID) select s).FirstOrDefault();
        }
    }
}