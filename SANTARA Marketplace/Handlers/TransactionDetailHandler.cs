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
        public static void AddTransactionDetail(String TransactionID, String StorageID, String StoreID, int Quantity, String ShipmentMethod, int ShipmentPrice)
        {
            TransactionDetailRepository transactionDetailRepository = new TransactionDetailRepository();

            String status = "DiProses";
            String ReceiptNumber = GenerateReceiptNumber();
            transactionDetailRepository.AddTransactionDetail(TransactionID, StorageID, StoreID, Quantity, ShipmentMethod, ShipmentPrice, status, false, ReceiptNumber);
        }

        public static List<TransactionDetail> GetTransactionDetailList(String TransactionID)
        {
            TransactionDetailRepository transactionDetailRepository = new TransactionDetailRepository();
            return transactionDetailRepository.GetTransactionDetailList(TransactionID);
        }

        public static String GenerateReceiptNumber()
        {
            Random random = new Random();
            long randomNumber = random.Next(1000000000, 2000000000) + (long)random.Next(0, 1000000000);

            String receiptNum = "ORD" + randomNumber.ToString();
            return receiptNum;
        }
    }
}