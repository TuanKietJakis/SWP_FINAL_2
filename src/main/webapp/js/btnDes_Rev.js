

//function showDescription() {
//    var description = document.querySelector(".sp-description");
//    var review = document.querySelector(".sp-review");
//    var descriptionButton = document.querySelector(".description");
//    var reviewButton = document.querySelector(".review");
//
//    review.style.display = "none";
//    description.style.display = "block";
//
//    // Loại bỏ lớp 'selected_button' từ nút Review
//    reviewButton.classList.remove("selected_button");
//
//    // Thêm lớp 'selected_button' cho nút Description
//    descriptionButton.classList.add("selected_button");
//}

//function showReview() {
//    var description = document.querySelector(".sp-description");
//    var review = document.querySelector(".sp-review");
//    var descriptionButton = document.querySelector(".description");
//    var reviewButton = document.querySelector(".review");
//     review.style.display = "block";
//    description.style.display = "none";
//
//    // Loại bỏ lớp 'selected_button' từ nút Description
//    descriptionButton.classList.remove("selected_button");
//
//    // Thêm lớp 'selected_button' cho nút Review
//    reviewButton.classList.add("selected_button");
//}

// Gọi hàm khi trang mới tải lên
//window.onload = function() {
//    showDescription();
//};


// Lấy danh sách tất cả các sản phẩm
//var products = document.querySelectorAll(".col-md-3");
document.querySelector('.des_nav_des').addEventListener('click', () => {
    document.querySelector('.des_nav_des').classList.add("active")
    document.querySelector('.des_content_des').classList.add("active");
    document.querySelector('.des_nav_rev').classList.remove("active");
    document.querySelector('.des_content_rev').classList.remove("active");
});
document.querySelector('.des_nav_rev').addEventListener('click', () => {
    document.querySelector('.des_nav_rev').classList.add("active");
    document.querySelector('.des_content_rev').classList.add("active");
    document.querySelector('.des_nav_des').classList.remove("active")
    document.querySelector('.des_content_des').classList.remove("active");
});

$('.relate_container').owlCarousel({
    // rtl:true,
    loop: true,
    margin: 0,
    center: false,
    items: 4,
    nav: false,
    dots: false,
    smartSpeed: 400,
    autoplay: true,
    autoplayTimeout: 3000,
    autoplayHoverPause: true,
});

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






