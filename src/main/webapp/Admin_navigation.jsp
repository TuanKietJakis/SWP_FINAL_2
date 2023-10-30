<%-- 
    Document   : Admin_navigation
    Created on : Oct 23, 2023, 2:14:02 PM
    Author     : khoic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="sidebar">
           <div class="navigation grid-item">
    <div class="logo">
        <img class="logo" src="/img/Logo_img.png" alt="">
    </div>
    <div class="navigation_link">
        <div class="navigation_admin">

            <li>
                <i class="fa-solid fa-house-chimney"></i>
                <a href="#">Dashboard</a>
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
                <a href="#">Account Setting</a>
            </li>
            <li>
                <i class="fa-solid fa-right-from-bracket fa-rotate-180"></i>
                <a href="#">Logout</a>
            </li>

        </div>
    </div>
</div>
        </section>

