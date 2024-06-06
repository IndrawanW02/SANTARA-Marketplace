using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Handlers
{
    public class UserHandler
    {
        public static User GetUserByUsername(String Username)
        {
            UserRepository userRepo = new UserRepository();
            return userRepo.GetUserByUsername(Username);
        }

        public static User GetUserByID(String UserID)
        {
            UserRepository userRepo = new UserRepository();
            return userRepo.GetUserByID(UserID);
        }

        public static void UpdateUserBalance(String UserID, int newBalance)
        {
            UserRepository userRepo = new UserRepository();
            userRepo.UpdateUserBalance(UserID, newBalance);
        }
    }
}