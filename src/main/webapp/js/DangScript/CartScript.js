document.addEventListener('DOMContentLoaded', function () {
    const quantityContainers = document.querySelectorAll('.cart_t_i_quantity');

    quantityContainers.forEach(function (container) {
        const decreaseButton = container.querySelector('.decrease');
        const increaseButton = container.querySelector('.increase');
        const quantityInput = container.querySelector('.quantity-input');
        const quantityId = container.getAttribute('data-quantity-id');

        decreaseButton.addEventListener('click', function () {
            decreaseValue(quantityId);
        });

        increaseButton.addEventListener('click', function () {
            increaseValue(quantityId);
        });
    });

    function increaseValue(quantityId) {
        const quantityInput = document.querySelector(`[data-quantity-id="${quantityId}"] .quantity-input`);
        let value = parseInt(quantityInput.value, 10);
        value = isNaN(value) ? 0 : value;
        value++;
        quantityInput.value = value;
        const event = new Event('input', {
            bubbles: true,
            cancelable: true
        });
        setTimeout(function () {
            quantityInput.dispatchEvent(event);
        }, 1000);

    }

    function decreaseValue(quantityId) {
        const quantityInput = document.querySelector(`[data-quantity-id="${quantityId}"] .quantity-input`);
        let value = parseInt(quantityInput.value, 10);
        value = isNaN(value) ? 0 : value;
        value < 1 ? (value = 1) : '';
        value--;
        quantityInput.value = value;
        const event = new Event('input', {
            bubbles: true,
            cancelable: true
        });
        setTimeout(function () {
            quantityInput.dispatchEvent(event);
        }, 1000);


    }
});


$(document).ready(function () {
    document.querySelector('.cart_dz_data_area');
    $('.cart_dz_select').on('change', function () {
        var ID = $('.cart_dz_select').val();
        $("#action").val("chooseAddress");
        $.ajax({
            method: "GET",
            url: "/Cart",
            data: {
                ID: ID,
                action: "chooseAddress"
            },
            success: function (data) {
                $("#inputFullName").val(data.FullName);
                $("#inputPhoneNumber").val(data.PhoneNumber);
                $("#inputAddress").val(data.Address);
                if (data.PaymentMethod === 1) {
                    document.querySelector('#vnPay').checked = true;
                } else if (data.PaymentMethod === 2) {
                    document.querySelector('#cash').checked = true;
                }

            }
        });
    });
    document.querySelectorAll(".cart_t_item").forEach(n => {
        const deleteBtn = n.querySelector(".cart_t_i_func");
        deleteBtn.addEventListener('click', function () {
            var ProductID = deleteBtn.getAttribute("data-product-id");
            $("#action").val("delete-product");
            $.ajax({
                method: "POST",
                url: "/Cart",
                data: {
                    ProductID: ProductID,
                    action: "delete-product"
                },
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
                success: function (response) {
//                    n.remove();
                    window.location.reload();

                    if (document.querySelector('[id^="cart"]') === null) {
                        document.querySelector(".noItem").style.display = "block";
                    }
                }
            });
        });
    });

    document.querySelectorAll(".cart_t_i_quantity").forEach(element => {
        element.querySelector(".quantity-input").addEventListener('input', function () {
            console.log("ok");
            const ProductPrice = element.querySelector("#proPrice").value;
            const ProductAmount = element.querySelector(".quantity-input").value;
            const CartID = element.querySelector("#proPrice").getAttribute("data-cart-id");
            element.querySelector("#action").value = "update-quan";
            $.ajax({
                method: "POST",
                url: "/Cart",
                data: {
                    ProductPrice: ProductPrice,
                    ProductAmount: ProductAmount,
                    CartID: CartID,
                    action: "update-quan"
                },
                success: function (data) {
                    if (data.delete == "delete") {
                        window.location.reload();
                    }
                    let oldAmount = data.oldAmount;
                    let ProductPrice = data.ProductPrice;
                    let ProductAmount = data.ProductAmount;
                    let subtotal = document.getElementById("subtotal");
                    let total = document.getElementById("total");
                    total.value = parseFloat(total.value) - parseFloat(subtotal.value);

                    subtotal.value = parseFloat(subtotal.value) + (ProductAmount - oldAmount) * ProductPrice;
                    total.value = parseFloat(total.value) + parseFloat(subtotal.value);
                    document.querySelector('.subtotalClass').innerHTML = "$" + subtotal.value;
                    document.querySelector('.totalClass').innerHTML = "$" + total.value;
                }
            });
        });
    });

});