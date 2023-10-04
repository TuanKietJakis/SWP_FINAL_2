<%-- 
    Document   : header
    Created on : Oct 1, 2023, 12:21:29 PM
    Author     : ddand
--%>

<%@page import="Models.tblUser"%>
<%@page import="DAOs.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%AccountDAO aDAO = new AccountDAO();
            tblUser us = aDAO.GetCartByUserID(Integer.parseInt(request.getParameter("ID")));
%>

<header class="header" id="header">
    <nav class="nav container">
        <a href="index.html" class="nav_logo"><img src="img/Logo_img.png" alt=""></a>
        <div class="nav_menu">
            <ul class="nav_list">
                <li class="nav_item"><a href="#" class="nav_item_link">Home</a></li>
                <li class="nav_item"><a href="#" class="nav_item_link">Shop online</a></li>
                <li class="nav_item"><a href="#" class="nav_item_link">What's new</a></li>
                <li class="nav_item"><a href="#" class="nav_item_link">Contact</a></li>
                <li class="nav_item"><a href="#" class="nav_item_link">About us</a></li>
            </ul>
            <div class="nav_acc">
                <div>
                    <i class="fa-solid fa-magnifying-glass nav_acc_glass"></i>
                </div>
                <div>
                    <i class="fa-solid fa-cart-shopping nav_acc_glass nav_acc_cart"></i>
                </div>
                <!-- ================= Cart popup ======== -->
                <!-- <div class="nav_acc_cart_area">
                  
                </div> -->
                <!-- ============== Search input ============= -->
                <input type="text" class="nav_acc_glass_input" placeholder="Search name of product">

                <div class="nav_profile">
                    <h3 class="nav_name">
                        <%=us.getUserName()%>
                    </h3>
                    <i class="fa-solid fa-user nav_acc_user"></i>
                </div>
                <div class="nav_profile_select nav_profile_show">
                    <a href="#" class="nav_profile_opt">Your profile</a>
                    <a href="#" class="nav_profile_opt">Order History</a>
                    <a href="#" class="nav_profile_opt">Logout</a>
                </div>
            </div>
        </div>
    </nav>
</header>
