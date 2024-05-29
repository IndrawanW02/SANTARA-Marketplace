using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Handlers
{
    public class ShoppingCartHandler
    {
        public static List<ShoppingCart> GetUserShoppingCart(String UserID)
        {
            ShoppingCartRepository cartRepository = new ShoppingCartRepository();
            return cartRepository.GetUserShoppingCart(UserID);
        }

        public static string GetLastCardID()
        {
            ShoppingCartRepository cartRepository = new ShoppingCartRepository();
            return cartRepository.GetLastCardID();
        }

        public static String GenerateCartID()
        {
            String newID = "";
            String lastID = ShoppingCartHandler.GetLastCardID();
            if (lastID == null)
            {
                newID = "SC001";
            }
            else
            {
                int IDnumber = Convert.ToInt32(lastID.Substring(2));
                IDnumber++;
                newID = String.Format(("SC{0:000}"), IDnumber);
            }
            return newID;
        }

        public static void AddToCart(String UserID, String StorageID)
        {
            int defaultQuantity = 1;
            ShoppingCartRepository cartRepository = new ShoppingCartRepository();
            cartRepository.AddCartItem(GenerateCartID(), UserID, StorageID, defaultQuantity);
        }

        public static int GetUserTotalExpenses(String UserID)
        {
            ShoppingCartRepository shoppingCartRepository = new ShoppingCartRepository();
            return shoppingCartRepository.GetUserTotalExpenses(UserID);
        }
    }
}