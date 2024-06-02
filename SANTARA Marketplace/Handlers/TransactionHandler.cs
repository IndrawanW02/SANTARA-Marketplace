using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Handlers
{
    public class TransactionHandler
    {
        public static void AddTransaction(String TransactionID, String UserID, String PaymentMethod)
        {
            TransactionRepository transactionRepository = new TransactionRepository();

            DateTime CreatedAt = DateTime.Now;
            transactionRepository.AddTransaction(TransactionID, UserID, CreatedAt, PaymentMethod);
        }

        public static String GenerateTransactionID()
        {
            TransactionRepository transactionRepository = new TransactionRepository();
            String newID = "";
            String lastID = transactionRepository.GetLastTransactionID();
            if (lastID == null)
            {
                newID = "TR001";
            }
            else
            {
                int IDnumber = Convert.ToInt32(lastID.Substring(2));
                IDnumber++;
                newID = String.Format(("TR{0:000}"), IDnumber);
            }
            return newID;
        }

    }
}