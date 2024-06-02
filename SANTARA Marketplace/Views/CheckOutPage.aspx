<%@ Page Title="" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="CheckOutPage.aspx.cs" Inherits="SANTARA_Marketplace.Views.CheckOutPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Styles/[PaymentProcess]Page_Styles.css" rel="stylesheet" />
    <%--<script src="../Script/Shipment.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <section>
        <div class="header">
            <p class="title">< PENGIRIMAN</p>
        </div>

        <div class="content">
            <div class="CardContainer">

                <div class="shipment-address">
                    <div class="shipment-detail">
                        <h1>Alamat Pengiriman</h1>
                        <asp:TextBox ID="AddressBox" runat="server" CssClass="address-box" TextMode="MultiLine" Rows="1" Enabled="false">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</asp:TextBox>
                    </div>
                    <asp:Button ID="ChangeAddress" runat="server" CssClass="change-address" Text="ubah alamat" />
                </div>

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
                                        <p class="product-spec" id="store"><%# Eval("Storage.Product.Store.StoreName") %></p>
                                    </div>

                                    <div>
                                        <p class="ProductPrice"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("Storage.Product.ProductPrice")) %></p>
                                    </div>
                                </div>

                                <div>
                                    <div class="shipment-container">
                                        <div class="dropdown">

                                            <div class="select">
                                                <asp:Literal ID="ShipmentOptionLiteral" runat="server"><span>Pilih Kurir Pengiriman</span></asp:Literal>
                                            </div>

                                            <ul class="dropdown-menu">
                                                <li id="J&T" data-method="JNT" data-price="<%# SetJNTPrice(Eval("Storage.Product.ProductPrice")) %>">
                                                    <div class="option-info">
                                                        <div class="shipment-info">
                                                            <div class="shipment-logo-wrapper">
                                                                <img class="shipment-logo" src="../Assets/Images/J&T-logo.png" />
                                                            </div>
                                                            <p>J&T</p>
                                                        </div>
                                                        <p class="shipment-price"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(SetJNTPrice(Eval("Storage.Product.ProductPrice"))) %></p>
                                                    </div>
                                                </li>
                                                <li id="JNE" data-method="JNE" data-price="<%# SetJNEPrice(Eval("Storage.Product.ProductPrice")) %>">
                                                    <div class="option-info">
                                                        <div class="shipment-info">
                                                            <div class="shipment-logo-wrapper">
                                                                <img class="shipment-logo" src="../Assets/Images/JNE-logo.png" />
                                                            </div>
                                                            <p>JNE</p>
                                                        </div>
                                                        <p class="shipment-price"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(SetJNEPrice(Eval("Storage.Product.ProductPrice"))) %></p>
                                                    </div>
                                                </li>
                                                <li id="SiCepat" data-method="Si Cepat" data-price="<%# SetSiCepatPrice(Eval("Storage.Product.ProductPrice")) %>">
                                                    <div class="option-info">
                                                        <div class="shipment-info">
                                                            <div class="shipment-logo-wrapper">
                                                                <img class="shipment-logo" src="../Assets/Images/SiCepat-logo.png" />
                                                            </div>
                                                            <p>SiCepat</p>
                                                        </div>
                                                        <p class="shipment-price"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(SetSiCepatPrice(Eval("Storage.Product.ProductPrice"))) %></p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <asp:Label ID="ShipmentErrLbl" runat="server" Text="" CssClass="err-label" Visible="false"></asp:Label>
                                        <asp:HiddenField ID="hfShipmentMethod" runat="server" EnableViewState="true" />
                                        <asp:HiddenField ID="hfShipmentPrice" runat="server" EnableViewState="true" />
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

                    <div class="summary-item">
                        <div class="product-info">
                            <p class="summary-text">Total Biaya Pengiriman</p>
                        </div>
                        <asp:Label ID="TotalShipmentPriceLbl" runat="server" Text="Rp0" class="summary-text"></asp:Label>
                    </div>
                    <div class="summary-item total">
                        <div>
                            <p class="summary-text total">TOTAL</p>
                        </div>
                        <asp:Label ID="TotalPriceLbl" runat="server" Text="" CssClass="summary-text total"></asp:Label>
                    </div>
                </div>
                <asp:Button ID="ChoosePaymentBtn" runat="server" Text="PILIH PEMBAYARAN" CssClass="choose-payment" OnClick="ChoosePaymentBtn_Click" />
            </div>
        </div>

        <div class="modal" id="modal">
            <div class="modal-header">
                <button data-close-modal class="close-button">&times;</button>
                <div class="modal-title">Metode Pembayaran</div>
            </div>
            <div class="payment-option">
                <div class="payment-type">
                    <h1>Kartu Kredit</h1>
                    <asp:LinkButton Visible="true" ID="CreditCard" runat="server" CssClass="test" OnClick="LinkButton_Click">
                        <div class="pay-option">
                            <div class="payment-desc">
                                <div class="payment-logo"><span class="f7--creditcard"></span></div>
                                <p class="pay-option-name">Credit Card</p>
                            </div>
                            <asp:Label ID="CClbl" runat="server" Text="Tidak tersedia" CssClass="pay-status"></asp:Label>
                        </div>
                    </asp:LinkButton>
                </div>

                <div class="payment-type">
                    <h1>Bank Virtual</h1>
                    <asp:LinkButton Visible="true" ID="BCA" runat="server" CssClass="" OnClick="LinkButton_Click">
                        <div class="pay-option">
                            <div class="payment-desc">
                                <div class="payment-logo">
                                    <img src="../Assets/Images/BCA-logo.png" />
                                </div>
                                <p class="pay-option-name">BCA Virtual Account</p>
                            </div>
                            <asp:Label ID="BCAlbl" runat="server" Text="Tidak tersedia" CssClass="pay-status"></asp:Label>
                        </div>
                    </asp:LinkButton>
                    <asp:LinkButton Visible="true" ID="BRI" runat="server" CssClass="" OnClick="LinkButton_Click">
                        <div class="pay-option">
                            <div class="payment-desc">
                                <div class="payment-logo">
                                    <img src="../Assets/Images/BRI-logo.png" />
                                </div>
                                <p class="pay-option-name">BRI Virtual Account</p>
                            </div>
                            <asp:Label ID="BRIlbl" runat="server" Text="Tidak tersedia" CssClass="pay-status"></asp:Label>
                        </div>
                    </asp:LinkButton>
                </div>

                <div class="payment-type">
                    <h1>SANTARA Pay.</h1>
                    <asp:LinkButton Visible="true" ID="SantaraPay" runat="server" CssClass="" OnClick="LinkButton_Click">
                        <div class="pay-option" id="last">
                            <div class="payment-desc">
                                <div class="payment-logo"><span class="fa-solid--coins"></span></div>
                                <p class="pay-option-name">Saldo</p>
                            </div>
                            <asp:Label ID="SaldoUser" runat="server" Text="" CssClass="pay-status" ></asp:Label>
                        </div>
                    </asp:LinkButton>
                </div>

                <div class="payment-err">
                    <asp:Label ID="PaymentErr" runat="server" Text="" CssClass="payment-error"></asp:Label>
                </div>

                <asp:HiddenField ID="BalanceCheck" runat="server" />
            </div>
        </div>

        <div id="overlay"></div>
        <asp:HiddenField ID="hfTriggerPostback" runat="server" />

    </section>
    <script>
        function enablePopUp() {
            console.log("JavaScript terhubung dan DOM telah dimuat.");

            const openModalButtons = document.querySelectorAll('.open-modal-button');
            const closeModalButtons = document.querySelectorAll('[data-close-modal]');
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
                modal.classList.add('active');
                overlay.classList.add('active');
            }

            function closeModal(modal) {
                if (modal == null) return;
                modal.classList.remove('active');
                overlay.classList.remove('active');
            }
        }

        function openModalFromCodeBehind() {
            const openModalButtons = document.querySelectorAll('.choose-payment');
            const modalButton = openModalButtons[0];
            const modal = document.querySelector(modalButton.getAttribute('data-modal-target'));

            modal.classList.add('active');
            overlay.classList.add('active');
        }

        function closeModalFromCodeBehind() {
            modal.classList.remove('active');
            overlay.classList.remove('active');
        }

        function setShipment(li) {
            var method = li.dataset.method;
            var price = li.dataset.price;

            var parentDiv = li.closest(".shipment-container");
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

            hfShipmentMethod.value = method;
            hfShipmentPrice.value = price;

            calculateShipmentTotal(li);
        }

        function calculateShipmentTotal(li) {
            var repeaterItems = li.closest(".CardContainer")
            var allShipmentPrice = repeaterItems.querySelectorAll('input[type="hidden"]');

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


            $.ajax({
                type: "POST",
                url: "CheckOutPage.aspx/IdrPrice",
                data: JSON.stringify({ price: totalShipmentPrice }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var totalShipmentLabel = document.getElementById('<%= TotalShipmentPriceLbl.ClientID %>');
                    totalShipmentLabel.textContent = response.d;
                },
                error: function (xhr, status, error) {
                    console.error("Error Print Shipment Price: " + error);
                }
            });

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

        function IsBalanceEnough() {
            $.ajax({
                type: "POST",
                url: "CheckOutPage.aspx/IsBalanceEnough",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == true) {
                        document.getElementById('<%= BalanceCheck.ClientID %>').value = 'true';
                    }
                    else {
                        var payment = document.getElementById('<%= PaymentErr.ClientID %>');
                        document.getElementById('<%= BalanceCheck.ClientID %>').value = 'false';
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error: " + error);
                }
            });
        }
    </script>

    <script>
        $('.dropdown').click(function () {
            $(this).attr('tabindex', 1).focus();
            $(this).toggleClass('active');
            $(this).find('.dropdown-menu').slideToggle(200);
        });
        $('.dropdown').focusout(function () {
            $(this).removeClass('active');
            $(this).find('.dropdown-menu').slideUp(200);
        });
        $('.dropdown .dropdown-menu li').click(function () {
            $(this).parents('.dropdown').find('span').text($(this).text());
            setShipment(this);
        });
    </script>

</asp:Content>
