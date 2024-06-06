using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;

namespace SANTARA_Marketplace.Handlers
{
    public class UserRegistrationHandler
    {
        public static bool DoesUsernameExist(string Username)
        {
            UserRepository userRepo = new UserRepository();
            return userRepo.DoesUsernameExist(Username);
        }

        public static bool DoesEmailExist(string Email)
        {
            UserRepository userRepo = new UserRepository();
            return userRepo.DoesEmailExist(Email);
        }

        public static String GetLastUserID()
        {
            UserRepository userRepo = new UserRepository();
            return userRepo.GetLastUserID();
        }

        public static String GenerateUserID()
        {
            String newID = "";
            String lastID = GetLastUserID();
            if (lastID == null)
            {
                newID = "US001";
            }
            else
            {
                int IDnumber = Convert.ToInt32(lastID.Substring(2));
                IDnumber++;
                newID = String.Format(("US{0:000}"), IDnumber);
            }
            return newID;
        }

        public static byte[] DefaultProfilePicture()
        {
            byte[] imageBytes;
            string defaultImagePath = HostingEnvironment.MapPath("~/Assets/Images/DefaultProfileImage.png");
            using (FileStream fileStream = new FileStream(defaultImagePath, FileMode.Open, FileAccess.Read))
            using (BinaryReader binaryReader = new BinaryReader(fileStream))
            {
                imageBytes = binaryReader.ReadBytes((int)fileStream.Length);
            }
            return imageBytes;
        }

        public static void RegistrateUser(String Username, String UserEmail, String Password, String PhoneNumber)
        {
            int BaseUserBalance = 1000000;
            UserRepository userRepository = new UserRepository();
            userRepository.AddUser(GenerateUserID(), null, Username, UserEmail, Password, PhoneNumber, BaseUserBalance, DefaultProfilePicture(), null);
        }
    }
}