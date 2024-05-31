<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Now!</title>
    <link href="../Styles/[Auth]Page_Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section>
            <div class="form" id="register1">
                <div class="form-registration">
                    <h1>Register.</h1>
                    <div class="input-wrapper">
                        <div class="text-box">
                            <asp:Label ID="UsernameLbl" runat="server" Text="Username" CssClass="input-label"></asp:Label>
                            <asp:TextBox ID="UsernameTB" runat="server" CssClass="input-box user"></asp:TextBox>
                            <asp:Label ID="UsernameError" runat="server" CssClass="error-text" Text="" ForeColor="#c21815"></asp:Label>
                        </div>
                        <div class="text-box">
                            <asp:Label ID="UserEmailLbl" runat="server" Text="E-Mail" CssClass="input-label"></asp:Label>
                            <asp:TextBox ID="UserEmailTB" runat="server" CssClass="input-box email"></asp:TextBox>
                            <asp:Label ID="UserEmailError" runat="server" CssClass="error-text" Text="" ForeColor="#c21815"></asp:Label>
                        </div>
                        <div class="text-box-wrapper">
                            <div class="text-box" id="pass-reg">
                                <asp:Label ID="UserPasswordLbl" runat="server" Text="Password" CssClass="input-label"></asp:Label>
                                <asp:TextBox ID="UserPasswordTB" runat="server" CssClass="input-box pass" TextMode="Password"></asp:TextBox>
                                <asp:Label ID="UserPasswordError" runat="server" CssClass="error-text" Text="" ForeColor="#c21815"></asp:Label>
                            </div>
                            <div class="text-box" id="conf-reg">
                                <asp:Label ID="ConfirmationPasswordLbl" runat="server" Text="Confirmation Password" CssClass="input-label"></asp:Label>
                                <asp:TextBox ID="ConfirmationPasswordTB" runat="server" CssClass="input-box pass-reg" TextMode="Password"></asp:TextBox>
                                <asp:Label ID="ConfirmationPasswordError" runat="server" CssClass="error-text" Text="" ForeColor="#c21815"></asp:Label>
                            </div>
                        </div>
                        <div class="text-box">
                            <asp:Label ID="UserPhoneNumber" runat="server" Text="No. Telp" CssClass="input-label"></asp:Label>
                            <asp:TextBox ID="UserPhoneNumberTB" runat="server" CssClass="input-box telp"></asp:TextBox>
                            <asp:Label ID="UserPhoneNumberError" runat="server" CssClass="error-text" Text="" ForeColor="#c21815"></asp:Label>
                        </div>
                    </div>
                </div>


                <div class="login-function">
                    <asp:Label ID="ErrorLbl" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                    <asp:Button ID="RegistrateBtn" runat="server" Text="Registrate" OnClick="RegistrateBtn_Click" />
                    <p>Sudah punya akun? <a href="LoginPage.aspx">Login Sekarang</a></p>
                </div>
            </div>

            <div class="illustration-tagline" id="register">
                <asp:Image CssClass="illustration" ID="Image1" runat="server" ImageUrl="~/Assets/Images/Illustration.svg" />
                <h1>Sudah siap untuk menemukan sepatu yang sempurna? Bergabunglah dengan kami!</h1>
            </div>

        </section>

        <script>
            function errInput() {
                var errUsername = document.getElementById('<%= UsernameTB.ClientID %>');
                var errEmail = document.getElementById('<%= UserEmailTB.ClientID %>');
                var errPassword = document.getElementById('<%= UserPasswordTB.ClientID %>');
                var errConfirmation = document.getElementById('<%= ConfirmationPasswordTB.ClientID %>');
                var errPhone = document.getElementById('<%= UserPhoneNumberTB.ClientID %>');

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

                if (errEmail.value === '') {
                    errEmail.classList.add('error');
                }
                else {
                    errEmail.classList.remove('error');
                }

                if (errConfirmation.value === '') {
                    errConfirmation.classList.add('error');
                }
                else {
                    errConfirmation.classList.remove('error');
                }

                if (errPhone.value === '') {
                    errPhone.classList.add('error');
                }
                else {
                    errPhone.classList.remove('error');
                }

            };
        </script>
    </form>
</body>
</html>
