using SANTARA_Marketplace.Factory;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class TransactionDetailRepository
    {
        private static SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();
        
        public void AddTransactionDetail(String TransactionID, String StorageID, String StoreID, int Quantity, String ShipmentMethod, String ShipmentPrice, String Status, bool IsRated)
        {
            TransactionDetail transactionDetail = TransactionDetailFactory.Create(TransactionID, StorageID, StoreID, Quantity, ShipmentMethod, ShipmentPrice, Status, IsRated);
            db.TransactionDetails.Add(transactionDetail);
            db.SaveChanges();
        }
    }
}