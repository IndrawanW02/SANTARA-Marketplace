using SANTARA_Marketplace.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class UserRegistrationController
    {
        public static String CheckUsername(String Username)
        {
            String response = "";
            if (Username.Equals("")) response = "Username tidak boleh kosong";
            else if (Username.Length < 5 || Username.Length > 15) response = "Panjang username harus antara 5 hingga 15 karakter";
            else if (UserRegistrationHandler.DoesUsernameExist(Username)) response = "Username sudah terdaftar";
            return response;
        }

        public static String CheckEmail(String UserEmail)
        {
            String response = "";
            if (UserEmail.Equals("")) response = "Email tidak boleh kosong";
            else if (!(UserEmail.EndsWith(".com"))) response = "Cantumkan alamat email yang valid (.com)";
            else if (UserRegistrationHandler.DoesEmailExist(UserEmail)) response = "Email sudah terdaftar";
            return response;
        }

        public static String CheckPassword(String Password)
        {
            String response = "";
            if (Password.Equals("")) response = "Password tidak boleh kosong";
            return response;
        }

        public static String CheckConfirmationPassword(String Password, String ConfirmationPassword)
        {
            String response = "";
            if (ConfirmationPassword.Equals("")) response = "Confirmation Password tidak boleh kosong";
            else if (!(ConfirmationPassword.Equals(Password))) response = "Confirmation Password harus sama dengan Password";
            return response;
        }

        public static String CheckPhoneNumber(String PhoneNumber)
        {
            String response = "";
            if (PhoneNumber.Equals("")) response = "Nomor telepon tidak boleh kosong";
            else if (PhoneNumber.Length < 10 || PhoneNumber.Length > 13 || !(PhoneNumber.StartsWith("0"))) response = "Mohon cantumkan nomor telepon yang valid";
            return response;
        }

        public static bool IsEligible(String Username, String UserEmail, String Password, String ConfirmationPassword, String PhoneNumber)
        {
            if (CheckUsername(Username).Equals("") && CheckEmail(UserEmail).Equals("") && CheckPassword(Password).Equals("") && CheckConfirmationPassword(Password, ConfirmationPassword).Equals("") && CheckPhoneNumber(PhoneNumber).Equals("")) { return true; }
            return false;
        }

        public static void RegistrateUser(String Username, String UserEmail, String Password, String PhoneNumber)
        {
            UserRegistrationHandler.RegistrateUser(Username, UserEmail, Password, PhoneNumber);
        }
    }
}