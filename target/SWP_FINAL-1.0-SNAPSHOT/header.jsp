<%-- Document : header Created on : Oct 1, 2023, 12:21:29 PM Author : ddand --%>

<%@page import="Models.tblUser" %>
<%@page import="DAOs.AccountDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<%AccountDAO aDAO = new AccountDAO();
    tblUser us = aDAO.GetUserID(Integer.parseInt(request.getParameter("ID")));%>

<header class="header" id="header">
    <nav class="nav container">
        <a href="/Home" class="nav_logo"><img src="/img/Logo_img.png" alt=""></a>
        <div class="nav_menu">
            <ul class="nav_list">
                <li class="nav_item"><a href="/Home" class="nav_item_link">Home</a></li>
                <li class="nav_item"><a href="/Shop" class="nav_item_link">Shop online</a></li>
                <li class="nav_item"><a href="/News" class="nav_item_link">What's new</a></li>
                <li class="nav_item"><a href="/Contact" class="nav_item_link">Contact</a></li>
                <li class="nav_item"><a href="/AboutUs" class="nav_item_link">About us</a></li>
            </ul>
            <div class="nav_acc">
                <div style="position: relative;">
                    <i class="fa-solid fa-magnifying-glass nav_acc_glass"></i>
                    <div style="position: absolute; width: min(724px, 100vw); right: 0; top: -3px;">
                        <input type="text" class="nav_acc_glass_input"
                               placeholder="Search name of product">
                        <div class="nav_acc_search_result">
                            <div class="search_result_list">
                                <!--Show Item in here-->
                            </div>
                        </div>
                    </div>
                </div>
                <div onclick="location.href = '/Cart/Info/<%=us.getUserID()%>';"
                     style="position: relative;" class="cart_item">
                    <i class="fa-solid fa-cart-shopping nav_acc_glass nav_acc_cart"></i>
                </div>
                <!-- ================= Cart popup ======== -->
                <div class="nav_acc_cart_area">
                    <input type="hidden" id="UserID" value="<%=us.getUserID()%>">
                    <div class="nav_acc_cart_recently">
                        <h1 class="nav_a_c_r_title">Recently Add To Cart</h1>
                        <div class="nav_a_c_r_list">
                            <!-- Item 1 -->
                            <!--Item is add from ajax js-->
                        </div>
                        <div class="nav_a_c_r_func">
                            <button class="nav_a_c_r_btn button"
                                    onclick="location.href = '/Cart/Info/<%=us.getUserID()%>';">View
                                Cart</button>
                        </div>
                    </div>
                </div>
                <!-- ============== Search input ============= -->
                <% if (us.getUserName() == null || us.getUserName() == "") { %>
                <div class="nav_profile" style="padding: 9px 0;">
                    <a href="/Login" class="nav_name"
                       style="font-weight: 600; font-size: 20px; padding: 2px 2rem; color: #fff;">
                        Login
                    </a>
                    <!-- <i class="fa-solid fa-user nav_acc_user"></i> -->
                </div>
                <% } else {%>
                <div class="nav_profile">
                    <h3 class="nav_name">
                        <%=us.getUserName()%>
                    </h3>
                    <i class="fa-solid fa-user nav_acc_user"></i>
                </div>

                <div class="nav_profile_select nav_profile_show">
                    <a href="/Account/UpdateProfileUser" class="nav_profile_opt">Your
                        profile</a>
                    <a href="/OrderHistory" class="nav_profile_opt">Order History</a>
                    <a href="/wishlist/show" class="nav_profile_opt">WishList</a>
                    <a href="/logout.jsp" class="nav_profile_opt">Logout</a>
                </div>
                <%}%>
            </div>
        </div>
    </nav>
    <script src="/js/DangScript/Header.js"></script>
    <script>
                                        // Get all navigation menu items
                                        var menuItems = document.querySelectorAll('.nav_item');

                                        // Loop through each menu item
                                        menuItems.forEach(function (menuItem) {
                                            // Get the link inside the menu item
                                            var link = menuItem.querySelector('.nav_item_link');

                                            // Check if the link's href attribute is the same as the current URL
                                            if (window.location.href.includes(link.href)) {
                                                // If it is, add the 'active' class to the menu item
                                                menuItem.classList.add('active');
                                            }
                                        });
    </script>
</header>