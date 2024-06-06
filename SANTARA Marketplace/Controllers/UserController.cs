using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class UserController
    {
        public static User GetUserByUsername(String Username)
        {
            return UserHandler.GetUserByUsername(Username);
        }

        public static User GetUserByID(String UserID)
        {
            return UserHandler.GetUserByID(UserID);
        }

        public static void UpdateUserBalance(String UserID, int newBalance)
        {
            UserHandler.UpdateUserBalance(UserID, newBalance);
        }
    }
}