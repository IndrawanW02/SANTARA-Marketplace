using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing;
using System.Linq;
using System.Web;
using System.IO;

namespace SANTARA_Marketplace.Handlers
{
    public class ImageHandler
    {
        public static List<ProductImage> GetProductImages(String ProductID)
        {
            ImageRepository imageRepository = new ImageRepository();
            return imageRepository.GetProductImagesByID(ProductID);
        }

        public static Image ResizeImage(Image image, int width, int height)
        {
            var destRect = new Rectangle(0, 0, width, height);
            var destImage = new Bitmap(width, height);

            destImage.SetResolution(image.HorizontalResolution, image.VerticalResolution);

            using (var graphics = Graphics.FromImage(destImage))
            {
                graphics.CompositingMode = CompositingMode.SourceCopy;
                graphics.CompositingQuality = CompositingQuality.HighQuality;
                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = SmoothingMode.HighQuality;
                graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

                using (var wrapMode = new ImageAttributes())
                {
                    wrapMode.SetWrapMode(WrapMode.TileFlipXY);
                    graphics.DrawImage(image, destRect, 0, 0, image.Width, image.Height, GraphicsUnit.Pixel, wrapMode);
                }
            }

            return destImage;
        }

        public static byte[] ImageToByteArray(Image image, ImageFormat format)
        {
            using (var ms = new MemoryStream())
            {
                image.Save(ms, format);
                return ms.ToArray();
            }
        }

        public static Image GetResizeImage(byte[] image)
        {
            using (var originalStream = new MemoryStream(image))
            {
                using (var originalImage = Image.FromStream(originalStream))
                {
                    int newWidth = 1000;  // Lebar baru
                    int newHeight = 800; // Tinggi baru

                    Image resizedImage = ResizeImage(originalImage, newWidth, newHeight);

                    return resizedImage;
                }
            }
        }
    }
}