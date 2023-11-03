function openPopup(productID, orderID) {
    var popup = document.getElementById("ratingPopup");
    popup.style.display = "block";

    var overlay = document.querySelector(".background");
    overlay.classList.add("show_background");
}

function closePopup() {
    var popup = document.getElementById("ratingPopup");
    popup.style.display = "none";

    var overlay = document.querySelector(".background");
    overlay.classList.remove("show_background");
}