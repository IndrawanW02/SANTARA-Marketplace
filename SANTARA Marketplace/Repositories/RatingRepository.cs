using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class RatingRepository
    {
        private static SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();

        public List<Rating> GetProductReview(String ProductID)
        {
            return (from r 
                    in db.Ratings 
                    where r.ProductID.Equals(ProductID) 
                    select r).ToList();
        }
    }
}