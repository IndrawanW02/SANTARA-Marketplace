//function setShipment(button, method, price) {
//    var parentDiv = button.closest('.shipment-container');
//    var hfShipmentMethod = parentDiv.querySelector('[id$="hfShipmentMethod_' + button.dataset.index + '"]');

//    console.log(hfShipmentMethod);

//    alert("maasok");
//    hfShipmentMethod.value = method;
//    //hfShipmentPrice.value = price;
//}

function setShipment(button) {
    var method = button.dataset.method;
    var price = button.dataset.price;

    console.log(method);
    console.log(price);

    var parentDiv = button.closest(".shipment-container");
    var allHiddenFields = parentDiv.querySelectorAll('input[type="hidden"]');

    var hfShipmentMethod = null;
    var hfShipmentPrice = null;

    //var hfTriggerPostback = document.getElementById('<%= hfTriggerPostback.ClientID %>');
    var totalShipmentPrice = 0;
    var repeaterItems = parentDiv.querySelectorAll(".ProductCard");

    allHiddenFields.forEach(function (field) {
        if (field.id.includes("hfShipmentMethod")) {
            hfShipmentMethod = field;
        } else if (field.id.includes("hfShipmentPrice")) {
            hfShipmentPrice = field;
        }
    });

    console.log(hfShipmentMethod);
    console.log(hfShipmentPrice);
    console.log(repeaterItems);
    //console.log(hfTriggerPostback);

    hfShipmentMethod.value = method;
    hfShipmentPrice.value = price;

    repeaterItems.forEach(function (item){
        var itemPrice = parseFloat(item.querySelector("hfShipmentPrice").value);
        totalShipmentPrice += itemPrice;
    });

    var totalShipmentLabel = document.getElementById("TotalShipmentPrice");
    totalShipmentLabel.textContent = totalShipmentPrice.toFixed(2);
}

//var cardContainer = document.getElementsByClassName(".cardContainer");
//var cardRepeater = cardContainer.querySelector('<%= CardRepeater.ClientID %>');

//PageMethods.UpdateTotalShipment(cardRepeater);

//function onSucess(result) {
//    alert(result);
//}

//function onError(result) {
//    alert('Cannot process your request at the moment, please try later.');
//}

//$.ajax({
//    type: "POST",
//    url: "CheckOutPage.aspx/UpdateTotalShipment", // Ganti NamaHalaman.aspx dengan nama halaman Anda
//    contentType: "application/json; charset=utf-8",
//    dataType: "json",
//    success: function (response) {
//        // Tindakan setelah permintaan berhasil
//        var totalShipment = response.d; // Ambil nilai totalShipment dari respons
//        console.log("Total biaya pengiriman: " + totalShipment);
//    },
//    error: function (xhr, status, error) {
//        // Tindakan jika terjadi kesalahan
//        console.error("Terjadi kesalahan: " + error);
//    }
//});

//eval(hfTriggerPostback);

//__doPostBack('hfTriggerPostback', '');