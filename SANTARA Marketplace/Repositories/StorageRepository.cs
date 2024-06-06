using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class StorageRepository
    {
        private static SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();

        public List<Storage> GetProductVariation(String ProductID)
        {
            return (from s in db.Storages where s.ProductID.Equals(ProductID) select s).ToList();
        }

        public List<String> GetProductColorVariations(String ProductID)
        {
            return (from s 
                    in db.Storages 
                    where s.ProductID.Equals(ProductID) 
                    select s.ProductColor).Distinct().ToList();
        }

        public List<double> GetProductAvailableSizes(String ProductID, String ProductColor)
        {
            return (from s 
                    in db.Storages 
                    where s.ProductID.Equals(ProductID) && s.ProductColor.Equals(ProductColor) 
                    select s.ProductSize).ToList();
        }

        public int GetProductStock(String ProductID, String ProductColor, double ProductSize)
        {
            return (from s 
                    in db.Storages 
                    where s.ProductID.Equals(ProductID) && s.ProductColor.Equals(ProductColor) && s.ProductSize == ProductSize 
                    select s.ProductStock).FirstOrDefault();
        }

        public String GetStorageID(String ProductID, String ProductColor, double ProductSize)
        {
            return (from s 
                    in db.Storages 
                    where s.ProductID.Equals(ProductID) && s.ProductColor.Equals(ProductColor) && s.ProductSize == ProductSize 
                    select s.StorageID).FirstOrDefault();
        }

        public Storage GetStorageByID(String StorageID)
        {
            return (from s 
                    in db.Storages 
                    where s.StorageID.Equals(StorageID) 
                    select s).FirstOrDefault();
        }

        public void UpdateStock(String StorageID, int updatedStock)
        {
            Storage updateStorage = GetStorageByID(StorageID);
            updateStorage.ProductStock = updatedStock;
            db.SaveChanges();
        }
    }
}