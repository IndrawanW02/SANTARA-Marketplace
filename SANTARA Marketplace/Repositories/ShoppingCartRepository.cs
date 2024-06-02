using SANTARA_Marketplace.Factory;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class ShoppingCartRepository
    {
        private static SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();

        public void AddCartItem(String CartID, String UserID, String StorageID, int Quantity)
        {
            ShoppingCart cart = ShoppingCartFactory.Create(CartID, UserID, StorageID, Quantity);
            db.ShoppingCarts.Add(cart);
            db.SaveChanges();
        }

        public List<ShoppingCart> GetUserShoppingCart(String UserID)
        {
            return (from sc 
                    in db.ShoppingCarts 
                    where sc.UserID.Equals(UserID) 
                    select sc).ToList();
        }

        public ShoppingCart GetCertainCartItem(String CartID)
        {
            return (from sc 
                    in db.ShoppingCarts 
                    where sc.CartID.Equals(CartID) 
                    select sc).FirstOrDefault();
        }

        public string GetLastCartID()
        {
            return (from u
                    in db.ShoppingCarts
                    select u.CartID).ToList().LastOrDefault();
        }

        public void RemoveUserCart(String UserID)
        {
            List<ShoppingCart> toRemove = GetUserShoppingCart(UserID);
            foreach (ShoppingCart cart in toRemove)
            {
                db.ShoppingCarts.Remove(cart);
            }
            db.SaveChanges();
        }

        public void RemoveCertainItem(String CartID)
        {
            ShoppingCart cart = GetCertainCartItem(CartID);
            db.ShoppingCarts.Remove(cart);
            db.SaveChanges();
        }

        public void UpdateCartQuantity(String cartID, int Qty)
        {
            ShoppingCart cartItem = GetCertainCartItem(cartID);
            cartItem.Quantity = Qty;
            db.SaveChanges();
        }
    }
}