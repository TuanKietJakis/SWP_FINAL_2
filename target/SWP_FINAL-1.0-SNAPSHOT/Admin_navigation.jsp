<%-- 
    Document   : Admin_navigation
    Created on : Oct 23, 2023, 2:14:02 PM
    Author     : khoic
--%>

<%@page import="Models.tblUser"%>
<%@page import="DAOs.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .order_list_container {
        background: #e0e0e0;
        display: flex;
        height: 100%;
        gap: 5px;
    }

    .order_list_leftzone {
        height: 100%;
        background: #fff;
    }

    ul {
        list-style: none;
    }

    .navigation {
        background: #fff;
        display: flex;
        flex-direction: column;
        height: 100%;
    }

    .navigation_logo {
        padding-left: 26px;
        padding-right: 16px;
        margin: 25px auto;

        & img {
            object-fit: cover;
        }
    }

    .navigation_menu {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 100%;
        margin: 8px 0 80px;
    }

    .navigation_menu_list {
        display: flex;
        justify-content: center;
        flex-direction: column;

        & .navigation_menu_item {
            display: flex;
            align-items: center;
            gap: 18px;
            padding: 14px 40px;
            cursor: pointer;
            transition: 0.3s;

            & i {
                font-size: 22px;
            }

            & a {
                transition: 0.3s;
                text-wrap: nowrap;
                color: #000;
                font-size: 20px;
                font-weight: 500;
                line-height: normal;
            }

            &:hover {
                background: #f9f9f9;
                color: #EE2A7B;
                filter: drop-shadow(1px 2px 1px rgba(0, 0, 0, 0.15));

                & a {
                    color: #EE2A7B;
                }
            }
        }
    }

    .navigation_menu_item.active {
        background: #f9f9f9;
        box-shadow: 1px 2px 1px rgba(0, 0, 0, 0.15), 0 0 3px 0 rgba(0, 0, 0, 0.1);
        color: #EE2A7B;

        & a {
            color: #EE2A7B;
            filter: drop-shadow(1px 2px 1px rgba(0, 0, 0, 0.15));
        }
    }

</style>    

<div class="orderList_leftzone">
    <%
        int usId = Integer.parseInt(request.getParameter("ID"));
    %>
    <div class="navigation grid-item">
        <div class="navigation_logo">
            <img src="/img/Logo_img.png" alt="">
        </div>
        <div class="navigation_menu">
            <ul class="navigation_menu_list" id="navigationMenu">

                <li class="navigation_menu_item" onclick="location.href='/Admin'">
                    <i class="fa-solid fa-house-chimney"></i>
                    <a class="navigation_menu_link" href="/Admin">Dashboard</a>
                </li>
                <li class="navigation_menu_item" onclick="location.href='/Admin/Product/List'"><i class="fa-solid fa-box-archive"></i>
                    <a class="navigation_menu_link" href="/Admin/Product/List">List Product</a>
                </li>
                <li class="navigation_menu_item" onclick="location.href='#'"><i class="fa-regular fa-square-check"></i>
                    <a class="navigation_menu_link" href="/Admin/OrderManage">Orders</a>
                </li>
                <li class="navigation_menu_item" onclick="location.href='#'">
                    <i class="fa-solid fa-chart-line"></i>
                    <a class="navigation_menu_link" href="/Admin/OrderStatus">Income</a>
                </li>
                <li class="navigation_menu_item" onclick="location.href='/Admin/FAQ'"><i class="fa-solid fa-envelope"></i>
                    <a class="navigation_menu_link" href="/Admin/FAQ">FAQ</a>
                </li>

            </ul>
            <ul class="navigation_menu_list navigation_setting">

                <li class="navigation_menu_item" onclick="location.href='/Admin/Setting/<%=usId%>'">
                    <i class="fa-solid fa-user-gear"></i>
                    <a class="navigation_menu_link" href="/Admin/Setting/<%=usId%>">Account Setting</a>
                </li>
                <li class="navigation_menu_item">
                    <i class="fa-solid fa-right-from-bracket fa-rotate-180"></i>
                    <a class="navigation_menu_link" href="/logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</div>
              <script>
                    // Get all navigation menu items
                    var menuItems = document.querySelectorAll('.navigation_menu_item');
                   
                    // Loop through each menu item
                    menuItems.forEach(function(menuItem) {
                       // Get the link inside the menu item
                       var link = menuItem.querySelector('.navigation_menu_link');
                   
                       // Check if the link's href attribute is the same as the current URL
                       if (link.href === window.location.href) {
                         // If it is, add the 'active' class to the menu item
                         menuItem.classList.add('active');
                       }
                    });
                   </script>

<!--<section id="sidebar">
    <div class="navigation grid-item">
        <div class="logo">
            <img class="logo" src="/img/Logo_img.png" alt="">
        </div>
        <div class="navigation_link">
            <div class="navigation_admin">

                <li>
                    <i class="fa-solid fa-house-chimney"></i>
                    <a href="/Admin">Dashboard</a>
                </li>
                <li><i class="fa-solid fa-box-archive"></i>
                    <a href="/Admin/Product/List">My Product</a>
                </li>
                <li><i class="fa-regular fa-square-check"></i>
                    <a href="">Orders</a>
                </li>
                <li>
                    <i class="fa-solid fa-chart-line"></i><a href="">Income</a>
                </li>

            </div>
            <div class="navigation_setting">

                <li>
                    <i class="fa-solid fa-user-gear"></i>
                    <a href="/Admin/Setting/<!--usId%>">Account Setting</a>
                </li>
                <li>
                    <i class="fa-solid fa-right-from-bracket fa-rotate-180"></i>
                    <a href="#">Logout</a>
                </li>

            </div>
        </div>
    </div>
</section>-->