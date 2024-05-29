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

namespace SANTARA_Marketplace.Views
{
    public partial class CheckOutPage : System.Web.UI.Page
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
                hfTriggerPostback.Value = "SaveShipmentDetail()";

                cartItem = ShoppingCartController.GetUserShoppingCart(user.UserID);
                GetTotalCartPrice();

                if (!IsPostBack)
                {
                    CardRepeater.DataSource = cartItem;
                    CardRepeater.DataBind();
                    TransactionRepeater.DataSource = cartItem;
                    TransactionRepeater.DataBind();
                    Session["TotalShipmentPrice"] = 0;
                    TotalPriceLbl.Text = HeaderAndFooter.GetPrice(Session["TotalPrice"]);

                    ChoosePaymentBtn.Attributes["data-modal-target"] = "#modal";
                }

                if (IsPostBack)
                {
                    TotalShipmentPriceLbl.Text = Session["TotalShipmentPrice"].ToString();
                    TotalPriceLbl.Text = GetTotalExpense().ToString();
                    //CheckShipmentFulfillment();
                }
                SaldoUser.Text = user.UserBalance.ToString();
                IsBalanceEnough();
            }
        }

        public int GetTotalCartPrice()
        {
            int totalPrice = 0;
            foreach (var item in cartItem)
            {
                totalPrice = totalPrice + (item.Quantity * item.Storage.Product.ProductPrice);
            }
            Session["TotalPrice"] = totalPrice;
            return totalPrice;
        }

        protected int SetJNTPrice(object ProductPrice)
        {
            return (int)ProductPrice * 25 / 1000;
        }

        protected int SetJNEPrice(object ProductPrice)
        {
            return (int)ProductPrice * 3 / 100;
        }

        protected int SetSiCepatPrice(object ProductPrice)
        {
            return (int)ProductPrice * 35 / 1000;
        }

        protected bool IsShipmentFulfilled()
        {
            int ShipmentChoosen = 0;
            foreach (RepeaterItem item in CardRepeater.Items)
            {
                HiddenField hfShipmentMethod = (HiddenField)item.FindControl("hfShipmentMethod");
                HiddenField hfShipmentPrice = (HiddenField)item.FindControl("hfShipmentPrice");
                Label lblTransactionID = (Label)item.FindControl("ShipmentErrLbl");

                if (hfShipmentMethod == null || hfShipmentPrice.Value == "")
                {
                    lblTransactionID.Text = "Pilih kurir pengiriman";
                    lblTransactionID.Visible = true;
                }
                else
                {
                    ShipmentChoosen++;
                }
            }

            if (ShipmentChoosen == cartItem.Count)
            {
                return true;
            }
            return false;
        }

        [WebMethod]
        public static void SaveTotalShipmentPrice(int totalShipmentPrice)
        {
            HttpContext.Current.Session["TotalShipmentPrice"] = totalShipmentPrice;
        }

        [WebMethod]
        public static int GetTotalPrice()
        {
            return int.Parse(HttpContext.Current.Session["TotalPrice"].ToString()) + int.Parse(HttpContext.Current.Session["TotalShipmentPrice"].ToString());
        }

        protected int GetTotalExpense()
        {
            return int.Parse(Session["TotalPrice"].ToString()) + int.Parse(Session["TotalShipmentPrice"].ToString());
        }

        protected void PaymentProcess()
        {

        }

        protected void CardRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {


        }

        protected void IsBalanceEnough()
        {
            if (user.UserBalance < GetTotalExpense())
            {
                PaymentErr.Text = "Saldo tidak mencukupi ! ";
                SantaraPay.Enabled = false;
                SantaraPay.Visible = true;
            }
            else
            {
                SantaraPay.Enabled = true;
            }
        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            SaldoUser.Text = "masuk";

        }

        protected void ChoosePaymentBtn_Click(object sender, EventArgs e)
        {
            if (IsShipmentFulfilled())
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "openModalFromCodeBehind();", true);
            }
        }

    }
}