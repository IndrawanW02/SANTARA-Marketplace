using SANTARA_Marketplace.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class TransactionController
    {
        public static void AddTransaction(String TransactionID, String UserID, String PaymentMethod)
        {
            TransactionHandler.AddTransaction(TransactionID ,UserID, PaymentMethod);
        }

        public static String GenerateTransactionID()
        {
            return TransactionHandler.GenerateTransactionID();
        }
    }
}