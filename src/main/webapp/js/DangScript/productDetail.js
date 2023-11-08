/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
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
document.querySelector('.product_d_c_o_addtoCart').addEventListener('click', () => {
    var ProductID = document.querySelector('#productID').value;
    var UserID = document.querySelector('.product_d_c_o_addtoCart').getAttribute("data-user-id");
    var Amount = document.querySelector('#number1').value;
    $("#action").val("addtoCart");
    $.ajax({
        method: "POST",
        url: "/Home",
        data: {
            ProductID: ProductID,
            UserID: UserID,
            Amount: Amount,
            action: "addtoCart"
        },
        success: function (data) {
            console.log(data);
            if (data.message === "success") {
                document.querySelector('#AmountFromCart').value = data.Amount;
                document.querySelector('.number_of_item').textContent = parseInt(document.querySelector('.number_of_item').textContent) + parseInt(1);
            } else if (data.message === "full") {
                alert("You get too much for today");
            } else if (data.message === "fail") {
                alert("Add to Cart Fail");
            } else if (data.message === "update") {
                document.querySelector('#AmountFromCart').value = data.Amount;
                alert("Item has update to your Cart");
            } else {
                location.href = "/Home"
            }
        }
    });
});

document.querySelector('.quantity-input').addEventListener('input', () => {
    var Amount = document.querySelector('.quantity-input').value;
    var AmountFromCart = document.querySelector('#AmountFromCart').value;
    var TotalAmount = parseInt(Amount) + parseInt(AmountFromCart);
    var StoreQuan = document.querySelector('#StoreQuan').value;
    if (StoreQuan < TotalAmount) {
        document.querySelector('.quantity-input').value = parseInt(StoreQuan) - parseInt(AmountFromCart);
        alert("Thank for your huge number of product order, but we don't have enough product available for you");
    }
});


