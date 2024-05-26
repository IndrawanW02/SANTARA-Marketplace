<%@ Page Title="SANTARA" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="KidProductPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.KidProductPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Styles/[Category]ProductPage_Styles.css" rel="stylesheet" />
    <link href="../Styles/ProductCard_Styles.css" rel="stylesheet" />

    <nav class="Page-Path">
        <div>
            <a href="HomePage.aspx" class="NavText">Beranda</a>
            <p class="NavText">></p>
            <a href="CataloguePage.aspx" class="NavText">Katalog</a>
            <p class="NavText">></p>
            <p class="NavText">Sepatu Anak-anak</p>
        </div>
    </nav>

    <div class="anak-header">
        <div class="header-container">
            <h3>SEPATU ANAK-ANAK</h3>
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
            <asp:DropDownList class="DD" ID="SortBy" runat="server">
                <asp:ListItem ID="itemlist" Text="None" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="filter-container">
            <label for="ShoeType">SHOE TYPE</label>
            <asp:DropDownList class="DD" ID="ShoeTypeID" runat="server">
                <asp:ListItem Text="Any" Value=""></asp:ListItem>
                <asp:ListItem Text="Any" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="filter-container">
            <label for="StoreLocation">STORE'S LOCATION</label>
            <asp:DropDownList class="DD" ID="StoreLocationID" runat="server">
                <asp:ListItem Text="Any" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="price-filter-container">
            <label for="PriceRange">PRICE RANGE</label>
            <div class="price-range-container">
                <div class="price-range">
                    <asp:TextBox ID="MinPrice" runat="server" placeholder="Min" CssClass="Price"></asp:TextBox>
                    <div class="price-range-separator"></div>
                    <asp:TextBox ID="MaxPrice" runat="server" placeholder="Max" CssClass="Price"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="reset-filter-container">
            <asp:Button ID="ResetFilter" runat="server" Text="RESET FILTER" CssClass="reset-filter-btn" />
        </div>
    </div>

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
                                    <div>
                                        <p class="ProductName"><%# Eval("ProductName") %></p>
                                        <div class="ProductRating">
                                            <span class="basil--star-solid"></span>
                                            <p><%# Eval("ProductRatingValue") %></p>
                                            <p>(<%# Eval("ProductRatingCount") %>)</p>
                                        </div>
                                        <p class="ProductPrice"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("ProductPrice")) %></p>
                                    </div>

                                    <div>
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

</asp:Content>
