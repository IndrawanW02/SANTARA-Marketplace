using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Factory
{
    public class ImageFactory
    {
        public static ProductImage Create(String ImageID, String ProductID, byte[] Image)
        {
            ProductImage newProductImage = new ProductImage()
            {
                ImageID = ImageID,
                ProductID = ProductID,
                Image = Image
            };
            return newProductImage;
        }
    }
}