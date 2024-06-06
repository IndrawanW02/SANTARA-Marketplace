using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class RatingController
    {
        public static List<Rating> GetProductReview(String ProductID)
        {
            return RatingHandler.GetProductReview(ProductID);
        }
    }
}