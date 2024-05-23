﻿using SANTARA_Marketplace.Controllers;
using SANTARA_Marketplace.Factory;
using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SANTARA_Marketplace.Views
{
    public partial class Home_Page : System.Web.UI.Page
    {
        SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();
        public List<Product> products = new List<Product>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCardData();
            }
        }

        private void BindCardData()
        {
            List<object> productInfo = ProductController.GetMostPopularShoes().Take(5).ToList();
            CardRepeater.DataSource = productInfo;
            CardRepeater.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);

            if (fileExtension.ToLower().Equals(".jpg") || fileExtension.ToLower().Equals(".png"))
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] imageBytes = binaryReader.ReadBytes((int)stream.Length);

                string imageID;
                ProductImage lastImage = db.ProductImages.ToList().LastOrDefault();
                if (lastImage == null) imageID = "IM001";
                else
                {
                    string lastId = lastImage.ImageID;
                    int lastIdNum = Convert.ToInt32(lastId.Substring(2));

                    imageID = String.Format("IM{0:000}", lastIdNum + 1);
                }

                string ProductID = TextBox1.Text;
                ProductImage image = ImageFactory.Create(imageID, ProductID, imageBytes);
                ImageRepository imgRepo = new ImageRepository();
                imgRepo.AddImage(image);
            }
            else
            {
                Label1.Text = "File can only be .jpg or .png";
            }
        }

        protected void RedirectToProduct(string ProductID)
        {
            Response.Redirect("~/Views/ProductPage.aspx?ProductID={ProductID}");
        }

        //private bool IsPngImage(byte[] imageData)
        //{
        //    return imageData.Length >= 8 &&
        //           imageData[0] == 0x89 &&
        //           imageData[1] == 0x50 &&
        //           imageData[2] == 0x4E &&
        //           imageData[3] == 0x47 &&
        //           imageData[4] == 0x0D &&
        //           imageData[5] == 0x0A &&
        //           imageData[6] == 0x1A &&
        //           imageData[7] == 0x0A;
        //}
    }
}