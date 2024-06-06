using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Factory
{
    public class ShoppingCartFactory
    {
        public static ShoppingCart Create(String CartID, String UserID, String StorageID, int Quantity)
        {
            ShoppingCart cart = new ShoppingCart();
            cart.CartID = CartID;
            cart.UserID = UserID;
            cart.StorageID = StorageID;
            cart.Quantity = Quantity;
            return cart;
        }
    }
}