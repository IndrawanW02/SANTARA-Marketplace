<%@ Page Title="" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="CheckOutPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.CheckOutPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Styles/[PaymentProcess]Page_Styles.css" rel="stylesheet" />
    <%--<script src="../Script/Shipment.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

    <h1>< PENGIRIMAN</h1>

    <section>
        <div>
            <div class="shipment-address">
                <h1>Alamat Pengiriman</h1>
                <asp:TextBox ID="Address" runat="server" Enabled="false"></asp:TextBox>
                <asp:Button ID="ChangeAddress" runat="server" Text="Ubah Alamat" />
            </div>

            <div class="CardContainer">
                <asp:Repeater ID="CardRepeater" runat="server" OnItemDataBound="CardRepeater_ItemDataBound">
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
                                    <div>
                                        <p class="product-spec">Jenis Sepatu:  <%# Eval("Storage.Product.ProductType") %></p>
                                        <p class="product-spec">Warna:  <%# Eval("Storage.ProductColor") %></p>
                                        <p class="product-spec">Ukuran:  <%# Eval("Storage.ProductSize") %></p>
                                        <p class="product-spec">Toko:  <%# Eval("Storage.Product.Store.StoreName") %></p>
                                    </div>
                                </div>
                                <div>
                                    <div class="shipment-container">
                                        <div>
                                            <button type="button" data-method="JNT" data-price="<%# SetJNTPrice(Eval("Storage.Product.ProductPrice")) %>" onclick="setShipment(this)">
                                                <div>
                                                    <p>JNT</p>
                                                    <p><%# SetJNTPrice(Eval("Storage.Product.ProductPrice")) %></p>
                                                </div>
                                            </button>
                                            <button type="button" data-method="JNE" data-price="<%# SetJNEPrice(Eval("Storage.Product.ProductPrice")) %>" onclick="setShipment(this)">
                                                <div>
                                                    <p>JNE</p>
                                                    <p><%# SetJNEPrice(Eval("Storage.Product.ProductPrice")) %></p>
                                                </div>
                                            </button>
                                            <button type="button" data-method="Si Cepat" data-price="<%# SetSiCepatPrice(Eval("Storage.Product.ProductPrice")) %>" onclick="setShipment(this)">
                                                <div>
                                                    <p>SiCepat</p>
                                                    <p><%# SetSiCepatPrice(Eval("Storage.Product.ProductPrice")) %></p>
                                                </div>
                                            </button>
                                        </div>
                                        <asp:Label ID="ShipmentErrLbl" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:HiddenField ID="hfShipmentMethod" runat="server" Value=""/>
                                        <asp:HiddenField ID="hfShipmentPrice" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>


        <div class="shopping-summary-container">
            <h1>RINGKASAN BELANJA</h1>
            <div class="shopping-summary">
                <p><%# cartItem.Count %> Produk</p>
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
                <asp:Label ID="TotalShipmentPriceLbl" runat="server" Text="a"></asp:Label>
                <asp:Label ID="TotalPriceLbl" runat="server" Text=""></asp:Label>
            </div>
            <asp:Button ID="ChoosePaymentBtn" runat="server" Text="PILIH PEMBAYARAN" CssClass="open-modal-button"/>
        </div>

        <div class="modal" id="modal">
            <button data-close-modal class="close-button">&times;</button>
            <div class="modal-header">
                <div class="title">Metode Pembayaran</div>
            </div>
            <div class="payment-option">
                <button type="button">
                    <p>Saldo Santara.</p>
                    <asp:Label ID="SaldoUser" runat="server" Text=""></asp:Label>
                </button>
            </div>
        </div>

        <div id="overlay"></div>
        <asp:HiddenField ID="hfTriggerPostback" runat="server"/>

    </section>
    <script>
        document.getElementById('<%= ChoosePaymentBtn.ClientID %>').addEventListener("click", function (event) {
            event.preventDefault();
        });

        // Pop-Up
        document.addEventListener("DOMContentLoaded", function () {
            console.log("JavaScript terhubung dan DOM telah dimuat.");

            const openModalButtons = document.querySelectorAll('.open-modal-button');
            console.log("openModalButtons:", openModalButtons);

            const closeModalButtons = document.querySelectorAll('[data-close-modal]');
            console.log("closeModalButtons:", closeModalButtons);

            const overlay = document.getElementById('overlay');

            closeModalButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const modal = button.closest('.modal');
                    console.log("closeModalButtons:", modal);

                    closeModal(modal);
                });
            });

            openModalButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const modal = document.querySelector(button.getAttribute('data-modal-target'));
                    console.log("openModalButtons:", modal);

                    openModal(modal);
                });
            });


            function openModal(modal) {
                if (modal == null) return;
                console.log('Opening modal:', modal); // Debug line


                modal.classList.add('active');
                overlay.classList.add('active');
                console.log('Modal classes:', modal.classList); // Debug line
            }

            function closeModal(modal) {
                if (modal == null) return;
                modal.classList.remove('active');
                overlay.classList.remove('active');
            }
        });

        function setShipment(button) {
            var method = button.dataset.method;
            var price = button.dataset.price;

            console.log(method);
            console.log(price);

            var parentDiv = button.closest(".shipment-container");
            var allHiddenFields = parentDiv.querySelectorAll('input[type="hidden"]');

            var hfShipmentMethod = null;
            var hfShipmentPrice = null;

            allHiddenFields.forEach(function (field) {
                if (field.id.includes("hfShipmentMethod")) {
                    hfShipmentMethod = field;
                } else if (field.id.includes("hfShipmentPrice")) {
                    hfShipmentPrice = field;
                }
            });

            console.log(hfShipmentMethod);
            console.log(hfShipmentPrice);

            hfShipmentMethod.value = method;
            hfShipmentPrice.value = price;

            calculateShipmentTotal(button);
        }

        function calculateShipmentTotal(button) {
            var repeaterItems = button.closest(".CardContainer")
            var allShipmentPrice = repeaterItems.querySelectorAll('input[type="hidden"]');

            console.log(repeaterItems);
            console.log(allShipmentPrice);

            var totalShipmentPrice = 0;
            allShipmentPrice.forEach(function (item) {
                if (item.id.includes("hfShipmentPrice")) {
                    var itemPrice = parseInt(item.value);
                    if (isNaN(itemPrice)) {
                        console.log("NANNNN");
                    }
                    else {
                        totalShipmentPrice += itemPrice;
                    }
                }
            });

            var totalShipmentLabel = document.getElementById('<%= TotalShipmentPriceLbl.ClientID %>')
            totalShipmentLabel.textContent = totalShipmentPrice;

            $.ajax({
                type: "POST",
                url: "CheckOutPage.aspx/SaveTotalShipmentPrice",
                data: JSON.stringify({ totalShipmentPrice: totalShipmentPrice }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    updateTotalExpensesLabel();
                },
                error: function (xhr, status, error) {
                    console.error("Error saving Total Shipment Price: " + error);
                }
            });
        }

        function updateTotalExpensesLabel() {
            $.ajax({
                type: "POST",
                url: "CheckOutPage.aspx/GetTotalPrice",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var totalPrice = response.d;
                    console.log(totalPrice);
                    var totalPriceLabel = document.getElementById('<%= TotalPriceLbl.ClientID %>');
                    totalPriceLabel.textContent = totalPrice;
                },
                error: function (xhr, status, error) {
                    console.error("Error: " + error);
                }
            });
        }

    </script>

</asp:Content>
