<%@ Page Title="SANTARA" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="SANTARA_Marketplace.Views.Home_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link href="../Styles/HomePage_Styles.css" rel="stylesheet" />
    <link href="../Styles/ProductCard_Styles.css" rel="stylesheet" />

    <div class="Container">
        <div class="Content">
            <div class="swiper mySwiper" id="swiper1">
                <div class="swiper-wrapper">
                    <asp:Repeater ID="AdvertisementRepeater" runat="server">
                        <ItemTemplate>
                            <div class="swiper-slide">
                                <a href="ProductPage.aspx?ProductID=<%# Eval("ProductID") %>">
                                    <img alt="" src="<%# SANTARA_Marketplace.Template.HeaderAndFooter.GetImageBase64String(Eval("AdvertisementImage")) %>" />
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="swiper-slide space">
                        <p>SPACE AVAILABLE</p>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>

            <div class="MostPopular">
                <div class="best-seller-title">
                    <h1>BEST SELLER</h1>
                    <p>Dapatkan tampilan yang tak tertandingi dengan sepatu favorit pelanggan kami - kembangkan gaya Anda dengan koleksi terbaik.</p>
                </div>

                <div class="popular-shoes">
                    <%-- card-wrapper --%>
                    <div class="card-wrapper">
                        <div class="swiper mySwiper" id="swiper2">
                            <%-- cardContainer --%>
                            <div class="swiper-wrapper">
                                <asp:Repeater ID="CardRepeater" runat="server">
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

            <div class="category-container">
                <h1>CATEGORIES</h1>

                <div class="categories">
                    <div class="category-wrapper" id="man-wrapper">
                        <a href="ManProductPage.aspx">
                            <div class="category-card">
                                <div class="category-logo">
                                    <img src="../Assets/Icons/ManIcon.png" />
                                </div>
                                <div class="category-product-info">
                                    <p class="title">Sepatu Pria</p>
                                    <p><%# manProductCount %> Produk</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="category-wrapper" id="woman-wrapper">
                        <a href="WomanProductPage.aspx">
                            <div class="category-card">
                                <div class="category-logo">
                                    <img src="../Assets/Icons/WomanIcon.png" />
                                </div>
                                <div class="category-product-info">
                                    <p class="title">Sepatu Wanita</p>
                                    <p><%# womanProductCount%> Produk</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="category-wrapper" id="kid-wrapper">
                        <a href="KidProductPage.aspx">
                            <div class="category-card">
                                <div class="category-logo">
                                    <img src="../Assets/Icons/KidIcon.png" />
                                </div>
                                <div class="category-product-info">
                                    <p class="title">Sepatu Anak-Anak</p>
                                    <p><%# kidProductCount %> Produk</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <asp:Label ID="Label1" runat="server" Text="BrowseImage" Visible="false"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"  Visible="false"></asp:TextBox>
    <asp:FileUpload ID="FileUpload1" runat="server"  Visible="false" />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" Visible="false" />



    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper("#swiper1", {
            effect: "coverflow",
            grabCursor: true,
            centeredSlides: true,
            loop: true,
            slidesPerView: "auto",
            coverflowEffect: {
                rotate: 0,
                stretch: 80,
                depth: 350,
                modifier: 1,
                slideShadows: true,
            },
            pagination: {
                el: "#swiper1 .swiper-pagination",
                clickable: true,
            },
            autoplay: {
                delay: 7000,
                disableOnInteraction: false,
            },
        });
    </script>

    <script>
        var swipers = new Swiper("#swiper2", {
            direction: "horizontal",
            slidesPerView: "auto",
            freeMode: true,
            scrollbar: {
                el: "#swiper2 .swiper-scrollbar",
            },
            mousewheel: true,
        });
    </script>


</asp:Content>
