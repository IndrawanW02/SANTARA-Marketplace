using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Factory
{
    public class AdvertisementFactory
    {
        public static Advertisement Create(String AdvertisementID, String ProductID, byte[] AdvertisementImage, DateTime StartDate, DateTime EndDate)
        {
            Advertisement newAdvertisement = new Advertisement()
            {
                AdvertisementID = AdvertisementID,
                ProductID = ProductID,
                AdvertisementImage = AdvertisementImage,
                StartDate = StartDate,
                EndDate = EndDate
            };
            return newAdvertisement;
        }
    }
}