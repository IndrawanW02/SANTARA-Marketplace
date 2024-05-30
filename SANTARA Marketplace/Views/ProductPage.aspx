<%@ Page Title="SANTARA" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.ProductPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Script/ImageSlider.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link href="../Styles/ProductPage_Style.css" rel="stylesheet" />

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

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
                    <div class="product-main-info">
                        <p><%# product.ProductName %></p>
                        <div class="product-rating">
                            <span class="basil--star-solid"></span>
                            <span class="basil--star-solid"></span>
                            <span class="basil--star-solid"></span>
                            <span class="basil--star-solid"></span>
                            <span class="basil--star-solid"></span>
                            <p><%# product.ProductRatingValue %></p>
                        </div>
                        <p><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(product.ProductPrice) %></p>
                    </div>

                    <div class="separator"></div>

                    <div class="color-container">
                        <label for="chooseColor">PILIH WARNA</label>
                        <asp:DropDownList class="DD" ID="ChooseColor" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChooseColor_SelectedIndexChanged">
                            <asp:ListItem ID="colorItem" Text="Warna" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="ChooseColorErr" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                    </div>

                    <div class="size-container">
                        <label for="chooseColor">PILIH WARNA</label>
                        <asp:DropDownList class="DD" ID="ChooseSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChooseSize_SelectedIndexChanged">
                            <asp:ListItem ID="sizeItem" Text="Ukuran" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="ChooseSizeErr" runat="server" Text="" ForeColor="#c21815"></asp:Label>
                    </div>

                    <div>
                        <p>
                            STOK :
                        <asp:Label ID="stock" runat="server" Text="" ForeColor="#DB2B27"></asp:Label>
                        </p>
                    </div>

                    <div>
                        <asp:Button ID="AddToCard" runat="server" Text="TAMBAH KE KERANJANG +" OnClick="AddToCard_Click" />
                    </div>
                    <div>
                        <asp:Button ID="BuyNow" runat="server" Text="BELI SEKARANG" OnClick="BuyNow_Click" />
                    </div>
                </div>
            </div>
        </div>

        <div class="separator"></div>

        <div class="product-description-container">
            <div class="product-description">
                <p>Deskripsi Sepatu</p>
                <p><%# product.ProductDescription %></p>
            </div>

            <div class="product-store">
                <div class="store-image-name">
                    <img />
                    <p><%# product.Store.StoreName %></p>
                </div>
                <p>
                    Jalan <%# product.Store.Address.StreetName %>, RT0<%# product.Store.Address.GroupNeighborhoodAssociation %> 
                    RW0<%# product.Store.Address.GroupCitizenAssociation %>,
                </p>
                <p>Kelurahan <%# product.Store.Address.Subdistrict %>, Kecamatan <%# product.Store.Address.District %>, Kota <%# product.Store.Address.City %></p>
                <p><%# product.Store.Address.Province %>, <%# product.Store.Address.PostalCode %></p>
            </div>
        </div>

        <div class="separator"></div>

        <div class="product-rating-container">
            <div class="overall-rating">
                <p>RATING</p>
                <div>
                    <p><%# product.ProductRatingValue %></p>
                    <p>/ 5 bintang</p>
                    <div class="star-rating">
                        <span class="basil--star-solid"></span>
                        <span class="basil--star-solid"></span>
                        <span class="basil--star-solid"></span>
                        <span class="basil--star-solid"></span>
                        <span class="basil--star-solid"></span>
                    </div>
                </div>
                <p>Penilaian keseluruhan dari <%# product.ProductRatingCount %> ulasan</p>
            </div>

            <div class="customer-review">
                <p>Ulasan Pembeli</p>
                <asp:Repeater ID="ReviewRepeater" runat="server">
                    <ItemTemplate>
                        <div class="Review">
                            <span class="basil--star-solid"></span>
                            <p><%# Eval("RatingValue") %> out of 5 stars</p>
                            <img alt="" src="<%# SANTARA_Marketplace.Template.HeaderAndFooter.GetImageBase64String(Eval("User.UserProfilePic")) %>" />
                            <p><%# Eval("User.Username") %>  <%# Eval("CreatedAt", "{0:dd MMMM yyyy}") %></p>
                            <p><%# Eval("Storage.ProductColor") %>, <%# Eval("Storage.ProductSize") %></p>
                            <p><%# Eval("RatingDescription") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
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
</asp:Content>
