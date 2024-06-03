<%@ Page Title="" Language="C#" MasterPageFile="~/Template/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="TransactionHistory.aspx.cs" Inherits="SANTARA_Marketplace.Views.TransactionHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Styles/TransactionHistory_Styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <nav class="Page-Path">
        <div>
            <a href="HomePage.aspx" class="NavText">Beranda</a>
            <p class="NavText">/</p>
            <p class="NavText">Transaksi</p>
        </div>
    </nav>

    <section>
        <asp:Repeater ID="TransactionHistoryRepeater" runat="server" OnItemDataBound="TransactionHistoryRepeater_ItemDataBound">
            <ItemTemplate>
                <div class="transaction-card">
                    <div class="transaction-header">
                        <h1><%# Eval("CreatedAt", "{0:dd MMM yyyy}") %></h1>
                        <asp:Label ID="TransactionItemCount" runat="server" Text="" CssClass="item-count-label"></asp:Label>
                        <asp:Label ID="StatusLabel" runat="server" Text="" CssClass="status-label"></asp:Label>
                    </div>

                    <div class="transaction-content">
                        <div class="transaction-items">
                            <asp:HiddenField ID="TransactionID" runat="server" Value='<%# Eval("TransactionID") %>' />
                            <asp:Repeater ID="TransactionItemRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="product-card">
                                        <div class="product-image">
                                            <a href="ProductPage.aspx?ProductID=<%# Eval("Storage.Product.ProductID") %>">
                                                <img alt="" src="<%# SANTARA_Marketplace.Template.HeaderAndFooter.GetImageBase64String(Eval("Storage.Product.ProductThumbnail")) %>" />
                                            </a>
                                        </div>

                                        <div class="product-transaction-detail">
                                            <div class="product-info">
                                                <div class="product-info-header">
                                                    <a href="ProductPage.aspx?ProductID=<%# Eval("Storage.Product.ProductID") %>">
                                                        <p class="product-name"><%# Eval("Storage.Product.ProductName") %></p>
                                                    </a>
                                                    <div class="product-quantity-price">
                                                        <p class="product-quantity"><%# Eval("Quantity") %> x</p>
                                                        <p class="product-price"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("Storage.Product.ProductPrice")) %></p>
                                                    </div>
                                                </div>

                                                <div>
                                                    <p class="product-spec">Jenis Sepatu:  <%# Eval("Storage.Product.ProductType") %></p>
                                                    <p class="product-spec">Warna:  <%# Eval("Storage.ProductColor") %></p>
                                                    <p class="product-spec">Ukuran:  <%# Eval("Storage.ProductSize") %></p>
                                                </div>
                                            </div>

                                            <div class="manufacturer-info">
                                                <p class="product-spec"><%# Eval("Storage.Product.Store.StoreName") %></p>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div class="transaction-total-spent">
                            <div class="transaction-total">
                                <p>Total Belanja</p>
                                <h1><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("TotalTransaction")) %></h1>
                            </div>
                            <button type="button" data-modal-target="#modal" class="transaction-detail-button" onclick="openTransactionDetail(this);">
                                <p>Lihat Detail Transaksi</p>
                            </button>
                        </div>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:HiddenField ID="SelectedTransaction" runat="server" />

        <div class="transaction-detail-popup" id="modal">
            <div class="popup-header">
                <div class="popup-title">Detail Transaksi</div>
                <button data-close-modal class="close-button">&times;</button>
            </div>

            <div class="popup-content">
                <asp:FormView ID="TransactionFV" runat="server" ItemType="SANTARA_Marketplace.Model.Transaction" OnDataBound="TransactionFV_DataBound">
                    <ItemTemplate>
                        <div class="detail-header">
                            <div class="detail-status">
                                <p>Status Pemesanan</p>
                                <p id="see-detail">Lihat Detail <span class="fe--arrow-right"></span></p>
                            </div>

                            <div class="detail-date">
                                <p>Tanggal Pemesanan</p>
                                <p><%# String.Format("{0:dd MMMM yyyy, HH:mm}", Eval("CreatedAt")) %></p>
                            </div>

                        </div>

                        <div class="shipment-info">
                            <p id="header">Info Pengiriman Barang</p>

                            <div class="detail-info" id="address">
                                <p class="info-format">Alamat</p>
                                <p id="address-info"><%# Eval("DestinationAddress") %></p>
                            </div>

                            <div>
                                <asp:Repeater ID="DetailRepeater1" runat="server" OnItemDataBound="DetailRepeater1_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="product-bought">
                                            <div class="detail-info">
                                                <p class="info-format">No. Transaksi</p>
                                                <p><%# Eval("ReceiptNumber") %></p>
                                            </div>

                                            <div class="detail-info">
                                                <p class="info-format">Kurir</p>
                                                <p><%# Eval("ShipmentMethod") %></p>
                                            </div>

                                            <div class="detail-info">
                                                <p class="info-format">Toko</p>
                                                <p><%# Eval("Storage.Product.Store.StoreName") %></p>
                                            </div>

                                            <div id="product-detail">
                                                <div class="image-container">
                                                    <a href="ProductPage.aspx?ProductID=<%# Eval("Storage.Product.ProductID") %>">
                                                        <img alt="" src="<%# SANTARA_Marketplace.Template.HeaderAndFooter.GetImageBase64String(Eval("Storage.Product.ProductThumbnail")) %>" />
                                                    </a>
                                                </div>

                                                <div class="product-detail">
                                                    <div id="product-data">
                                                        <a href="ProductPage.aspx?ProductID=<%# Eval("Storage.Product.ProductID") %>">
                                                            <p class="product-name"><%# Eval("Storage.Product.ProductName") %></p>
                                                        </a>
                                                        <p class="product-quantity"><%# Eval("Quantity") %> x <%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("Storage.Product.ProductPrice")) %></p>
                                                    </div>
                                                    <div>
                                                        <asp:Label ID="StatusLbl" runat="server" Text='<%# Eval("Status") %>' CssClass="status-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                        <div class="payment-detail">
                            <div id="header2">
                                <p id="header-title">Rincian Pembayaran</p>
                                <div class="detail-payment">
                                    <p >Metode Pembayaran</p>
                                    <p><%# Eval("PaymentMethod") %></p>
                                </div>
                            </div>

                            <asp:Repeater ID="DetailRepeater2" runat="server">
                                <ItemTemplate>
                                    <div class="detail-payment">
                                        <p ><%# Eval("Storage.Product.ProductName") %> ( <%# Eval("Quantity") %> pcs )</p>
                                        <p><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Convert.ToInt32(Eval("Quantity")) * Convert.ToInt32(Eval("Storage.Product.ProductPrice"))) %></p>
                                    </div>

                                    <div class="detail-payment">
                                        <p >Pengiriman Kurir <%# Eval("ShipmentMethod") %></p>
                                        <p><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("ShipmentPrice")) %></p>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <div class="detail-payment">
                                <p id="total-paid-format">Total Belanja</p>
                                <p id="total-paid"><%# SANTARA_Marketplace.Template.HeaderAndFooter.GetPrice(Eval("TotalTransaction")) %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>

        <div id="overlay"></div>
    </section>

    <script>
        function openTransactionDetail(button) {
            var transactionItemContainer = button.closest('.transaction-content');
            var transactionItem = transactionItemContainer.querySelector('.transaction-items');
            var transactionId = transactionItem.querySelector('input[type="hidden"]').value;

            document.getElementById('<%= SelectedTransaction.ClientID %>').value = transactionId;

            __doPostBack('ShowTransactionDetails', '');
        }

        function openModal() {
            const modal = document.querySelector('#modal');
            modal.classList.add('active');
            overlay.classList.add('active');
        }
    </script>
</asp:Content>
