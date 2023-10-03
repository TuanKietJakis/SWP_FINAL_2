<%-- 
    Document   : SectionList
    Created on : Jun 21, 2023, 7:50:27 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section id="sidebar">
            <a href="#" class="brand">
                <i class='bx bxs-smile'></i>
                <span class="text">Admin Panel</span>   
            </a>
            <ul class="side-menu top">
                <li>
                    <a href="/Account">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="/Product">
                        <i class='bx bxs-shopping-bag-alt' ></i>
                        <span class="text">My Store</span>
                    </a>
                </li>
                <li>
                    <a href="/Order">
                        <i class='bx bxs-doughnut-chart' ></i>
                        <span class="text">Order</span>
                    </a>
                </li>
                <li>
                    <a href="/Admin">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Admin</span>
                    </a>
                </li>
            </ul>
            <ul class="side-menu">
                <li>
                    <a href="/Account/Info/${sessionScope.AdminstratorID}" class="">   
                        <i class='bx bxs-smile' ></i>
                        <span class="text">${sessionScope.Adminstrator}</span>
                    </a>
                </li>
                <li>
                    <a href="/Account/Logout" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
        </section>
    </body>
</html>
