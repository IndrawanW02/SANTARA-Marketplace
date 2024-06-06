using SANTARA_Marketplace.Controllers;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
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

        protected void SelectedIndexChanged(object sender, EventArgs e)
        {
            String sortBy = SortBy.SelectedValue;
            String shoeType = ShoeType.SelectedValue;
            String storeLocation = StoreLocation.SelectedValue;
            String minPrice = MinPrice.Text;
            String maxPrice = MaxPrice.Text;

            SortAndFilterProducts(sortBy, shoeType, storeLocation, minPrice, maxPrice);
        }

        private void SortAndFilterProducts(string sortBy, string shoeType, string storeLocation, string minPrice, string maxPrice)
        {
            List<Product> products = ProductController.GetManShoes(); ;

            if (!string.IsNullOrEmpty(shoeType))
            {
                products = products.Where(p => p.ProductType == shoeType).ToList();
            }

            if (!string.IsNullOrEmpty(storeLocation))
            {
                products = products.Where(p => p.Store.Address.Province == storeLocation).ToList();
            }

            if (decimal.TryParse(minPrice, out decimal minPriceValue))
            {
                products = products.Where(p => p.ProductPrice >= minPriceValue).ToList();
            }

            if (decimal.TryParse(maxPrice, out decimal maxPriceValue))
            {
                products = products.Where(p => p.ProductPrice <= maxPriceValue).ToList();
            }

            switch (sortBy)
            {
                case "RatingAsc":
                    products = products.OrderBy(p => p.ProductRatingValue).ToList();
                    break;
                case "RatingDesc":
                    products = products.OrderByDescending(p => p.ProductRatingValue).ToList();
                    break;
                case "HargaAsc":
                    products = products.OrderBy(p => p.ProductPrice).ToList();
                    break;
                case "HargaDesc":
                    products = products.OrderByDescending(p => p.ProductPrice).ToList();
                    break;
            }

            // Bind data yang sudah difilter dan disortir ke kontrol tampilan data (misalnya GridView, Repeater, dll.)
            CardRepeater.DataSource = products;
            CardRepeater.DataBind();
        }
        protected void ResetFilter_Click(object sender, EventArgs e)
        {
            SortBy.SelectedItem.Text = "Tidak Ada";
            SortAndFilterProducts(string.Empty, string.Empty, string.Empty, string.Empty, string.Empty);

        }
    }
}