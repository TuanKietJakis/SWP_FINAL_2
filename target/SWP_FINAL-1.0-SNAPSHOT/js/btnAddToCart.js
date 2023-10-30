
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



