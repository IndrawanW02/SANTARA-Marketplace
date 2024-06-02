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

        public static void RemoveUserCart(String UserID)
        {
            ShoppingCartHandler.RemoveUserCart(UserID);
        }

        public static void RemoveCertainItem(String CartID)
        {
            ShoppingCartHandler.RemoveCertainItem(CartID);
        }

        public static void UpdateCartQuantity(String cartID, int Qty)
        {
            ShoppingCartHandler.UpdateCartQuantity(cartID, Qty);
        }

        public static int GetTotalShoppingCart(String UserID)
        {
            return ShoppingCartHandler.GetTotalShoppingCart(UserID);
        }
    }
}