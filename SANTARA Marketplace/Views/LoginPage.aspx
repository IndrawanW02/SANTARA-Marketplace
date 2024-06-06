<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SANTARA Login</title>
    <link href="../Styles/[Auth]Page_Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section>
            <div class="illustration-tagline" id="login">
                <asp:Image CssClass="illustration" ID="Image1" runat="server" ImageUrl="~/Assets/Images/RegisterIllustration.svg" />
                <h1>Ayo temukan sepatu yang sesuai dengan gayamu!</h1>
            </div>
            <div class="form" id="login1">
                <div class="form-registration">
                    <h1>Welcome.</h1>
                    <div class="input-wrapper">
                        <div class="text-box">
                            <asp:Label ID="UsernameLbl" runat="server" Text="Username" CssClass="input-label"></asp:Label>
                            <asp:TextBox ID="UsernameTB" runat="server" CssClass="input-box user"></asp:TextBox>
                            <asp:Label ID="UsernameError" runat="server" CssClass="error-text" Text="" ForeColor="#DB2B27"></asp:Label>
                        </div>
                        <div class="text-box">
                            <asp:Label ID="UserPasswordLbl" runat="server" Text="Password" CssClass="input-label"></asp:Label>
                            <asp:TextBox ID="UserPasswordTB" runat="server" CssClass="input-box pass" TextMode="Password"></asp:TextBox>
                            <asp:Label ID="UserPasswordError" runat="server" CssClass="error-text" Text="" ForeColor="#DB2B27"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="login-function">
                    <asp:Label ID="ErrorLbl" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                    <asp:Button ID="LoginBtn" runat="server" Text="Login" OnClick="LoginBtn_Click" />
                    <p>Belum punya akun? <a href="RegisterPage.aspx">Daftar Sekarang</a></p>
                </div>

            </div>

        </section>

        <script>
            function errInput() {
                var errUsername = document.getElementById('<%= UsernameTB.ClientID %>');
                var errPassword = document.getElementById('<%= UserPasswordTB.ClientID %>');

                if (errUsername.value === '') {
                    errUsername.classList.add('error');
                }
                else {
                    errUsername.classList.remove('error');
                }

                if (errPassword.value === '') {
                    errPassword.classList.add('error');
                }
                else {
                    errPassword.classList.remove('error');
                }

            };
        </script>
    </form>
</body>
</html>
