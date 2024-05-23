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
        public static List<object> GetMostPopularProductInfo()
        {
            ProductRepository productRepository = new ProductRepository();
            ImageRepository imageRepository = new ImageRepository();
            StoreRepository storeRepository = new StoreRepository();
            AddressRepository addressRepository = new AddressRepository();

            List<Product> ProductList = productRepository.GetPopularShoes();

            List<object> productInfo = new List<object>();
            var product = ProductList.Select(p => new
            {
                Product = p,
                ProductImage = imageRepository.GetCertainProductImage(p.ProductID),
                StoreInfo = storeRepository.GetStore(p.StoreID),
            });

            productInfo.AddRange(product);

            return productInfo;
        }

        public static List<object> GetWomanShoes()
        {
            ProductRepository productRepository = new ProductRepository();
            ImageRepository imageRepository = new ImageRepository();
            StoreRepository storeRepository = new StoreRepository();
            AddressRepository addressRepository = new AddressRepository();

            List<Product> WomanProductList = productRepository.GetWomanShoes();

            List<object> WomanProductInfo = new List<object>();
            var product = WomanProductList.Select(p => new
            {
                Product = p,
                ProductImage = imageRepository.GetCertainProductImage(p.ProductID),
                StoreInfo = storeRepository.GetStore(p.StoreID),
            });

            WomanProductInfo.AddRange(product);

            return WomanProductInfo;
        }

        public static List<object> GetManShoes()
        {
            ProductRepository productRepository = new ProductRepository();
            ImageRepository imageRepository = new ImageRepository();
            StoreRepository storeRepository = new StoreRepository();
            AddressRepository addressRepository = new AddressRepository();

            List<Product> ManProductList = productRepository.GetManShoes();

            List<object> ManProductInfo = new List<object>();
            var product = ManProductList.Select(p => new
            {
                Product = p,
                ProductImage = imageRepository.GetCertainProductImage(p.ProductID),
                StoreInfo = storeRepository.GetStore(p.StoreID),
            });

            ManProductInfo.AddRange(product);

            return ManProductInfo;
        }

        public static List<object> GetKidShoes()
        {
            ProductRepository productRepository = new ProductRepository();
            ImageRepository imageRepository = new ImageRepository();
            StoreRepository storeRepository = new StoreRepository();
            AddressRepository addressRepository = new AddressRepository();

            List<Product> KidProductList = productRepository.GetKidShoes();

            List<object> KidProductInfo = new List<object>();
            var product = KidProductList.Select(p => new
            {
                Product = p,
                ProductImage = imageRepository.GetCertainProductImage(p.ProductID),
                StoreInfo = storeRepository.GetStore(p.StoreID),
            });

            KidProductInfo.AddRange(product);

            return KidProductInfo;
        }
    }
}