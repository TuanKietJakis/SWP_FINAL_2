/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

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
                Amount:Amount,
                action: "addtoCart"
            },
            success: function (data) {
                if (data.message === "success") {
                    document.querySelector('.number_of_item').textContent = parseInt(document.querySelector('.number_of_item').textContent) + parseInt(1);
                } else {
                    location.href = '/Login';
                }
            }
        });
    });


