<%@ Page Title="" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="ShoppingCartPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.ShoppingCartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../styles/[paymentprocess]page_styles.css" rel="stylesheet" />
    <%--<link href="../Styles/ShoppingCart_Style.css" rel="stylesheet" />--%>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <nav class="Page-Path">
        <div>
            <a href="HomePage.aspx" class="NavText">Beranda</a>
            <p class="NavText">/</p>
            <p class="NavText">Keranjang</p>
        </div>
    </nav>



    <section>
        <div class="header">
            <p class="title">KERANJANG ANDA <span><%= cartItem.Count %> produk</span></p>
        </div>

        <div class="content">
            <div class="CardContainer">
                <asp:Repeater ID="CardRepeater" runat="server" OnItemDataBound="CardRepeater_ItemDataBound">
                    <ItemTemplate>
                        <div class="ProductCard">

                            <div class="ProductImageContainer">
                                <a href="ProductPage.aspx?ProductID=<%# Eval("Storage.Product.ProductID") %>">
                                    <img alt="" src="<%# SANTARA_Marketplace.Template.HeaderAndFooter.GetImageBase64String(Eval("Storage.Product.ProductThumbnail")) %>" />
                                </a>
                            </div>

                            <div class="ProductDescriptionContainer">
                                <div class="ProductDescription">
                                    <div class="desc-container">
                                        <a href="ProductPage.aspx?ProductID=<%# Eval("Storage.Product.ProductID") %>">
                                            <p class="ProductName"><%# Eval("Storage.Product.ProductName") %></p>
                                        </a>

                                        <p class="product-spec">Jenis Sepatu:  <%# Eval("Storage.Product.ProductType") %></p>
                                        <p class="product-spec">Warna:  <%# Eval("Storage.ProductColor") %></p>
                                        <p class="product-spec">Ukuran:  <%# Eval("Storage.ProductSize") %></p>
                                    </div>

                                    <div>
                                        <p class="ProductPrice"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("Storage.Product.ProductPrice")) %></p>
                                    </div>
                                </div>

                                <div class="quantityContainer">
                                    <div class="ShopName">
                                        <p class="product-spec" id="store"><%# Eval("Storage.Product.Store.StoreName") %></p>
                                    </div>
                                    <div class="quantity-func">
                                        <asp:Button ID="DeleteItemBtn" runat="server" CssClass="delete-button" Text="" OnClick="DeleteItemBtn_Click" CommandArgument='<%# Eval("CartID") %>' />
                                        <div class="quantity">
                                            <button type="button" class="minus-button" onclick="decreaseQuantityValue(this, '<%# Eval("CartID") %>')"></button>
                                            <asp:TextBox ID="QuantityTB" runat="server" CssClass="quantity-box"  OnDataBinding="quantity_DataBinding" ReadOnly="true"></asp:TextBox>
                                            <button type="button" class="plus-button" onclick="increaseQuantityValue(this, '<%# Eval("CartID") %>')"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="shopping-summary-container">
                <h1>- Ringkasan Belanja -</h1>
                <div class="shopping-summary">
                    <div class="summary-item">
                        <p class="summary-text"><%= cartItem.Count %> produk</p>
                    </div>
                    <asp:Repeater ID="TransactionRepeater" runat="server">
                        <ItemTemplate>
                            <div class="summary-item">
                                <div class="product-info">
                                    <p class="summary-text" id="summaryText<%# Eval("CartID") %>">
                                        <%# Eval("Storage.Product.ProductName") %>  (<span class="quantity-span"><%# Eval("Quantity") %></span> pcs)
                                    </p>
                                </div>
                                <p class="summary-text" id="itemTotal<%# Eval("StorageID") %>"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice((Convert.ToInt32(Eval("Storage.Product.ProductPrice")) * Convert.ToInt32(Eval("Quantity")))) %></p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="summary-item total">
                        <div>
                            <p class="summary-text total">TOTAL</p>
                        </div>
                        <asp:Label ID="TotalPriceLbl" runat="server" Text="" CssClass="summary-text total"></asp:Label>
                    </div>
                </div>
                <asp:Button ID="CheckOutBtn" runat="server" Text="CheckOut" CssClass="checkout" OnClick="CheckOutBtn_Click" />
            </div>
        </div>
    </section>

    <script>
        function decreaseQuantityValue(button, cartID) {
            var parentDiv = button.closest(".quantity");
            var quantityInput = parentDiv.querySelector('input[type="text"]');
            console.log(quantityInput);

            var currentQuantity = parseInt(quantityInput.value) || 0;

            if (currentQuantity > 1) {
                quantityInput.value = currentQuantity - 1;
            }

            var summaryTextElement = document.getElementById('summaryText' + cartID);
            if (summaryTextElement) {
                var quantitySpan = summaryTextElement.querySelector('.quantity-span');
                if (quantitySpan) {
                    quantitySpan.textContent = quantityInput.value;
                }
            }

            $.ajax({
                type: "POST",
                url: "ShoppingCartPage.aspx/SaveItemQuantity",
                data: JSON.stringify({ CartID: cartID, Qty: quantityInput.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log("Item quantity saved successfully.");
                },
                error: function (xhr, status, error) {
                    console.error("Error saving item quantity: " + error);
                }
            });
        }

        function increaseQuantityValue(button, cartID) {
            var parentDiv = button.closest(".quantity");
            var quantityInput = parentDiv.querySelector('input[type="text"]');

            var maxValue = parseInt(quantityInput.getAttribute('max'));
            var currentQuantity = parseInt(quantityInput.value) || 0;

            if (currentQuantity < maxValue) {
                quantityInput.value = currentQuantity + 1;
            }

            var summaryTextElement = document.getElementById('summaryText' + cartID);
            if (summaryTextElement) {
                var quantitySpan = summaryTextElement.querySelector('.quantity-span');
                if (quantitySpan) {
                    quantitySpan.textContent = quantityInput.value;
                }
            }

            $.ajax({
                type: "POST",
                url: "ShoppingCartPage.aspx/SaveItemQuantity",
                data: JSON.stringify({ CartID: cartID, Qty: quantityInput.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log("Item quantity saved successfully.");
                },
                error: function (xhr, status, error) {
                    console.error("Error saving item quantity: " + error);
                }
            });
        }
    </script>

</asp:Content>
