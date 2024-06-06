using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Handlers
{
    public class UserAuthHandler
    {
        public static String AuthenticateLogin(String Username, String Password)
        {
            String response = "";
            UserRepository userRepo = new UserRepository();
            User user = userRepo.GetUserByUsername(Username);

            if (userRepo.DoesUsernameExist(Username) == false)
            {
                response = "Username tidak ditemukan";
            }
            else if (!(user.UserPassword.Equals(Password)))
            {
                response = "Password tidak valid";
            }
            else if (user == null)
            {
                response = "Data pengguna tidak ditemukan";
            }
            else
            {
                response = "Login Success";
            }
            return response;

        }
    }
}