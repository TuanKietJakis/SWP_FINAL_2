
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

// Lặp qua danh sách sản phẩm và gắn sự kiện cho mỗi sản phẩm
products.forEach(function(product) {
  var span = product.querySelector("#addToCart");

  // Gán sự kiện mouseover và mouseout cho sản phẩm cụ thể
  product.addEventListener("mouseover", function() {
    // Hiển thị span khi di chuột vào sản phẩm
    span.style.display = "inline";
  });

  product.addEventListener("mouseout", function() {
    // Ẩn span khi di chuột ra khỏi sản phẩm
    span.style.display = "none";
  });
});




