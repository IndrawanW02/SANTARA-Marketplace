using SANTARA_Marketplace.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class TransactionDetailController
    {
        public static void AddTransactionDetail(String TransactionID, String StorageID, String StoreID, int Quantity, String ShipmentMethod, String ShipmentPrice)
        {
            TransactionDetailHandler.AddTransactionDetail(TransactionID, StorageID, StoreID, Quantity, ShipmentMethod, ShipmentPrice);
        }
    }
}