using SANTARA_Marketplace.Controllers;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SANTARA_Marketplace.Views
{
    public partial class ManProductPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCardData();
            }
        }

        private void BindCardData()
        {
            List<Product> productInfo = ProductController.GetManShoes();
            CardRepeater.DataSource = productInfo;
            CardRepeater.DataBind();
        }
    }
}