using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Security;

namespace SANTARA_Marketplace.Handlers
{
    public class ProductHandler
    {
        public static List<Product> GetMostPopularProductInfo()
        {
            ProductRepository productRepository = new ProductRepository();
            return productRepository.GetPopularShoes();
        }

        public static List<Product> GetWomanShoes()
        {
            ProductRepository productRepository = new ProductRepository();
            return productRepository.GetWomanShoes();
        }

        public static int WomanShoesCount()
        {
            ProductRepository productRepository = new ProductRepository();
            return productRepository.GetWomanShoes().Count;
        }

        public static List<Product> GetManShoes()
        {
            ProductRepository productRepository = new ProductRepository();
            return productRepository.GetManShoes();
        }

        public static int ManShoesCount()
        {
            ProductRepository productRepository = new ProductRepository();
            return productRepository.ManShoesCount();
        }

        public static List<Product> GetKidShoes()
        {
            ProductRepository productRepository = new ProductRepository();
            return productRepository.GetKidShoes();
        }

        public static int KidShoesCount()
        {
            ProductRepository productRepository = new ProductRepository();
            return productRepository.KidShoesCount();
        }

        public static Product GetProductByID(String ProductID)
        {
            ProductRepository productRepository = new ProductRepository();
            return productRepository.GetProductByID(ProductID);
        }

        public static void UpdateProductSold(String ProductID, int soldCount)
        {
            ProductRepository productRepository= new ProductRepository();
            productRepository.UpdateProductSold(ProductID, soldCount);
        }
    }
}