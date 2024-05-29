using SANTARA_Marketplace.Controllers;
using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Template;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SANTARA_Marketplace.Views
{
    public partial class ShoppingCartPage : System.Web.UI.Page
    {
        public List<ShoppingCart> cartItem = null;
        protected void Page_Load(object sender, EventArgs e)
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
                cartItem = ShoppingCartController.GetUserShoppingCart(user.UserID);
                CardRepeater.DataSource = cartItem;
                CardRepeater.DataBind();
                TransactionRepeater.DataSource = cartItem;
                TransactionRepeater.DataBind();
                TotalPriceLbl.Text = HeaderAndFooter.GetPrice(GetTotalCartPrice());
            }
        }

        protected void quantity_DataBinding(object sender, EventArgs e)
        {
            var textBox = (TextBox)sender;
            var dataItem = DataBinder.GetDataItem(textBox.NamingContainer) as ShoppingCart;

            textBox.Text = dataItem.Quantity.ToString();
        }

        public int GetTotalCartPrice()
        {
            int totalPrice = 0;
            foreach (var item in cartItem)
            {
                totalPrice = totalPrice + (item.Quantity * item.Storage.Product.ProductPrice);
            }
            return totalPrice;
        }

        protected void minus_Click(object sender, EventArgs e)
        {
            Button minusButton = (Button)sender;
            RepeaterItem repeaterItem = (RepeaterItem)minusButton.Parent;
            TextBox txtQuantity = (TextBox)repeaterItem.FindControl("QuantityTB");
            
            if (txtQuantity != null)
            {
                int quantity = int.Parse(txtQuantity.Text);
                if (quantity > 1)
                {
                    quantity--;
                    txtQuantity.Text = quantity.ToString();
                }
            }
        }

        protected void plus_Click(object sender, EventArgs e)
        {
            Button plusButton = (Button)sender;
            RepeaterItem repeaterItem = (RepeaterItem)plusButton.NamingContainer;
            TextBox txtQuantity = (TextBox)repeaterItem.FindControl("QuantityTB");
            Label lblStock = (Label)repeaterItem.FindControl("AvailableStock");

            if (txtQuantity != null)
            {
                int quantity = int.Parse(txtQuantity.Text);
                int stock = int.Parse(lblStock.Text);
                if (quantity < stock)
                {
                    quantity++;
                    txtQuantity.Text = quantity.ToString();
                }
            }
        }

        protected void CheckOutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/CheckOutPage.aspx");
        }
    }
}