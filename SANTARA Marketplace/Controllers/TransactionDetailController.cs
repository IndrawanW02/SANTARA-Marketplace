using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class TransactionDetailController
    {
        public static void AddTransactionDetail(String TransactionID, String StorageID, String StoreID, int Quantity, String ShipmentMethod, int ShipmentPrice)
        {
            TransactionDetailHandler.AddTransactionDetail(TransactionID, StorageID, StoreID, Quantity, ShipmentMethod, ShipmentPrice);
        }

        public static List<TransactionDetail> GetTransactionDetailList(String TransactionID)
        {
            return TransactionDetailHandler.GetTransactionDetailList(TransactionID);
        }
    }
}