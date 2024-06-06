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
                UserPasswordTB.Attributes["value"] = UserPasswordTB.Text;
                ConfirmationPasswordTB.Attributes["value"] = ConfirmationPasswordTB.Text;
            }
        }

        protected void RegistrateBtn_Click(object sender, EventArgs e)
        {
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
                string script = "alert('Akun berhasil dibuat !'); window.location.href='" + ResolveUrl("~/Views/LoginPage.aspx") + "';";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "CallMyFunction", "errInput();", true);
            }
        }
    }
}