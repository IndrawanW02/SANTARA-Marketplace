using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class AdvertisementController
    {
        public static List<Advertisement> SetAdvertisement()
        {
            return AdvertisementHandler.SetAdvertisement();
        }
    }
}