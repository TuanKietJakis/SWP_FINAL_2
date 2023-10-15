function scrollHeader() {
    const nav = document.getElementById('header');
    if (this.scrollY >= 200)
        nav.classList.add('scroll-header');
    else
        nav.classList.remove('scroll-header')
}
window.addEventListener('scroll', scrollHeader);


const opt_pro = document.querySelector('.nav_profile_select');
const acc_pro = document.querySelector('.nav_profile');
acc_pro.onclick = function () {
    opt_pro.classList.toggle("nav_profile_show");
};

const acc_glass_btn = document.querySelector('.nav_acc_glass');
const acc_glass_input = document.querySelector('.nav_acc_glass_input');
acc_glass_btn.onclick = function () {
    acc_glass_input.focus();
    acc_glass_input.classList.add("nav_acc_glass_show");
    acc_glass_input.onblur = function () {
        acc_glass_input.classList.remove("nav_acc_glass_show");
    }
};

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
        quantityInput.dispatchEvent(event);
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
        quantityInput.dispatchEvent(event);

    }
});

$(document).ready(function () {
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
                    n.remove();
                    if (document.querySelector('[id^="cart"]') === null) {
                        document.querySelector(".noItem").style.display = "block";
                    }
                }
            });
        });
    });

    document.querySelectorAll(".cart_t_i_quantity").forEach(element => {
        console.log("ok");
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
                    window.location.reload();
                }
            });
        });
    });

});