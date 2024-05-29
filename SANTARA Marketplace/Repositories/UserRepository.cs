using SANTARA_Marketplace.Factory;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class UserRepository
    {
        private static SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();
        
        public void AddUser(String UserID, String AddressID, String Username, String UserEmailAddress, String UserPassword, String UserPhoneNumber, int UserBalance, byte[] UserProfilePic, String StoreID)
        {
            User user = UserFactory.Create(UserID, AddressID, Username, UserEmailAddress, UserPassword, UserPhoneNumber, UserBalance, UserProfilePic, StoreID);
            db.Users.Add(user);
            db.SaveChanges();
        }

        public User GetUserByID(String UserID)
        {
            return (from u 
                    in db.Users 
                    where u.UserID.Equals(UserID) 
                    select u).FirstOrDefault();
        }

        public bool DoesUsernameExist(String Username)
        {
            return db.Users.Any(u => u.Username == Username);
        }

        public bool DoesEmailExist(String Email)
        {
            return db.Users.Any(u => u.UserEmailAddress == Email);
        }

        public User GetUserByUsername(String Username)
        {
            return (from u
                    in db.Users
                    where u.Username.Equals(Username)
                    select u).FirstOrDefault();
        }

        public string GetLastUserID()
        {
            return (from u
                    in db.Users
                    select u.UserID).ToList().LastOrDefault();
        }


    }
}