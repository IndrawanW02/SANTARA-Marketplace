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
        
        public void AddTransactionDetail(String TransactionID, String StorageID, String StoreID, int Quantity, String ShipmentMethod, int ShipmentPrice, String Status, bool IsRated, String ReceiptNumber)
        {
            TransactionDetail transactionDetail = TransactionDetailFactory.Create(TransactionID, StorageID, StoreID, Quantity, ShipmentMethod, ShipmentPrice, Status, IsRated, ReceiptNumber);
            db.TransactionDetails.Add(transactionDetail);
            db.SaveChanges();
        }

        public List<TransactionDetail> GetTransactionDetailList(String TransactionID)
        {
            return (from td 
                    in db.TransactionDetails 
                    where td.TransactionID.Equals(TransactionID) 
                    select td).ToList();
        }
    }
}