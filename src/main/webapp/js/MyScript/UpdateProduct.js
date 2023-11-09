/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener("DOMContentLoaded", function () {
    let error = document.getElementById("Create_error");
    let close = document.getElementById("close");
    if (error) {
        close.addEventListener("click", () => {
            error.classList.remove("error_show");
        });
    }

    let form = document.getElementById("update_form");
    form.addEventListener("submit", function (event) {
        let msg = "";
        let error_msg = document.getElementById("error_msg");
        let productName = document.querySelector('input[name="txtProductName"]').value;
        let price = document.querySelector('input[name="txtPrice"]').value;
        let quantity = document.querySelector('input[name="txtQuantity"]').value;
        let size = document.querySelector('input[name="txtSize"]').value;
        let productDes = document.querySelector('textarea[name="txtProductDes"]').value;

        let valid = true;

        if (productName.trim() === "") {
            msg += "Product name is required - ";
            valid = false;
        } else if (productName.length > 50) {
            msg += "Product name must be less than 50 characters - ";
            valid = false;
        }else if(productName.length < 10){
            msg += "Product name must be at least 10 characters - ";
            valid = false;
        }

        if (price.trim() === "" || isNaN(price)) {
            msg += "Price is required and must be a number - ";
            valid = false;
        }

        if (quantity.trim() === "" || isNaN(quantity)) {
            msg += "Quantity is required and must be a number - ";
            valid = false;
        }

        if (size.trim() === "" || isNaN(size)) {
            msg += "Size must be a number - ";
            valid = false;
        }

        if (productDes.trim() === "") {
            msg += "Product description is required - ";
            valid = false;
        } else if (productDes.length > 500) {
            msg += "Product description must be less than 500 characters - ";
            valid = false;
        }

        if (valid === false) {
            error.classList.add("error_show");
            error_msg.innerHTML = msg.substring(0, msg.length - 2);
            event.preventDefault();
        } else {
            alert("Product updated successfully!");
        }
    });

    let removeButton = document.getElementById("remove_account");
    removeButton.addEventListener("click", function (event) {
        let confirmation = confirm("Are you sure you want to change status this product?");
        if (confirmation) {
            alert("Product changed status successfully!");
        } else {
            event.preventDefault();
        }
    });
});
