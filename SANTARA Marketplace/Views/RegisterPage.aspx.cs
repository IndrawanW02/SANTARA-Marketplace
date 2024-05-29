using SANTARA_Marketplace.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SANTARA_Marketplace.Views
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null || Request.Cookies["user_cookie"] != null)
            {
                Response.Redirect("~/Views/HomePage.aspx");
            }

            if (IsPostBack)
            {
                //UserPasswordTB.Attributes["value"] = Session["Password"]?.ToString();
                //ConfirmationPasswordTB.Attributes["value"] = Session["Confirmation"]?.ToString();
            }
        }

        protected void RegistrateBtn_Click(object sender, EventArgs e)
        {
            //Session["Password"] = UserPasswordTB.Text;
            //Session["Confirmation"] = ConfirmationPasswordTB.Text;

            String Username = UsernameTB.Text;
            String UserEmailAddress = UserEmailTB.Text;
            String UserPassword = UserPasswordTB.Text;
            String ConfirmationPassword = ConfirmationPasswordTB.Text;
            String UserPhoneNumber = UserPhoneNumberTB.Text;

            UsernameError.Text = UserRegistrationController.CheckUsername(Username);
            UserEmailError.Text = UserRegistrationController.CheckEmail(UserEmailAddress);
            UserPasswordError.Text = UserRegistrationController.CheckPassword(UserPassword);
            ConfirmationPasswordError.Text = UserRegistrationController.CheckConfirmationPassword(UserPassword, ConfirmationPassword);
            UserPhoneNumberError.Text = UserRegistrationController.CheckPhoneNumber(UserPhoneNumber);

            if (UserRegistrationController.IsEligible(Username, UserEmailAddress, UserPassword, ConfirmationPassword, UserPhoneNumber))
            {
                UserRegistrationController.RegistrateUser(Username, UserEmailAddress, UserPassword, UserPhoneNumber);
                Response.Redirect("~/Views/LoginPage.aspx");
            }
        }
    }
}