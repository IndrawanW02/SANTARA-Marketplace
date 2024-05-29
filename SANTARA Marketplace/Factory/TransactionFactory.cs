﻿using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Factory
{
    public class TransactionFactory
    {
        public static Transaction Create(String TransactionID, String UserID, DateTime CreatedAt, String PaymentMethod)
        {
            Transaction transaction = new Transaction();
            transaction.TransactionID = TransactionID;
            transaction.UserID = UserID;
            transaction.CreatedAt = CreatedAt;
            transaction.PaymentMethod = PaymentMethod;
            return transaction;
        }
    }
}