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
    public partial class TransactionHistory : System.Web.UI.Page
    {
        User user;
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

                if (IsPostBack && Request["__EVENTTARGET"] == "ShowTransactionDetails")
                {
                    String transactionId = SelectedTransaction.Value;
                    BindModalContent(transactionId);
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", "openModal();", true);
                }

                BindTransactionHistory();
            }
        }

        private void BindTransactionHistory()
        {
            List<Transaction> userTransactionList = TransactionController.GetUserTransaction(user.UserID);
            TransactionHistoryRepeater.DataSource = userTransactionList;
            TransactionHistoryRepeater.DataBind();
        }

        private void BindModalContent(String TransactionID)
        {
            List<Transaction> choosenTransaction = new List<Transaction>();

            choosenTransaction.Add(TransactionController.GetTransactionByID(TransactionID));
            TransactionFV.DataSource = choosenTransaction;
            TransactionFV.DataBind();

            List<TransactionDetail> choosenTransactionItems = TransactionDetailController.GetTransactionDetailList(TransactionID);
            Repeater detailrepeater1 = (Repeater)TransactionFV.FindControl("DetailRepeater1");
            Repeater detailrepeater2 = (Repeater)TransactionFV.FindControl("DetailRepeater2");

            detailrepeater1.DataSource = choosenTransactionItems;
            detailrepeater1.DataBind();
            detailrepeater2.DataSource = choosenTransactionItems;
            detailrepeater2.DataBind();
        }

        protected void TransactionHistoryRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Transaction item = (Transaction)e.Item.DataItem;
                List<TransactionDetail> transactionItems = TransactionDetailController.GetTransactionDetailList(item.TransactionID);

                Label itemCountLabel = (Label)e.Item.FindControl("TransactionItemCount");
                itemCountLabel.Text = transactionItems.Count.ToString() + " Barang";

                bool stillProcessing = transactionItems.Any(t => t.Status == "DiProses" || t.Status == "Sedang Dikirim");
                Label statusLabel = (Label)e.Item.FindControl("StatusLabel");
                if (stillProcessing)
                {
                    statusLabel.Text = "Sedang Diproses";
                    statusLabel.CssClass += " process";
                }
                else
                {
                    statusLabel.Text = "Selesai";
                    statusLabel.CssClass += " done";
                }

                Repeater innerRepeater = (Repeater)e.Item.FindControl("TransactionItemRepeater");
                innerRepeater.DataSource = transactionItems;
                innerRepeater.DataBind();
            }
        }

        protected void TransactionFV_DataBound(object sender, EventArgs e)
        {

        }

        protected void DetailRepeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                TransactionDetail item = (TransactionDetail)e.Item.DataItem;
                
                Label statusLabel = (Label)e.Item.FindControl("StatusLbl");
                if (!(item.Status.Equals("Selesai")))
                {
                    statusLabel.CssClass += " process";
                }
                else
                {
                    statusLabel.CssClass += " done";
                }
            }
        }
    }
}