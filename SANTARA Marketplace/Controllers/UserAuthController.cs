using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class UserAuthController
    {
        public static String CheckUsername(String Username)
        {
            String response = "";
            if (Username.Equals("")) response = "Username tidak boleh kosong";
            return response;
        }

        public static String CheckPassword(String Password)
        {
            String response = "";
            if (Password.Equals("")) response = "Password tidak boleh kosong";
            return response;
        }

        public static String Login(String Username, String Password)
        {
            String response = CheckUsername(Username);
            if (response.Equals("")) response = CheckPassword(Password);
            if (response.Equals("")) response = UserAuthHandler.AuthenticateLogin(Username, Password);
            return response;
        }
    }
}