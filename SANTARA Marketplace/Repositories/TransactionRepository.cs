using SANTARA_Marketplace.Factory;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class TransactionRepository
    {
        private static SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();

        public void AddTransaction(String TransactionID, String UserID, DateTime CreatedAt, String PaymentMethod, String DestinationAddress, int TotalTransaction)
        {
            Transaction transaction = TransactionFactory.Create(TransactionID, UserID, CreatedAt, PaymentMethod, DestinationAddress, TotalTransaction);
            db.Transactions.Add(transaction);
            db.SaveChanges();
        }

        public String GetLastTransactionID()
        {
            return (from t 
                    in db.Transactions 
                    select t.TransactionID).ToList().LastOrDefault();
        }

        public List<Transaction> GetUserTransaction(String UserID)
        {
            return (from t 
                    in db.Transactions 
                    where t.UserID.Equals(UserID) 
                    select t).ToList();
        }

        public Transaction GetTransactionByID (String TransactionID)
        {
            return (from t 
                    in db.Transactions 
                    where t.TransactionID.Equals(TransactionID) 
                    select t).FirstOrDefault();
        }
    }
}