<%@ Page Title="" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="CataloguePage.aspx.cs" Inherits="SANTARA_Marketplace.Views.Catalogue_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link href="../Styles/CataloguePage_Styles.css" rel="stylesheet" />
    <link href="../Styles/ProductCard_Styles.css" rel="stylesheet" />

    <section>
        <nav class="Page-Path">
            <div>
                <a href="HomePage.aspx" class="NavText">Beranda</a>
                <p class="NavText">/</p>
                <p class="NavText">Katalog</p>
            </div>
        </nav>
    </section>

    <div class="content">
        <div class="MostPopular">
            <div class="best-seller-title">
                <h1>SEPATU PRIA</h1>
                <p>"Gaya dan kenyamanan dalam setiap langkah."</p>
            </div>

            <div class="popular-shoes">
                <div class="card-wrapper">
                    <a href="PriaProductPage.aspx" class="see-all">Lihat Selengkapnya</a>
                    <div class="swiper mySwiper" id="swiper2">
                        <div class="swiper-wrapper">
                            <asp:Repeater ID="CardRepeaterMan" runat="server">
                                <ItemTemplate>
                                    <div class="swiper-slide">
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
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="swiper-scrollbar"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="MostPopular">
            <div class="popular-shoes" id="women-shoes">
                <div class="card-wrapper" id="women-shoes-wrapper">
                    <a href="WanitaProductPage.aspx" class="see-all">Lihat Selengkapnya</a>
                    <div class="swiper mySwiper" id="women-shoes-swiper">
                        <div class="swiper-wrapper">
                            <asp:Repeater ID="CardRepeaterWoman" runat="server">
                                <ItemTemplate>
                                    <div class="swiper-slide">
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
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="swiper-scrollbar"></div>
                    </div>
                </div>
            </div>

            <div class="best-seller-title">
                <h1>SEPATU WANITA</h1>
                <p>"Elegan dan stylish untuk setiap kesempatan."</p>
            </div>
        </div>

        <div class="MostPopular">
            <div class="best-seller-title">
                <h1>SEPATU ANAK</h1>
                <p>"Nyaman dan aman untuk petualangan kecil mereka"</p>
            </div>

            <div class="popular-shoes">
                <div class="card-wrapper">
                    <a href="AnakProductPage.aspx" class="see-all">Lihat Selengkapnya</a>
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <asp:Repeater ID="CardRepeaterKid" runat="server">
                                <ItemTemplate>
                                    <div class="swiper-slide">
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
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="swiper-scrollbar"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swipers = new Swiper(".mySwiper", {
            direction: "horizontal",
            slidesPerView: "auto",
            freeMode: true,
            scrollbar: {
                el: ".swiper-scrollbar",
            },
            mousewheel: true,
        });
    </script>

</asp:Content>
