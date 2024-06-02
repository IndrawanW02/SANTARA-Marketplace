using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Factory
{
    public class TransactionDetailFactory
    {
        public static TransactionDetail Create(String TransactionID, String StorageID, String StoreID, int Quantity, String ShipmentMethod, String ShipmentPrice, String Status, bool IsRated)
        {
            TransactionDetail transactionDetail = new TransactionDetail();
            transactionDetail.TransactionID = TransactionID;
            transactionDetail.StorageID = StorageID;
            transactionDetail.StoreID = StoreID;
            transactionDetail.Quantity = Quantity;
            transactionDetail.ShipmentMethod = ShipmentMethod;
            transactionDetail.ShipmentPrice = ShipmentPrice;
            transactionDetail.Status = Status;
            transactionDetail.RatingStatus = IsRated;
            return transactionDetail;
        }
    }
}