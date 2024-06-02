using SANTARA_Marketplace.Controllers;
using SANTARA_Marketplace.Model;
using SANTARA_Marketplace.Template;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Util;

namespace SANTARA_Marketplace.Views
{
    public partial class ShoppingCartPage : System.Web.UI.Page
    {
        public User user;
        public List<ShoppingCart> cartItem = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                Response.Redirect("~/Views/LoginPage.aspx");
            }
            else
            {
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

                if (!IsPostBack)
                {
                    CardRepeater.DataSource = cartItem;
                    CardRepeater.DataBind();
                    TransactionRepeater.DataSource = cartItem;
                    TransactionRepeater.DataBind();
                }

                TotalPriceLbl.Text = GetUserTotalExpenses(user.UserID);

            }
        }

        [WebMethod]
        public static void SaveItemQuantity(String CartID, int Qty)
        {
            ShoppingCartController.UpdateCartQuantity(CartID, Qty);
        }

        [WebMethod]
        public static string GetUserTotalExpenses(String UserID)
        {
            return HeaderAndFooter.GetPrice(ShoppingCartController.GetTotalShoppingCart(UserID));
        }

        protected void quantity_DataBinding(object sender, EventArgs e)
        {
            var textBox = (TextBox)sender;
            var dataItem = DataBinder.GetDataItem(textBox.NamingContainer) as ShoppingCart;

            textBox.Text = dataItem.Quantity.ToString();
        }

        protected void CheckOutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/CheckOutPage.aspx");
        }

        protected void CardRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ShoppingCart item = (ShoppingCart)e.Item.DataItem;

                TextBox quantityTB = (TextBox)e.Item.FindControl("QuantityTB");
                if (quantityTB != null)
                {
                    quantityTB.Attributes.Add("max", item.Storage.ProductStock.ToString()); // Set nilai maksimum
                }
            }
        }

        protected void DeleteItemBtn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            String itemID = btn.CommandArgument;

            ShoppingCartController.RemoveCertainItem(itemID);

            cartItem = ShoppingCartController.GetUserShoppingCart(user.UserID);
            CardRepeater.DataSource = cartItem;
            CardRepeater.DataBind();
        }
    }
}