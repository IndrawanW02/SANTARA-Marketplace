using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Handlers
{
    public class AdvertisementHandler
    {
        public static List<Advertisement> SetAdvertisement()
        {
            AdvertisementRepository advertisementRepository = new AdvertisementRepository();
            return advertisementRepository.SetAdvertisement();
        }

        public static String GetLastAdvertisementID()
        {
            AdvertisementRepository advertisementRepository = new AdvertisementRepository();
            return advertisementRepository.GetLastAdvertisementID();
        }

        public static String GenerateAdvertisementID()
        {
            String newID = "";
            String lastID = GetLastAdvertisementID();
            if (lastID == null)
            {
                newID = "AD001";
            }
            else
            {
                int IDnumber = Convert.ToInt32(lastID.Substring(2));
                IDnumber++;
                newID = String.Format(("AD{0:000}"), IDnumber);
            }
            return newID;
        }

        public static void AddAdvertisement(String ProductID)
        {
            AdvertisementRepository advertisementRepository = new AdvertisementRepository();
            DateTime StartDate = DateTime.Now;
            DateTime EndDate = StartDate.AddDays(7);

            //advertisementRepository.AddAdvertisement(GenerateAdvertisementID, ProductID)
        }


    }
}