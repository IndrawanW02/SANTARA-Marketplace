using SANTARA_Marketplace.Controllers;
using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SANTARA_Marketplace.Template
{
    public partial class HeaderAndFooter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
            {
                SignInBtn.Visible = true;
                SignUpBtn.Visible = true;
                UserProfilePic.Visible = false;
                Username.Visible = false;
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

                UserProfilePic.ImageUrl = GetImageBase64String(user.UserProfilePic);
                Username.Text = user.Username;
                UserProfilePic.Visible = true;
                Username.Visible = true;
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "addOutline();", true);
            }
        }

        public static string GetImageBase64String(object imageData)
        {
            if (imageData == null)
            {
                return string.Empty;
            }

            if (imageData is byte[] data)
            {
                //string mimeType = IsPngImage(data) ? "image/png" : "image/jpeg";
                string mimeType = "image/png";
                string base64String = Convert.ToBase64String(data);
                return $"data:{mimeType};base64,{base64String}";
            }

            return string.Empty;

        }

        public static String GetPrice(object ProductPrice)
        {
            int price = (int)ProductPrice;

            NumberFormatInfo nfi = new CultureInfo("id-ID").NumberFormat;
            nfi.CurrencyDecimalDigits = 0;

            return price.ToString("C", nfi);
        }

        protected void SignInBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/LoginPage.aspx");
        }

        protected void SignUpBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/RegisterPage.aspx");
        }
    }
}