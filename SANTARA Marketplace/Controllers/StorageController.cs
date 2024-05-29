using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class StorageController
    {
        public static List<Storage> GetProductVariation(String ProductID)
        {
            return StorageHandler.GetProductVariation(ProductID);
        }

        public static List<String> GetProductColorVariations(String ProductID)
        {
            return StorageHandler.GetProductColorVariations(ProductID);
        }

        public static List<double> GetProductAvailableSizes(String ProductID, String ProductColor)
        {
            return StorageHandler.GetProductAvailableSizes(ProductID, ProductColor);
        }

        public static int GetProductStock(String ProductID, String ProductColor, double ProductSize)
        {
            return StorageHandler.GetProductStock(ProductID, ProductColor, ProductSize);
        }

        public static String GetStorageID(String ProductID, String ProductColor, double ProductSize)
        {
            return StorageHandler.GetStorageID(ProductID, ProductColor, ProductSize);
        }
    }
}