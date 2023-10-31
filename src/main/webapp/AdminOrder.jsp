<%-- 
    Document   : AdminOrder
    Created on : Oct 31, 2023, 12:37:04 PM
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
    </head>

    <body>
        
        <div class="order_list_container">
            <jsp:include page="Admin_navigation.jsp">
                <jsp:param name="ID" value="3"/>
            </jsp:include>   
<!--            <div class="orderList_leftzone">
                            <div class="navigation grid-item">
                                <div class="navigation_logo">
                                    <img src="/img/Logo_img.png" alt="">
                                </div>
                                <div class="navigation_menu">
                                    <ul class="navigation_menu_list">
                
                                        <li class="navigation_menu_item">
                                            <i class="fa-solid fa-house-chimney"></i>
                                            <a class="navigation_menu_link" href="#">Dashboard</a>
                                        </li>
                                        <li class="navigation_menu_item"><i class="fa-solid fa-box-archive"></i>
                                            <a class="navigation_menu_link" href="#">My Product</a>
                                        </li>
                                        <li class="navigation_menu_item active"><i class="fa-regular fa-square-check"></i>
                                            <a class="navigation_menu_link" href="#">Orders</a>
                                        </li>
                                        <li class="navigation_menu_item">
                                            <i class="fa-solid fa-chart-line"></i>
                                            <a class="navigation_menu_link" href="#">Income</a>
                                        </li>
                
                                    </ul>
                                    <ul class="navigation_menu_list navigation_setting">
                
                                        <li class="navigation_menu_item">
                                            <i class="fa-solid fa-user-gear"></i>
                                            <a class="navigation_menu_link" href="#">Account Setting</a>
                                        </li>
                                        <li class="navigation_menu_item">
                                            <i class="fa-solid fa-right-from-bracket fa-rotate-180"></i>
                                            <a class="navigation_menu_link" href="#">Logout</a>
                                        </li>
                                    </ul>
                                </div>
                            </div> 
            </div>-->
            <div class="order_list_rightzone">
                <!-- =========================== Header =================== -->
                <div class="order_list_header">
                    <h1 class="order_list_header_title">
                        Order List
                    </h1>
                    <div class="order_list_header_search">
                        <input type="text" id="search-input" placeholder="Search..">
                        <button id="search-btn">Search</button>
                    </div>
                </div>

                <div class="order_list_header_table">
                    <h1 class="title1">All Order</h1>
                </div>

                <div class="order_list_table_frame">
                    <!-- ================ Function =============-->
                    <div class="order_list_table_title">
                        <h2 class="title1"><span>3</span> orders</h2>
                    </div>
                    <!-- ================ Table =================== -->
                    <div class="order_list_table_body">
                        <!-- =================== Header Table =================== -->
                        <div class="order_table_row header">
                            <h3 class="order_table_col id">Order ID</h3>
                            <h3 class="order_table_col name">Customer Name</h3>
                            <h3 class="order_table_col quan">Product/Item</h3>
                            <h3 class="order_table_col price">Price</h3>
                            <h3 class="order_table_col status">Status</h3>
                            <h3 class="order_table_col func">Operation</h3>
                        </div>
                        <!-- =================== Body Table =================== -->
                        <div class="order_table_row body">
                            <p class="order_table_col id">5</p>
                            <p class="order_table_col name">Nguyen Van A</p>
                            <p class="order_table_col quan">10</p>
                            <p class="order_table_col price">$160</p>
                            <p class="order_table_col confirm status"><span>Confirmed</span></p>
                            <a class="order_table_col link func" href="#">Info <span>></span></a>
                        </div>
                        <div class="order_table_row body">
                            <p class="order_table_col id">5</p>
                            <p class="order_table_col name">Nguyen Van A</p>
                            <p class="order_table_col quan">10</p>
                            <p class="order_table_col price">$160</p>
                            <p class="order_table_col pending status"><span>Pending</span></p>
                            <a class="order_table_col link func" href="AdminOrderDetail.html">Info <span>></span></a>
                        </div>
                        <div class="order_table_row body">
                            <p class="order_table_col id">5</p>
                            <p class="order_table_col name">Nguyen Van A</p>
                            <p class="order_table_col quan">10</p>
                            <p class="order_table_col price">$160</p>
                            <p class="order_table_col denied status"><span>Denied</span></p>
                            <a class="order_table_col link func" href="#">Info <span>></span></a>
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
                        } else {
                            row.style.display = 'none';
                        }
                    });
                }
            }

        </script>
    </body>

</html>