using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class ProductController
    {
        public static List<Product> GetMostPopularShoes()
        {
            return ProductHandler.GetMostPopularProductInfo();
        }

        public static List<Product> GetWomanShoes()
        {
            return ProductHandler.GetWomanShoes();
        }

        public static int WomanShoesCount()
        {
            return ProductHandler.WomanShoesCount();
        }

        public static List<Product> GetManShoes()
        {
            return ProductHandler.GetManShoes();
        }

        public static int ManShoesCount()
        {
            return ProductHandler.ManShoesCount();
        }

        public static List<Product> GetKidShoes()
        {
            return ProductHandler.GetKidShoes();
        }

        public static int KidShoesCount()
        {
            return ProductHandler.KidShoesCount();
        }

        public static Product GetProductByID(String ProductID)
        {
            return ProductHandler.GetProductByID(ProductID);
        }

        public static void UpdateProductSold(String ProductID, int soldCount)
        {
            ProductHandler.UpdateProductSold(ProductID, soldCount);
        }
    }
}