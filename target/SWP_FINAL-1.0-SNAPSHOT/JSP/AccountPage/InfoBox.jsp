<%-- 
    Document   : InfoBox
    Created on : Jul 6, 2023, 8:55:43 AM
    Author     : User
--%>

<%@page import="DAOs.OrderDAO"%>
<%@page import="DAOs.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul class="box-info">
    <%
        AccountDAO accDAO = new AccountDAO();
        OrderDAO ordDAO = new OrderDAO();
        int count = accDAO.GetCountAccount();
        int income = ordDAO.GetIncome();
        int NewOrder = ordDAO.GetNewOrder();
        %>
    <li>
        <i class='bx bxs-calendar-check' ></i>
        <span class="text">
            <h3><%=NewOrder%></h3>
            <p>New Order</p>
        </span>
    </li>
    <li>
        <i class='bx bxs-group' ></i>
        <span class="text">
            <h3><%=count%></h3>
            <p>Accounts</p>
        </span>
    </li>
    <li>
        <i class='bx bxs-dollar-circle' ></i>
        <span class="text">
            <h3>
                <%=income%>$
            </h3>
            <p>Total Sales</p>
        </span>
    </li>
</ul>
