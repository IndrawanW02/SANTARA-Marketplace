using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class ShoppingCartController
    {
        public static List<ShoppingCart> GetUserShoppingCart(String UserID)
        {
            return ShoppingCartHandler.GetUserShoppingCart(UserID);
        }

        public static void AddToCart(String UserID, String StorageID)
        {
            ShoppingCartHandler.AddToCart(UserID, StorageID);
        }

        public static int GetUserTotalExpenses(String UserID)
        {
            return ShoppingCartHandler.GetUserTotalExpenses(UserID);
        }
    }
}