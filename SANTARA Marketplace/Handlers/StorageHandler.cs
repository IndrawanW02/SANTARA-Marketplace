using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Handlers
{
    public class StorageHandler
    {
        public static List<Storage> GetProductVariation(String ProductID)
        {
            StorageRepository storageRepository = new StorageRepository();
            return storageRepository.GetProductVariation(ProductID);
        }

        public static List<String> GetProductColorVariations(String ProductID)
        {
            StorageRepository storageRepository = new StorageRepository();
            return storageRepository.GetProductColorVariations(ProductID);
        }

        public static List<double> GetProductAvailableSizes(String ProductID, String ProductColor)
        {
            StorageRepository storagrRepository = new StorageRepository();
            return storagrRepository.GetProductAvailableSizes(ProductID, ProductColor);
        }

        public static int GetProductStock(String ProductID, String ProductColor, double ProductStock)
        {
            StorageRepository storageRepository= new StorageRepository();  
            return storageRepository.GetProductStock(ProductID ,ProductColor, ProductStock);
        }

        public static String GetStorageID(String ProductID, String ProductColor, double ProductSize)
        {
            StorageRepository storageRepository = new StorageRepository();
            return storageRepository.GetStorageID(ProductID ,ProductColor, ProductSize);
        }
    }
}