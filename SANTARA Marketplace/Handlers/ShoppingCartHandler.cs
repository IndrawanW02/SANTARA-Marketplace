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

        public static string GetLastCartID()
        {
            ShoppingCartRepository cartRepository = new ShoppingCartRepository();
            return cartRepository.GetLastCartID();
        }

        public static String GenerateCartID()
        {
            String newID = "";
            String lastID = GetLastCartID();
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

        public static void RemoveUserCart(String UserID)
        {
            ShoppingCartRepository shoppingCartRepository = new ShoppingCartRepository();
            shoppingCartRepository.RemoveUserCart(UserID);
        }

        public static void RemoveCertainItem(String CartID)
        {
            ShoppingCartRepository shoppingCartRepository = new ShoppingCartRepository();
            shoppingCartRepository.RemoveCertainItem(CartID);
        }

        public static void UpdateCartQuantity(String cartID, int Qty)
        {
            ShoppingCartRepository shoppingCartRepository= new ShoppingCartRepository();
            shoppingCartRepository.UpdateCartQuantity(cartID, Qty);
        }

        public static int GetTotalShoppingCart(String UserID)
        {
            int totalPrice = 0;
            List<ShoppingCart> cart = GetUserShoppingCart(UserID);
            foreach (ShoppingCart sc in cart)
            {
                totalPrice = totalPrice + (sc.Storage.Product.ProductPrice * sc.Quantity);
            }
            return totalPrice;
        }
    }
}