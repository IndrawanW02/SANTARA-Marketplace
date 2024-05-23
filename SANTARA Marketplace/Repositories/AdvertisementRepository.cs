using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class AdvertisementRepository
    {
        SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();
        public void AddAdvertisement(Advertisement advertisement)
        {
            db.Advertisements.Add(advertisement);
            db.SaveChanges();
        }
    }
}