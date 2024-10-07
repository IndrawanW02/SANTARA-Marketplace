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

            if (IsPostBack)
            {
                UserPasswordTB.Attributes["value"] = UserPasswordTB.Text;
            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            String Status = "";
            String Username = UsernameTB.Text;
            String Password = UserPasswordTB.Text;

            String usernameStatus = UserAuthController.CheckUsername(Username);
            String passwordStatus = UserAuthController.CheckPassword(Password);

            UsernameError.Text = usernameStatus;
            UserPasswordError.Text = passwordStatus;

            if (usernameStatus.Equals("") && passwordStatus.Equals(""))
            {
                Status = UserAuthController.Login(Username, Password);
            }
            else
            {
                if (!(usernameStatus.Equals("")) || !(passwordStatus.Equals("")))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "errInput();", true);
                }
            }


            if (Status.Equals("Login Success"))
            {
                User user = UserController.GetUserByUsername(Username);
                Session["user"] = user;

                HttpCookie cookie = new HttpCookie("user_cookie");
                cookie.Value = user.UserID.ToString();
                cookie.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(cookie);

                string script = "alert('Login Berhasil !'); window.location.href='" + ResolveUrl("~/Views/HomePage.aspx") + "';";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
            else
            {
                ErrorLbl.Text = Status;
            }
        }
    }
}