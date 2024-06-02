using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Handlers
{
    public class TransactionDetailHandler
    {
        public static void AddTransactionDetail(String TransactionID, String StorageID, String StoreID, int Quantity, String ShipmentMethod, String ShipmentPrice)
        {
            TransactionDetailRepository transactionDetailRepository = new TransactionDetailRepository();

            String status = "DiProses";
            transactionDetailRepository.AddTransactionDetail(TransactionID, StorageID, StoreID, Quantity, ShipmentMethod, ShipmentPrice, status, false);
        }

    }
}