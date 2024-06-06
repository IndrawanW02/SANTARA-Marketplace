using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class DatabaseSingleton
    {
        private DatabaseSingleton() { }
        private static SantaraDatabaseEntities1 db = null;
        public static SantaraDatabaseEntities1 GetInstance()
        {
            if(db == null)
            {
                db = new SantaraDatabaseEntities1();
            }
            return db;
        }
    }
}