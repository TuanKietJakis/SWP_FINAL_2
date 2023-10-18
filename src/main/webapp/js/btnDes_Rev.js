$('.mayLike_container').owlCarousel({
    // rtl:true,
    loop: true,
    margin: 0,
    center: false,
    items: 4,
    nav: true,
    dots:false,
    smartSpeed:400,
    autoplay: true,
    autoplayTimeout: 3000,
    autoplayHoverPause: true,
});

function showDescription() {
    var description = document.querySelector(".sp-description");
    var review = document.querySelector(".sp-review");
    var descriptionButton = document.querySelector(".description");
    var reviewButton = document.querySelector(".review");

    review.style.display = "none";
    description.style.display = "block";

    // Loại bỏ lớp 'selected_button' từ nút Review
    reviewButton.classList.remove("selected_button");

    // Thêm lớp 'selected_button' cho nút Description
    descriptionButton.classList.add("selected_button");
}

function showReview() {
    var description = document.querySelector(".sp-description");
    var review = document.querySelector(".sp-review");
    var descriptionButton = document.querySelector(".description");
    var reviewButton = document.querySelector(".review");
     review.style.display = "block";
    description.style.display = "none";

    // Loại bỏ lớp 'selected_button' từ nút Description
    descriptionButton.classList.remove("selected_button");

    // Thêm lớp 'selected_button' cho nút Review
    reviewButton.classList.add("selected_button");
}

// Gọi hàm khi trang mới tải lên
window.onload = function() {
    showDescription();
};


 // Lấy danh sách tất cả các sản phẩm
var products = document.querySelectorAll(".col-md-3");






