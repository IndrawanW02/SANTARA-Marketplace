<%@ Page Title="SANTARA" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="SANTARA_Marketplace.Views.Home_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Styles/HomePage_Styles.css" rel="stylesheet" />
    <link href="../Styles/ProductCard_Styles.css" rel="stylesheet" />

    <div class="Container">
        <div class="Content">
            <div class="AdvertisementSlider">
                <div class="Advertisement"></div>

                <asp:RadioButton ID="RadioButton1" runat="server" />
                <asp:RadioButton ID="RadioButton2" runat="server" />
                <asp:RadioButton ID="RadioButton3" runat="server" />
                <asp:RadioButton ID="RadioButton4" runat="server" />
                <asp:RadioButton ID="RadioButton5" runat="server" />

                <div class="Advertisement1">
                    <img alt="" src="../Assets/file.png" />
                </div>
            </div>


            <div class="MostPopular">
                <h1>BEST SELLER</h1>

                <div class="CardContainer">
                    <asp:Repeater ID="CardRepeater" runat="server">
                        <ItemTemplate>
                            <a href="ProductPage.aspx?ProductID=<%# Eval("Product.ProductID") %>" class="ProductNavigator">
                                <div class="ProductCard">
                                    <div class="ProductImageContainer">
                                        <img alt="" src="<%# SANTARA_Marketplace.Template.HeaderAndFooter.GetImageBase64String(Eval("ProductImage")) %>" />
                                    </div>

                                    <div class="ProductDescriptionContainer">
                                        <div>
                                            <p class="ProductName"><%# Eval("Product.ProductName") %></p>
                                            <div class="ProductRating">
                                                <span class="basil--star-solid"></span>
                                                <p><%# Eval("Product.ProductRatingValue") %></p>
                                                <p>(<%# Eval("Product.ProductRatingCount") %>)</p>
                                            </div>
                                            <p class="ProductPrice"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("Product.ProductPrice")) %></p>
                                        </div>

                                        <div>
                                            <p class="ProductionPlace"><%# Eval("StoreInfo.Address.Province") %></p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>


            <div class="Categories">
                <a href="ManProductPage.aspx">
                    <div class="CategoryNav">
                        <div class="CategoryIcon">
                            <img src="../Assets/ManIcon.png" />
                        </div>
                        <div class="CategoryName">
                            <p>Sepatu</p>
                            <p>Pria</p>
                        </div>
                    </div>
                </a>

                <a href="WomanProductPage.aspx">
                    <div class="CategoryNav">
                        <div class="CategoryIcon">
                            <img src="../Assets/WomanIcon.png" />
                        </div>
                        <div class="CategoryName">
                            <p>Sepatu</p>
                            <p>Wanita</p>
                        </div>
                    </div>
                </a>

                <a href="KidProductPage.aspx">
                    <div class="CategoryNav">
                        <div class="CategoryIcon">
                            <img src="../Assets/KidIcon.png" />
                        </div>
                        <div class="CategoryName">
                            <p>Sepatu</p>
                            <p>Anak-anak</p>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>


    <asp:Label ID="Label1" runat="server" Text="BrowseImage"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

</asp:Content>
