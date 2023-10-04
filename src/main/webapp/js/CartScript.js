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
    }

    function decreaseValue(quantityId) {
        const quantityInput = document.querySelector(`[data-quantity-id="${quantityId}"] .quantity-input`);
        let value = parseInt(quantityInput.value, 10);
        value = isNaN(value) ? 0 : value;
        value < 1 ? (value = 1) : '';
        value--;
        quantityInput.value = value;
    }
});