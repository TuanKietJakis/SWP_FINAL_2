/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let Problem = document.querySelector('.order_show_info_reject');
if(Problem!= null){
    Problem.addEventListener("click", () => {
        if(confirm('You sure change status of this order?')){         
        let OrderID = document.querySelector('#orderID').value;
        $.ajax({
            method: 'post',
            url: '/Admin',
            data: {
                order: OrderID,
                action: "reject order"
            },
            success: function (data) {
                console.log(data.message);
                console.log(data.roleID);
                if (data.message == "success") {
                    window.location.href = "/Admin/OrderManage";

                }
            }
        });
        }
    });
}

let Ok = document.querySelector('.order_show_info_confirm');
if(Ok!=null){
    Ok.addEventListener("click", () => {
        if(confirm('You sure change status of this order?')){            
        let OrderID = document.querySelector('#orderID').value;
        $.ajax({
            method: 'post',
            url: '/Admin',
            data: {
                order: OrderID,
                action: "accept order"
            },
            success: function (data) {
                console.log(data.message);
                console.log(data.roleID);
                if (data.message == "success") {
                    window.location.href = "/Admin/OrderManage";

                }
            }
        });
        }
    });
}