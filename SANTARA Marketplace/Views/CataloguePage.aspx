<%@ Page Title="" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="CataloguePage.aspx.cs" Inherits="SANTARA_Marketplace.Views.Catalogue_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Styles/CataloguePage_Styles.css" rel="stylesheet" />
    <link href="../Styles/ProductCard_Styles.css" rel="stylesheet" />

    <nav class="Page-Path">
        <div>
            <a href="HomePage.aspx" class="NavText">Beranda</a>
            <p class="NavText">></p>
            <p class="NavText">Katalog</p>
        </div>
    </nav>

    <svg class="flt_svg" xmlns="http://www.w3.org/2000/svg">
        <defs>
            <filter id="flt_tag">
                <feGaussianBlur in="SourceGraphic" stdDeviation="8" result="blur" />
                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 19 -9" result="flt_tag" />
                <feComposite in="SourceGraphic" in2="flt_tag" operator="atop" />
            </filter>
        </defs>
    </svg>

    <div class="content">
        <div class="product-category-content">
            <div class="category-header">
                <div class="category-name">
                    <h1>PRIA</h1>
                </div>
                <a>Lihat selengkapnya</a>
            </div>
            <div class="category-item">
                <asp:Repeater ID="CardRepeaterMan" runat="server">
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

        <div class="product-category-content">
            <div class="category-header">
                <div class="category-name">
                    <h1>WANITA</h1>
                </div>
                <a>Lihat selengkapnya</a>
            </div>
            <div class="category-item">
                <asp:Repeater ID="CardRepeaterWoman" runat="server">
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

        <div class="product-category-content">
            <div class="category-header">
                <div class="category-name">
                    <h1>ANAK-ANAK</h1>
                </div>
                <a>Lihat selengkapnya</a>
            </div>
            <div class="category-item">
                <asp:Repeater ID="CardRepeaterKid" runat="server">
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
