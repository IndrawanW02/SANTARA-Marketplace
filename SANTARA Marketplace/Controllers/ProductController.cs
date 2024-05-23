using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class ProductController
    {
        public static List<object> GetMostPopularShoes()
        {
            return ProductHandler.GetMostPopularProductInfo().Take(5).ToList();
        }

        public static List<object> GetWomanShoes()
        {
            return ProductHandler.GetWomanShoes();
        }

        public static List<object> GetManShoes()
        {
            return ProductHandler.GetManShoes();
        }

        public static List<object> GetKidShoes()
        {
            return ProductHandler.GetKidShoes();
        }
    }
}