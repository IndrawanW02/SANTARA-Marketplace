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

        public int GetUserTotalExpenses(String UserID)
        {
            return (from sc 
                    in db.ShoppingCarts 
                    where sc.UserID.Equals(UserID) 
                    select sc.Storage.Product.ProductPrice).Sum();
        }

        public string GetLastCardID()
        {
            return (from u
                    in db.ShoppingCarts
                    select u.CartID).ToList().LastOrDefault();
        }
    }
}