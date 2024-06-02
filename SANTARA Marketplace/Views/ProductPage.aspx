<%@ Page Title="SANTARA" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.ProductPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Script/ImageSlider.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link href="../Styles/ProductPage_Style.css" rel="stylesheet" />

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <nav class="Page-Path">
        <div>
            <a href="HomePage.aspx" class="NavText">Beranda</a>
            <p class="NavText">/</p>
            <a href="CataloguePage.aspx" class="NavText">Katalog</a>
            <p class="NavText">/</p>
            <a id="productPageNav" runat="server" class="NavText">Sepatu <%# product.ProductCategory%></a>
            <p class="NavText">/</p>
            <p class="NavText"><%# product.ProductName %></p>
        </div>
    </nav>

    <section>
        <div class="product-card">
            <div class="swiper mySwiper" onload="InitializeSwiper">
                <div class="swiper-wrapper">
                    <asp:Repeater ID="ImageRepeater" runat="server">
                        <ItemTemplate>
                            <div class="swiper-slide">
                                <img alt="" src="<%# SANTARA_Marketplace.Template.HeaderAndFooter.GetImageBase64String(Eval("Image")) %>" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>

            <div class="product-specification-container">
                <div class="product-specification">
                    <div class="info-top">
                        <div class="product-main-info">
                            <p class="product-name"><%# product.ProductName.ToUpper() %></p>
                            <div class="product-rating">
                                <span class="basil--star-solid"></span>
                                <span class="basil--star-solid"></span>
                                <span class="basil--star-solid"></span>
                                <span class="basil--star-solid"></span>
                                <span class="basil--star-solid"></span>
                                <p class="rating-value"><%# product.ProductRatingValue %></p>
                                <p class="rating-value">(<%# product.ProductRatingCount %> Reviews)</p>
                            </div>
                            <p class="product-price"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(product.ProductPrice) %></p>
                        </div>

                        <div class="separator"></div>

                        <div class="option-container">
                            <div class="color-container">
                                <label for="chooseColor" class="choice-header">PILIH WARNA</label>
                                <asp:DropDownList class="DD" ID="ChooseColor" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChooseColor_SelectedIndexChanged">
                                    <asp:ListItem ID="colorItem" Text="Warna" Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="ChooseColorErr" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                            </div>

                            <div class="size-container">
                                <label for="chooseColor" class="choice-header">PILIH WARNA</label>
                                <asp:DropDownList class="DD" ID="ChooseSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChooseSize_SelectedIndexChanged">
                                    <asp:ListItem ID="sizeItem" Text="Ukuran" Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="ChooseSizeErr" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="additional-info">
                        <div class="stock-info">
                            <p class="stock-label">STOK :</p>
                            <asp:Label ID="stock" CssClass="stock-label" runat="server" Text="" ForeColor="#DB2B27"></asp:Label>
                        </div>

                        <div>
                            <asp:Button ID="AddToCart" CssClass="add-to-cart-button" runat="server" Text="TAMBAH KE KERANJANG &#43;" OnClick="AddToCard_Click" />
                        </div>
                        <div>
                            <asp:Button ID="BuyNow" CssClass="buy-now-button" runat="server" Text="BELI SEKARANG" OnClick="BuyNow_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--<div class="separator" id="separator2"></div>--%>

        <div class="product-description-container">
            <div class="product-description">
                <p class="description-header"><%# (product.ProductName).ToUpper() %></p>
                <p class="description-subtext"><%# product.ProductDescription %></p>
            </div>

            <div class="product-store">
                <div class="store-image-name">
                    <p class="store-name"><%# product.Store.StoreName %></p>
                </div>
                <p class="store-address">
                    Jalan <%# product.Store.Address.StreetName %>, RT0<%# product.Store.Address.GroupNeighborhoodAssociation %> 
                    RW0<%# product.Store.Address.GroupCitizenAssociation %>,
                </p>
                <p class="store-address">Kelurahan <%# product.Store.Address.Subdistrict %>, Kecamatan <%# product.Store.Address.District %>, Kota <%# product.Store.Address.City %></p>
                <p class="store-address"><%# product.Store.Address.Province %>, <%# product.Store.Address.PostalCode %></p>
            </div>
        </div>

        <%--<div class="separator" id="separator3"></div>--%>

        <div class="product-rating-container">
            <div class="overall-rating">
                <p class="rating-header">RATING</p>
                <div class="rating-container">
                    <p class="rating"><%# product.ProductRatingValue %></p>
                    <p class="rating-template">/ 5</p>
                    <div class="star-rating">
                        <span class="basil--star-solid"></span>
                        <span class="basil--star-solid"></span>
                        <span class="basil--star-solid"></span>
                        <span class="basil--star-solid"></span>
                        <span class="basil--star-solid"></span>
                    </div>
                </div>
                <p class="rating-template">Penilaian keseluruhan dari <%# product.ProductRatingCount %> ulasan</p>
            </div>

            <div class="customer-review">
                <p class="review-header">Ulasan Pembeli<span><%# product.ProductRatingCount %> ulasan</span></p>
                <div>
                    <asp:Repeater ID="ReviewRepeater" runat="server">
                        <ItemTemplate>
                            <div class="Review">
                                <div class="user-rating">
                                    <span class="basil--star-solid"></span>
                                    <p><%# Eval("RatingValue") %> <span>out of 5 stars</span></p>
                                </div>
                                <div class="user-profile">
                                    <div class="user-transaction">
                                        <div class="user-profile-wrapper">
                                            <img alt="user_profile" src="<%# SANTARA_Marketplace.Template.HeaderAndFooter.GetImageBase64String(Eval("User.UserProfilePic")) %>" />
                                        </div>
                                        <p><%# Eval("User.Username") %>,  <span><%# Eval("CreatedAt", "{0:dd MMMM yyyy}") %></span></p>
                                    </div>
                                    <p><%# Eval("Storage.ProductColor") %>, <%# Eval("Storage.ProductSize") %></p>
                                </div>
                                <div class="user-review">
                                    <p><%# Eval("RatingDescription") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

        </div>

    </section>


    <script>
        var swiper = new Swiper(".mySwiper", {
            spaceBetween: 30,
            effect: "fade",
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
        });
    </script>

    <script>
        function disableButton() {
            var addToCart = document.getElementById('<%= AddToCart.ClientID %>');
            var buyNow = document.getElementById('<%= BuyNow.ClientID %>');
            addToCart.classList.add('disabled');
            buyNow.classList.add('disabled');
        }
    </script>
</asp:Content>
