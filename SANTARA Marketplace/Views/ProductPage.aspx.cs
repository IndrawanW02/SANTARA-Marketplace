using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SANTARA_Marketplace.Views
{
    public partial class ProductPage : System.Web.UI.Page
    {
        public Product product = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductRepository productRepo = new ProductRepository();
                String productID = Request.QueryString["ProductID"];
                product = productRepo.GetProductByID(productID);
                Page.DataBind();
            }
        }
    }
}