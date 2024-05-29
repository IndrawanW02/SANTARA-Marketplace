using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Factory
{
    public class UserFactory
    {
        public static User Create(String UserID, String AddressID, String Username, String UserEmailAddress, String UserPassword, String UserPhoneNumber, int UserBalance, byte[] UserProfilePic, String StoreID)
        {
            User user = new User();
            user.UserID = UserID;
            user.AddressID = AddressID;
            user.Username = Username;
            user.UserEmailAddress = UserEmailAddress;
            user.UserPassword = UserPassword;
            user.UserPhoneNumber = UserPhoneNumber;
            user.UserBalance = UserBalance;
            user.UserProfilePic = UserProfilePic;
            user.StoreID = StoreID;
            return user;
        }
    }
}