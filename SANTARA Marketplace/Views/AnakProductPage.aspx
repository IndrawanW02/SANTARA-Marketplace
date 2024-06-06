<%@ Page Title="SANTARA" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="AnakProductPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.KidProductPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Styles/ProductCard_Styles.css" rel="stylesheet" />
    <link href="../Styles/[Category]ProductPage_Styles.css" rel="stylesheet" />

    <section>
        <nav class="Page-Path">
            <div>
                <a href="HomePage.aspx" class="NavText">Beranda</a>
                <p class="NavText">/</p>
                <a href="CataloguePage.aspx" class="NavText">Katalog</a>
                <p class="NavText">/</p>
                <p class="NavText">Sepatu Anak-anak</p>
            </div>
        </nav>

        <div class="anak-header">
            <div class="header-container">
                <h3>SEPATU ANAK</h3>
                <div class="search-bar-container">
                    <label for="ShoeNameOrBrand">SHOE NAME / BRAND</label>
                    <div class="bar">
                        <input type="text" class="search-bar" placeholder="Search...">
                        <asp:Button ID="search" runat="server" Text="" CssClass="search-button" />
                    </div>
                </div>
            </div>
        </div>

        <div class="filter-section">
            <div class="filter-container">
                <label for="SortBy">SORT BY</label>
                <asp:DropDownList class="DD" ID="SortBy" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SelectedIndexChanged">
                    <asp:ListItem ID="itemlist" Text="Tidak Ada" Value=""></asp:ListItem>
                    <asp:ListItem Text="Rating Terendah" Value="RatingAsc"></asp:ListItem>
                    <asp:ListItem Text="Rating Tertinggi" Value="RatingDesc"></asp:ListItem>
                    <asp:ListItem Text="Harga Termurah" Value="HargaAsc"></asp:ListItem>
                    <asp:ListItem Text="Harga Termahal" Value="HargaDesc"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="filter-container">
                <label for="ShoeType">SHOE TYPE</label>
                <asp:DropDownList class="DD" ID="ShoeType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SelectedIndexChanged">
                    <asp:ListItem ID="default" Text="Apapun" Value=""></asp:ListItem>
                    <asp:ListItem Text="Pantofel" Value="Pantofel"></asp:ListItem>
                    <asp:ListItem Text="Sneaker" Value="Sneaker"></asp:ListItem>
                    <asp:ListItem Text="Slip On" Value="SlipOn"></asp:ListItem>
                    <asp:ListItem Text="Boots" Value="Boots"></asp:ListItem>
                    <asp:ListItem Text="Sandal" Value="Sandal"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="filter-container">
                <label for="StoreLocation">STORE'S LOCATION</label>
                <asp:DropDownList class="DD" ID="StoreLocation" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SelectedIndexChanged">
                    <asp:ListItem Text="Apapun" Value=""></asp:ListItem>
                    <asp:ListItem Text="Jakarta" Value="Jakarta"></asp:ListItem>
                    <asp:ListItem Text="Bandung" Value="Bandung"></asp:ListItem>
                    <asp:ListItem Text="Surabaya" Value="Surabaya"></asp:ListItem>
                    <asp:ListItem Text="Yogyakarta" Value="Yogyakarta"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="price-filter-container">
                <label for="PriceRange">PRICE RANGE</label>
                <div class="price-range-container">
                    <div class="price-range">
                        <asp:TextBox ID="MinPrice" runat="server" placeholder="Min" CssClass="Price" TextMode="Number" AutoPostBack="true" OnTextChanged="SelectedIndexChanged"></asp:TextBox>
                        <div class="price-range-separator"></div>
                        <asp:TextBox ID="MaxPrice" runat="server" placeholder="Max" CssClass="Price" TextMode="Number" AutoPostBack="true" OnTextChanged="SelectedIndexChanged"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="reset-filter-container">
                <asp:Button ID="ResetFilter" runat="server" Text="RESET FILTER" CssClass="reset-filter-btn" />
            </div>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="product-catalogue">
                    <div class="center">
                        <div class="CardContainer">
                            <asp:Repeater ID="CardRepeater" runat="server">
                                <ItemTemplate>
                                    <a href="ProductPage.aspx?ProductID=<%# Eval("ProductID") %>" class="ProductNavigator">
                                        <div class="ProductCard">
                                            <div class="ProductImageContainer">
                                                <img alt="" src="<%# SANTARA_Marketplace.Template.HeaderAndFooter.GetImageBase64String(Eval("ProductThumbnail")) %>" />
                                            </div>

                                            <div class="ProductDescriptionContainer">
                                                <div class="product-info">
                                                    <p class="ProductName"><%# Eval("ProductName") %></p>
                                                    <div class="ProductRating">
                                                        <span class="basil--star-solid"></span>
                                                        <p><%# Eval("ProductRatingValue") %></p>
                                                        <p>(<%# Eval("ProductRatingCount") %>)</p>
                                                    </div>
                                                    <p class="ProductPrice"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("ProductPrice")) %></p>
                                                </div>

                                                <div class="product-production-info">
                                                    <p class="ProductionPlace"><%# Eval("Store.Address.Province") %></p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="SortBy" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ShoeType" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="StoreLocation" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="MinPrice" EventName="TextChanged" />
                <asp:AsyncPostBackTrigger ControlID="MaxPrice" EventName="TextChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </section>
</asp:Content>
