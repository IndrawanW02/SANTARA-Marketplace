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
        public void AddImage(ProductImage Image)
        {
            db.ProductImages.Add(Image);
            db.SaveChanges();
        }

        public byte[] GetCertainProductImage (String ProductID)
        {
            return (from i 
                    in db.ProductImages 
                    orderby i.ImageID ascending
                    where i.ProductID.Equals(ProductID) 
                    select i.Image).FirstOrDefault();
        }

        public List<ProductImage> GetProductImagesByID (String ProductID)
        {
            return (from i 
                    in db.ProductImages 
                    where i.ProductID.Equals(ProductID) 
                    select i).ToList();
        }
    }
}
