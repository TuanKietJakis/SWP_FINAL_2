<%-- 
    Document   : AdminOrderDetail
    Created on : Oct 31, 2023, 12:37:36 PM
    Author     : ddand
--%>

<%@page import="DAOs.OrderDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.tblUser"%>
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
        <%
            tblUser us = (tblUser) session.getAttribute("user");
            ResultSet or = (ResultSet) session.getAttribute("order");
            OrderDAO dao = new OrderDAO();
            OrderDAO dao1 = new OrderDAO();
            int OrderID = (int) request.getAttribute("orderID");    
            int count = dao.GetPaymentMethodbyID(OrderID);
            int totalproduct = dao1.GetTotalProductbyOrderID(OrderID);
            String paymethod = "";
            if (count == 1) {
                paymethod = "VNPay";
            } else if (count == 2) {
                paymethod = "COD";
            }

        %>
        <div class="order_list_container">
            <jsp:include page="Admin_navigation.jsp">
                <jsp:param name="ID" value="<%= us.getUserID()%>"/>
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
                    <h1 class="title1">Order ID: <span><%= OrderID %></span> - Order Detail</h1>
                </div>

                <div class="order_list_table_frame">
                    <!-- ================ Function =============-->
                    <div class="grid ordertitle">
                        <div class="order_list_table_title">
                            <a href="/Admin/OrderManage"><i class="fa-solid fa-arrow-left"></i> Back to Order</a>
                            <h2 class="title1"><span><%= totalproduct %></span> Products</h2>
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
                            <%

                                while (or.next()) {
                            %>
                            <div class="order_table_row body">
                                <p class="order_table_col id"><%=or.getString("ProductID")%></p>
                                <p class="order_table_col name"><%=or.getString("ProductName")%></p>
                                <p class="order_table_col quan"><%=or.getString("Quantity")%></p>
                                <p class="order_table_col price"><%=or.getString("Price")%></p>
                            </div>

                            <%
                                }
                            %>
                        </div>
                        <div class="order_management">
                            <div class="order_show_info_cus">
                                <div class="order_show_info_group">
                                    <p class="order_show_info_name">Receive Person <span><%= us.getFullName()%></span></p>
                                    <p class="order_show_info_userID">UserID <span><%= us.getUserID()%></span></p>
                                </div>
                                <div class="order_show_info_group">
                                    <p class="order_show_info_phone">Phone Number <span><%= us.getPhoneNumber()%></span> </p>
                                </div>
                                <div class="order_show_info_group">
                                    <p class="order_show_info_payment">Payment <span><%= paymethod%></span></p>
                                    <!--                                    <p class="order_show_info_phone">Trading ID <span>#0124421</span></p>-->
                                </div>
                                <div class="order_show_info_group">
                                    <p class="order_show_info_address">Delivery Address <span><%= us.getAddress()%></span> </p>
                                </div>
                                <div class="order_show_info_function">
                                    <button  class="order_show_info_reject">Have Problem</button>
                                    <input type="hidden" id="orderID" value="<%= OrderID %>">
                                    <button  class="order_show_info_confirm">This Order Is OK</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                    <script src="/js/DangScript/jquery.min.js"></script>
                                <script src="/js/adminorderdetail.js"></script>
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
