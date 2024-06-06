using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Handlers
{
    public class RatingHandler
    {
        public static List<Rating> GetProductReview(String ProductID)
        {
            RatingRepository ratingRepository = new RatingRepository();
            return ratingRepository.GetProductReview(ProductID);
        }
    }
}