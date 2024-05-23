using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class ImageRepository
    {
        SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();
        public void AddImage(ProductImage image)
        {
            db.ProductImages.Add(image);
            db.SaveChanges();
        }

        public byte[] GetCertainProductImage (String productID)
        {
            return (from i 
                    in db.ProductImages 
                    orderby i.ImageID ascending
                    where i.ProductID.Equals(productID) 
                    select i.Image).FirstOrDefault();
        }
    }
}
