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
        public static User user;
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
                Session["TotalPrice"] = ShoppingCartController.GetTotalShoppingCart(user.UserID);

                if (!IsPostBack)
                {
                    cartItem = ShoppingCartController.GetUserShoppingCart(user.UserID);
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
                    TotalShipmentPriceLbl.Text = HeaderAndFooter.GetPrice(Convert.ToInt32(Session["TotalShipmentPrice"].ToString()));
                    TotalPriceLbl.Text = HeaderAndFooter.GetPrice(Convert.ToInt32(GetTotalExpense().ToString()));

                    foreach (RepeaterItem Item in CardRepeater.Items)
                    {
                        HiddenField hfShipmentMethod = (HiddenField)Item.FindControl("hfShipmentMethod");
                        HiddenField hfShipmentPrice = (HiddenField)Item.FindControl("hfShipmentPrice");

                        if (hfShipmentMethod.Value != "")
                        {
                            Literal shipmentOptionLiteral = (Literal)Item.FindControl("ShipmentOptionLiteral");
                            shipmentOptionLiteral.Text = "<span>" + hfShipmentMethod.Value + " " + hfShipmentPrice.Value + "</span>";
                        }
                    }
                }
                SaldoUser.Text = IdrPrice(user.UserBalance);
                //if (IsBalanceEnough() == false) ;
             }
        }

        protected int SetJNTPrice(object ProductPrice)
        {
            int hargaJNT = (int)ProductPrice * 25 / 1000;
            if (hargaJNT < 9000)
            {
                return 9000;
            }
            return hargaJNT;
        }

        protected int SetJNEPrice(object ProductPrice)
        {
            int hargaJNE = (int)ProductPrice * 3 / 100;
            if (hargaJNE < 8000)
            {
                return 8000;
            }
            return hargaJNE;
        }

        protected int SetSiCepatPrice(object ProductPrice)
        {
            int hargaSiCepat = (int)ProductPrice * 35 / 1000;
            if (hargaSiCepat < 10000)
            {
                return 10000;
            }
            return hargaSiCepat;

        }

        protected bool IsShipmentFulfilled()
        {
            int ShipmentChoosen = 0;
            foreach (RepeaterItem item in CardRepeater.Items)
            {
                HiddenField hfShipmentMethod = (HiddenField)item.FindControl("hfShipmentMethod");
                HiddenField hfShipmentPrice = (HiddenField)item.FindControl("hfShipmentPrice");
                Label lblTransactionID = (Label)item.FindControl("ShipmentErrLbl");

                if (hfShipmentMethod.Value.Equals("") && hfShipmentPrice.Value.Equals("")){
                    lblTransactionID.Text = "Kurir pengiriman tidak boleh kosong";
                    lblTransactionID.Visible = true;
                }
                else
                {
                    ShipmentChoosen++;
                    lblTransactionID.Visible = false;
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
        public static string GetTotalPrice()
        {
            return HeaderAndFooter.GetPrice(int.Parse(HttpContext.Current.Session["TotalPrice"].ToString()) + int.Parse(HttpContext.Current.Session["TotalShipmentPrice"].ToString()));
        }

        [WebMethod]
        public static string IdrPrice(int price)
        {
            return HeaderAndFooter.GetPrice(price);
        } 

        [WebMethod]
        public static bool IsBalanceEnough()
        {
            if (user.UserBalance < GetTotalExpense())
            {
                return false;
            }
            return true;
        }

        public static int GetTotalExpense()
        {
            return int.Parse(HttpContext.Current.Session["TotalPrice"].ToString()) + int.Parse(HttpContext.Current.Session["TotalShipmentPrice"].ToString());
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

                HiddenField hfShipmentMethod = (HiddenField)e.Item.FindControl("hfShipmentMethod");
                HiddenField hfShipmentPrice = (HiddenField)e.Item.FindControl("hfShipmentPrice");
                if (hfShipmentMethod.Value != "")
                {
                    Literal shipmentOptionLiteral = (Literal)e.Item.FindControl("ShipmentOptionLiteral");
                    shipmentOptionLiteral.Text = "<span>" + hfShipmentMethod.Value + " " + hfShipmentPrice.Value + "</span>";
                }
            }

        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            if (user.UserBalance >= GetTotalExpense())
            {
                PaymentErr.Text = "";
                LinkButton choosedPayment = sender as LinkButton;

                int newBalance = user.UserBalance - GetTotalExpense();
                UserController.UpdateUserBalance(user.UserID, newBalance);

                String transactionID = TransactionController.GenerateTransactionID();
                String AddressDestination = AddressBox.Text;
                TransactionController.AddTransaction(transactionID, user.UserID, choosedPayment.ID, AddressDestination, GetTotalExpense());

                int counter = 0;
                foreach (RepeaterItem item in CardRepeater.Items)
                {
                    HiddenField hfShipmentMethod = (HiddenField)item.FindControl("hfShipmentMethod");
                    HiddenField hfShipmentPrice = (HiddenField)item.FindControl("hfShipmentPrice");

                    ShoppingCart Item = cartItem[counter];

                    String StorageID = Item.StorageID;
                    String StoreID = Item.Storage.Product.StoreID;
                    int Quantity = Item.Quantity;

                    TransactionDetailController.AddTransactionDetail(transactionID, StorageID, StoreID, Quantity, hfShipmentMethod.Value, Convert.ToInt32(hfShipmentPrice.Value));
                    StorageController.UpdateStock(StorageID, Item.Storage.ProductStock - Quantity);
                    ProductController.UpdateProductSold(Item.Storage.ProductID, Item.Storage.Product.ProductSold + Quantity);
                    counter++;
                }

                ShoppingCartController.RemoveUserCart(user.UserID);

                string script = "alert('Pembayaran Berhasil !'); window.location.href='" + ResolveUrl("~/Views/HomePage.aspx") + "';";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "openModalFromCodeBehind();", true);
                PaymentErr.Text = "Saldo tidak mencukupi...";
            }
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