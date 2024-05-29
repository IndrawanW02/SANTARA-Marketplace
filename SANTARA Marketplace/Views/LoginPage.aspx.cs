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
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null || Request.Cookies["user_cookie"] != null)
            {
                Response.Redirect("~/Views/HomePage.aspx");
            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            String Status = "";
            String Username = UsernameTB.Text;
            String Password = UserPasswordTB.Text;
            bool isRemember = RememberMeCB.Checked;

            Status = UserAuthController.Login(Username, Password);

            if (Status.Equals("Login Success"))
            {
                User user = UserController.GetUserByUsername(Username);
                Session["user"] = user;
                if (isRemember)
                {
                    HttpCookie cookie = new HttpCookie("user_cookie");
                    cookie.Value = user.UserID.ToString();
                    cookie.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(cookie);
                }
                Response.Redirect("~/Views/HomePage.aspx");
            }
            else
            {
                ErrorLbl.Text = Status;
            }
        }
    }
}