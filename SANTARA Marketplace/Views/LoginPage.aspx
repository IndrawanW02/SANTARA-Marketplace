<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SANTARA Login</title>
    <link href="../Styles/[Auth]Page_Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="illustration-tagline">
                <asp:Image CssClass="illustration" ID="Image1" runat="server" ImageUrl="~/Assets/Images/RegisterIllustration.svg" />
                <h1>Sudah siap untuk menemukan sepatu yang sempurna? Bergabunglah dengan kami!</h1>
            </div>
            <div class="form">
                <div>
                    <asp:Label ID="UsernameLbl" runat="server" Text="Username"></asp:Label>
                    <asp:TextBox ID="UsernameTB" runat="server"></asp:TextBox>
                    <asp:Label ID="UsernameError" runat="server" Text=""></asp:Label>
                </div>
                <div>
                    <asp:Label ID="UserPasswordLbl" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="UserPasswordTB" runat="server"></asp:TextBox>
                    <asp:Label ID="UserPasswordError" runat="server" Text=""></asp:Label>
                </div>
                <div class="RememberMe">
                    <asp:CheckBox ID="RememberMeCB" runat="server" />
                    <asp:Label ID="RememberMeLbl" runat="server" Text="Remember Me"></asp:Label>
                </div>

                <div>
                    <asp:Label ID="ErrorLbl" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                </div>

                <asp:Button ID="LoginBtn" runat="server" Text="Registrate" OnClick="LoginBtn_Click" />
            </div>

        </section>
    </form>
</body>
</html>
