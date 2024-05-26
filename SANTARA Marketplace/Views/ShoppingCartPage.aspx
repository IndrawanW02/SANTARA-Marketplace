<%@ Page Title="" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="ShoppingCartPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.ShoppingCartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Styles/[PaymentProcess]Page_Styles.css" rel="stylesheet" />

    <h1>KERANJANG ANDA
        <p><%= cartItem.Count %> item</p>
    </h1>

    <section>
        <div class="CardContainer">
            <asp:Repeater ID="CardRepeater" runat="server">
                <ItemTemplate>
                    <div class="ProductCard">
                        <div class="ProductImageContainer">
                            <a href="ProductPage.aspx?ProductID=<%# Eval("Storage.Product.ProductID") %>">
                                <%--<img alt="" src="<%# SANTARA_Marketplace.Template.HeaderAndFooter.GetImageBase64String(Eval("ProductImage")) %>" />--%>
                            </a>
                        </div>

                        <div>
                            <div class="ProductDescriptionContainer">
                                <div>
                                    <a href="ProductPage.aspx?ProductID=<%# Eval("Storage.Product.ProductID") %>">
                                        <p class="ProductName"><%# Eval("Storage.Product.ProductName") %></p>
                                    </a>
                                    <p class="ProductPrice"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("Storage.Product.ProductPrice")) %></p>
                                </div>
                            </div>

                            <div>
                                <p class="product-spec">Jenis Sepatu:  <%# Eval("Storage.Product.ProductType") %></p>
                                <p class="product-spec">Warna:  <%# Eval("Storage.ProductColor") %></p>
                                <p class="product-spec">Ukuran:  <%# Eval("Storage.ProductSize") %></p>
                                <p class="product-spec">Toko:  <%# Eval("Storage.Product.Store.StoreName") %></p>
                            </div>
                            <div>
                                <span class="bi--trash3"></span>
                                <div>
                                    <asp:Button ID="minus" runat="server" Text="" CssClass="minus-button" OnClick="minus_Click" />
                                    <asp:TextBox ID="QuantityTB" runat="server" ReadOnly="true" OnDataBinding="quantity_DataBinding"></asp:TextBox>
                                    <asp:Button ID="plus" runat="server" Text="" CssClass="plus-button" OnClick="plus_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="shopping-summary-container">
            <h1>RINGKASAN BELANJA</h1>
            <div class="shopping-summary">
                <p><%= cartItem.Count %> Produk</p>
                <asp:Repeater ID="TransactionRepeater" runat="server">
                    <ItemTemplate>
                        <div>
                            <p><%# Eval("Storage.Product.ProductName") %></p>
                            <p>(<%# Eval("Quantity") %> pcs)</p>
                        </div>
                        <div>
                            <p><%# (Convert.ToInt32(Eval("Storage.Product.ProductPrice")) * Convert.ToInt32(Eval("Quantity"))) %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Label ID="TotalPriceLbl" runat="server" Text=""></asp:Label>
            </div>
            <asp:Button ID="CheckOutBtn" runat="server" Text="CheckOut" OnClick="CheckOutBtn_Click" />
        </div>
    </section>

</asp:Content>
