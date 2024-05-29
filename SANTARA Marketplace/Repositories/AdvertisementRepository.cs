using SANTARA_Marketplace.Factory;
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
        public void AddAdvertisement(String AdvertisementID, String ProductID, byte[] AdvertisementImage, DateTime StartDate, DateTime EndDate)
        {
            Advertisement advertisement = AdvertisementFactory.Create(AdvertisementID, ProductID, AdvertisementImage, StartDate, EndDate);
            db.Advertisements.Add(advertisement);
            db.SaveChanges();
        }

        public String GetLastAdvertisementID()
        {
            return (from ad 
                    in db.Advertisements 
                    select ad.AdvertisementID).ToList().LastOrDefault();
        }

        public List<Advertisement> SetAdvertisement()
        {
            return (from ad 
                    in db.Advertisements 
                    where ad.EndDate >= DateTime.Now 
                    orderby ad.EndDate ascending 
                    select ad).Take(5).ToList();
        }
    }
}