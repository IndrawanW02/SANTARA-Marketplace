function setShipment(button) {
    var method = button.dataset.method;
    var price = button.dataset.price;

    console.log(method);
    console.log(price);

    var parentDiv = button.closest(".shipment-container");
    var allHiddenFields = parentDiv.querySelectorAll('input[type="hidden"]');

    var hfShipmentMethod = null;
    var hfShipmentPrice = null;

    var totalShipmentPrice = 0;
    var repeaterItems = parentDiv.querySelectorAll(".ProductCard");

    allHiddenFields.forEach(function (field) {
        if (field.id.includes("hfShipmentMethod")) {
            hfShipmentMethod = field;
        } else if (field.id.includes("hfShipmentPrice")) {
            hfShipmentPrice = field;
        }
    });

    hfShipmentMethod.value = method;
    hfShipmentPrice.value = price;

    repeaterItems.forEach(function (item){
        var itemPrice = parseFloat(item.querySelector("hfShipmentPrice").value);
        totalShipmentPrice += itemPrice;
    });

    var totalShipmentLabel = document.getElementById("TotalShipmentPrice");
    totalShipmentLabel.textContent = totalShipmentPrice.toFixed(2);
}
