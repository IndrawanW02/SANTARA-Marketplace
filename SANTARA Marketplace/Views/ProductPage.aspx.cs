using SANTARA_Marketplace.Controllers;
using SANTARA_Marketplace.Handlers;
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
        String productID = null;
        public Product product = null;
        public List<ProductImage> productImages = null;
        public List<Storage> productVariations = null;
        public List<String> productColor = null;
        public List<double> productSizes = null;
        public List<Rating> productReview = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            productID = Request.QueryString["ProductID"];
            if (productID == null)
            {
                Response.Redirect("~/Views/HomePage.aspx");
            }

            if (!IsPostBack)
            {
                product = ProductController.GetProductByID(productID);
                productVariations = StorageController.GetProductVariation(productID);

                BindImageData(productID);
                BindProductColorVariations(productID);
                BindProductSizeVariations(productID, ChooseColor.SelectedValue);
                stock.Text = BindProductStock(productID, ChooseColor.SelectedValue, Double.Parse(ChooseSize.SelectedValue));
                BindProductReview(productID);

                Page.DataBind();
            }
        }

        private void BindImageData(String ProductID)
        {
            productImages = ImageController.GetProductImages(ProductID);
            ImageRepeater.DataSource = productImages;
            ImageRepeater.DataBind();
        }

        private void BindProductColorVariations(String ProductID)
        {
            productColor = StorageController.GetProductColorVariations(ProductID);
            ChooseColor.DataSource = productColor;
            ChooseColor.DataBind();
        }

        private void BindProductSizeVariations(String ProductID, String ProductColor)
        {
            productSizes = StorageController.GetProductAvailableSizes(ProductID, ProductColor);
            ChooseSize.DataSource = productSizes;
            ChooseSize.DataBind();
        }

        private string BindProductStock(String ProductID, String ProductColor, double ProductSize)
        {
            AddToCard.Enabled = true;
            if (StorageController.GetProductStock(ProductID, ProductColor, ProductSize) == 0)
            {
                AddToCard.Enabled = false;
            }
            return StorageController.GetProductStock(ProductID, ProductColor, ProductSize).ToString();
        }

        private void BindProductReview(String ProductID)
        {
            productReview = RatingController.GetProductReview(ProductID);
            ReviewRepeater.DataSource = productReview;
            ReviewRepeater.DataBind();
        }

        protected void ChooseColor_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProductSizeVariations(productID, ChooseColor.SelectedValue);
            stock.Text = BindProductStock(productID, ChooseColor.SelectedValue, Double.Parse(ChooseSize.SelectedValue));
        }

        protected void ChooseSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            stock.Text = BindProductStock(productID, ChooseColor.SelectedValue, Double.Parse(ChooseSize.SelectedValue));
        }

        protected bool IsColorChoosen()
        {
            if (string.IsNullOrEmpty(ChooseColor.SelectedValue))
            {
                return false;
            }
            return true;
        }

        protected bool IsSizeChoosen()
        {
            if (string.IsNullOrEmpty(ChooseSize.SelectedValue))
            {
                return false;
            }
            return true;
        }

        protected void AddToCard_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                Response.Redirect("~/Views/LoginPage.aspx");
            }
            else
            {
                User user;
                if (Session["user"] == null)
                {
                    var id = Request.Cookies["user_cookie"].Values;
                    user = UserController.GetUserByID(id.ToString());
                    Session["user"] = user;
                }
                else
                {
                    user = (User)Session["user"];
                }


                if (IsColorChoosen() == false)
                {
                    ChooseColorErr.Text = "Pilihlah opsi warna yang sesuai dengan preferensi Anda.";
                }
                else if (IsSizeChoosen() == false)
                {
                    ChooseSizeErr.Text = "Pilihlah opsi ukuran yang sesuai dengan preferensi Anda.";
                }
                else
                {
                    ShoppingCartController.AddToCart(user.UserID, StorageController.GetStorageID(productID, ChooseColor.SelectedValue, Double.Parse(ChooseSize.SelectedValue)));
                }
            }

        }

        protected void BuyNow_Click(object sender, EventArgs e)
        {

        }
    }
}