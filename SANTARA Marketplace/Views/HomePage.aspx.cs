using SANTARA_Marketplace.Controllers;
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
        public int manProductCount;
        public int womanProductCount;
        public int kidProductCount;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCardData();
                BindAdvertisementData();
                ManProductCountLbl.Text = ProductController.ManShoesCount().ToString() + " Produk";
                WomanProductCountLbl.Text = ProductController.WomanShoesCount().ToString() + " Produk";
                KidProductCountLbl.Text = ProductController.KidShoesCount().ToString() + " Produk";
            }
        }

        private void BindAdvertisementData()
        {
            List<Advertisement> advertisementData = AdvertisementController.SetAdvertisement();
            AdvertisementRepeater.DataSource = advertisementData;
            AdvertisementRepeater.DataBind();
        }

        private void BindCardData()
        {
            List<Product> productInfo = ProductController.GetMostPopularShoes().Take(5).ToList();
            CardRepeater.DataSource = productInfo;
            CardRepeater.DataBind();
        }
        
        protected void RedirectToProduct(string ProductID)
        {
            Response.Redirect("~/Views/ProductPage.aspx?ProductID={ProductID}");
        }
    }
}