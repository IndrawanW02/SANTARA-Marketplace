﻿using SANTARA_Marketplace.Controllers;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SANTARA_Marketplace.Views
{
    public partial class Catalogue_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCardDataForMan();
                BindCardDataForWoman();
                BindCardDataForKid();
            }
        }

        private void BindCardDataForMan()
        {
            List<Product> productInfo = ProductController.GetManShoes().Take(10).ToList();
            CardRepeaterMan.DataSource = productInfo;
            CardRepeaterMan.DataBind();
        }

        private void BindCardDataForWoman()
        {
            List<Product> productInfo = ProductController.GetWomanShoes().Take(10).ToList();
            CardRepeaterWoman.DataSource = productInfo;
            CardRepeaterWoman.DataBind();
        }

        private void BindCardDataForKid()
        {
            List<Product> productInfo = ProductController.GetKidShoes().Take(10).ToList();
            CardRepeaterKid.DataSource = productInfo;
            CardRepeaterKid.DataBind();
        }
    }
}