using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class ProductRepository
    {
        private static SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();

        public Product GetProductByID(String ProductID)
        {
            return (from p 
                    in db.Products 
                    where p.ProductID.Equals(ProductID) 
                    select p).FirstOrDefault();
        }

        public List<Product> GetPopularShoes()
        {
            return (from p
                    in db.Products 
                    orderby p.ProductSold descending
                    select p)
                    .ToList();
        }

        public List<Product> GetWomanShoes()
        {
            return (from p 
                    in db.Products 
                    where p.ProductCategory.Equals("Wanita") 
                    select p).ToList();
        }

        public int WomanShoesCount()
        {
            return (from p
                    in db.Products
                    where p.ProductCategory.Equals("Wanita")
                    select p).ToList().Count();
        }

        public List<Product> GetManShoes()
        {
            return (from p
                    in db.Products
                    where p.ProductCategory.Equals("Pria")
                    select p).ToList();
        }

        public int ManShoesCount()
        {
            return (from p
                    in db.Products
                    where p.ProductCategory.Equals("Pria")
                    select p).ToList().Count();
        }

        public List<Product> GetKidShoes()
        {
            return (from p
                    in db.Products
                    where p.ProductCategory.Equals("Anak")
                    select p).ToList();
        }

        public int KidShoesCount()
        {
            return (from p
                    in db.Products
                    where p.ProductCategory.Equals("Anak")
                    select p).ToList().Count();
        }

        public void UpdateProductSold(String ProductID, int soldCount)
        {
            Product updateSoldCount = GetProductByID(ProductID);
            updateSoldCount.ProductSold = soldCount;
            db.SaveChanges();
        }
    }
}