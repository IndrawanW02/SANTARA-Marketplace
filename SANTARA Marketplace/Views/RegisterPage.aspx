<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Now!</title>
    <link href="../Styles/[Auth]Page_Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="illustration-tagline">
                <asp:Image CssClass="illustration" ID="Image1" runat="server" ImageUrl="~/Assets/Images/Illustration.svg"/>
                <h1>Sudah siap untuk menemukan sepatu yang sempurna? Bergabunglah dengan kami!</h1>
            </div>
            <div class="form">
                <div>
                    <asp:Label ID="UsernameLbl" runat="server" Text="Username"></asp:Label>
                    <asp:TextBox ID="UsernameTB" runat="server"></asp:TextBox>
                    <asp:Label ID="UsernameError" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="UserEmailLbl" runat="server" Text="E-Mail"></asp:Label>
                    <asp:TextBox ID="UserEmailTB" runat="server"></asp:TextBox>
                    <asp:Label ID="UserEmailError" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="UserPasswordLbl" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="UserPasswordTB" runat="server"></asp:TextBox>
                    <asp:Label ID="UserPasswordError" runat="server" Text="" ForeColor="#c21815" ></asp:Label>
                </div>
                <div>
                    <asp:Label ID="ConfirmationPasswordLbl" runat="server" Text="Confirmation Password"></asp:Label>
                    <asp:TextBox ID="ConfirmationPasswordTB" runat="server"></asp:TextBox>
                    <asp:Label ID="ConfirmationPasswordError" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="UserPhoneNumber" runat="server" Text="Phonenumber"></asp:Label>
                    <asp:TextBox ID="UserPhoneNumberTB" runat="server"></asp:TextBox>
                    <asp:Label ID="UserPhoneNumberError" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                </div>

                <asp:Button ID="RegistrateBtn" runat="server" Text="Registrate" OnClick="RegistrateBtn_Click"/>
            </div>

        </section>
    </form>
</body>
</html>
