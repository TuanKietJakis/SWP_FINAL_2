/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
var currentProductIndex = 0;
var products = document.getElementsByClassName("product");

function showProduct(index) {
  // Ẩn tất cả các sản phẩm
  for (var i = 0; i < products.length; i++) {
    products[i].style.display = "none";
  }
  
  // Hiển thị sản phẩm tại chỉ mục index
  products[index].style.display = "block";
}

function showPreviousProduct() {
  currentProductIndex--;
  if (currentProductIndex < 0) {
    currentProductIndex = products.length - 1;
  }
  showProduct(currentProductIndex);
}

function showNextProduct() {
  currentProductIndex++;
  if (currentProductIndex >= products.length) {
    currentProductIndex = 0;
  }
  showProduct(currentProductIndex);
}

// Hiển thị sản phẩm đầu tiên khi trang được tải
showProduct(currentProductIndex);




