using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Factory
{
    public class AdvertisementFactory
    {
        public static Advertisement Create(String ProductAdvertisementID, byte[] AdvertisementImage, DateTime StartDate, DateTime EndDate)
        {
            Advertisement newAdvertisement = new Advertisement()
            {
                ProductAdvertisementID = ProductAdvertisementID,
                AdvertisementImage = AdvertisementImage,
                StartDate = StartDate,
                EndDate = EndDate
            };
            return newAdvertisement;
        }
    }
}