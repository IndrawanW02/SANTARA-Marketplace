using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class TransactionController
    {
        public static void AddTransaction(String TransactionID, String UserID, String PaymentMethod, String DestinationAddress, int TotalTransaction)
        {
            TransactionHandler.AddTransaction(TransactionID ,UserID, PaymentMethod, DestinationAddress, TotalTransaction);
        }

        public static String GenerateTransactionID()
        {
            return TransactionHandler.GenerateTransactionID();
        }

        public static List<Transaction> GetUserTransaction(String UserID)
        {
            return TransactionHandler.GetUserTransaction(UserID);
        }

        public static Transaction GetTransactionByID(String TransactionID)
        {
            return TransactionHandler.GetTransactionByID(TransactionID);
        }
    }
}