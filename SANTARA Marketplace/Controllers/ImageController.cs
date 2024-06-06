using SANTARA_Marketplace.Handlers;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Controllers
{
    public class ImageController
    {
        public static List<ProductImage> GetProductImages(String ProductID)
        {
            return ImageHandler.GetProductImages(ProductID);
        }

        public static Image GetResizedImage(byte[] image)
        {
            return ImageHandler.GetResizeImage(image);
        }
    }
}