<%-- 
    Document   : AdminOrderDetail
    Created on : Oct 31, 2023, 12:37:36 PM
    Author     : ddand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OrderList</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="/CSS/DangStyles/Adminorder.css">
    <link rel="stylesheet" href="/CSS/DangStyles/AdminorderDetail.css">
</head>

<body>
    <div class="order_list_container">
        <jsp:include page="Admin_navigation.jsp">
                <jsp:param name="ID" value="3"/>
            </jsp:include>   
        <div class="order_list_rightzone">
            <!-- =========================== Header =================== -->
            <div class="order_list_header">
                <h1 class="order_list_header_title">
                    Order Detail
                </h1>
                <div class="order_list_header_search">
                    <input type="text" id="search-input" placeholder="Search..">
                    <button id="search-btn">Search</button>
                </div>
            </div>

            <div class="order_list_header_table">
                <h1 class="title1">Order ID: <span>5</span> - Order Detail</h1>
            </div>

            <div class="order_list_table_frame">
                <!-- ================ Function =============-->
                <div class="grid ordertitle">
                    <div class="order_list_table_title">
                        <a href="#"><i class="fa-solid fa-arrow-left"></i> Back to Order</a>
                        <h2 class="title1"><span>3</span> Products</h2>
                    </div>
                    <div>
                    </div>
                </div>
                <!-- ================ Table =================== -->
                <div class="grid ordertable">
                    <div class="order_list_table_body">
                        <!-- =================== Header Table =================== -->
                        <div class="order_table_row header">
                            <h3 class="order_table_col id">Product ID</h3>
                            <h3 class="order_table_col name">Product Name</h3>
                            <h3 class="order_table_col quan">Amount</h3>
                            <h3 class="order_table_col price">Price</h3>
                        </div>
                        <!-- =================== Body Table =================== -->
                        <div class="order_table_row body">
                            <p class="order_table_col id">1</p>
                            <p class="order_table_col name">Product 1</p>
                            <p class="order_table_col quan">10</p>
                            <p class="order_table_col price">$160</p>
                        </div>
                        <div class="order_table_row body">
                            <p class="order_table_col id">2</p>
                            <p class="order_table_col name">Product 2</p>
                            <p class="order_table_col quan">10</p>
                            <p class="order_table_col price">$160</p>
                        </div>
                        <div class="order_table_row body">
                            <p class="order_table_col id">2</p>
                            <p class="order_table_col name">Product 2</p>
                            <p class="order_table_col quan">10</p>
                            <p class="order_table_col price">$160</p>
                        </div>
                        <div class="order_table_row body">
                            <p class="order_table_col id">2</p>
                            <p class="order_table_col name">Product 2</p>
                            <p class="order_table_col quan">10</p>
                            <p class="order_table_col price">$160</p>
                        </div>
                        
                        
                    </div>
                    <div class="order_management">
                            <div class="order_show_info_cus">
                                <div class="order_show_info_group">
                                    <p class="order_show_info_name">Receive Person <span>Nguyen Van A</span></p>
                                    <p class="order_show_info_userID">UserID <span>4</span></p>
                                </div>
                                <div class="order_show_info_group">
                                    <p class="order_show_info_phone">Phone Number <span>0123123123</span> </p>
                                </div>
                                <div class="order_show_info_group">
                                    <p class="order_show_info_payment">Payment <span>VNPay</span></p>
                                    <p class="order_show_info_phone">Trading ID <span>#0124421</span></p>
                                </div>
                                <div class="order_show_info_group">
                                    <p class="order_show_info_address">Delivery Address <span>Can Tho</span> </p>
                                </div>
                                <div class="order_show_info_function">
                                    <button class="order_show_info_reject">Have Problem</button>
                                    <button class="order_show_info_confirm">This Order Is OK</button>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        window.onload = function () {
            var search_input = document.querySelector('#search-input');
            var search_btn = document.querySelector('#search-btn');
            var tableRows = document.querySelectorAll('.order_table_row.body');
            search_input.addEventListener('change', (e) => {
                search();
            });
            search_btn.addEventListener('click', (e) => {
                search();
            });

            function search() {
                console.log("hello")
                tableRows.forEach((row) => {
                    let name_input = row.querySelector('.order_table_col.name').textContent.toString();
                    let search = search_input.value.toString();

                    // trim spaces and remove special characters from both strings
                    let CustomerName = name_input.toLowerCase().trim().replace(/[^a-zA-Z0-9]/g, '');
                    let searchs = search.toLowerCase().trim().replace(/[^a-zA-Z0-9]/g, '');

                    if (CustomerName.includes(searchs) || CustomerName === searchs) {
                        row.style.display = 'flex';
                    }
                    else {
                        row.style.display = 'none';
                    }
                });
            }
        }

    </script>
</body>

</html>
