<%-- 
    Document   : Admin_anlyzes
    Created on : Oct 23, 2023, 2:14:51 PM
    Author     : khoic
--%>

<%@page import="DAOs.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String sql = "select count(*) as total from ";
    CartDAO dao = null;
    try {
        dao = new CartDAO();
    } catch (Exception e) {

    }
    int dataProduct = dao.GetCount(sql + " tblProduct where Active = 1");
    int dataOrder = dao.GetCount(sql + " tblOrder where Active = 1");
    int dataUser = dao.GetCount(sql + " tblUser where Active = 1");
%>
<div class="admin_dashboard">
    <h1>Dashboard</h1>
    <div class="box_container">
        <div class="box box1">
            <i class="fa-solid fa-clipboard-list"></i>
            <div class="data">
                <text>Total Order</text>
                <number><%=dataOrder %><span style="font-size: 18px;font-weight: 500;"> available</span></number>
            </div>
        </div>
        <div class="box box2">
            <i class="fa-solid fa-users"></i>
            <div class="data">
                <text>Total Customer</text>
                <number><%=dataUser%><span style="font-size: 18px;font-weight: 500;"> available</span></number>
            </div>
        </div>
        <div class="box box3">
            <i class="fa-solid fa-hand-holding-dollar"></i>
            <div class="data">
                <text>Total Product</text>
                <number><%=dataProduct%> <span style="font-size: 18px;font-weight: 500;"> available</span></number>
            </div>
        </div>
    </div>
</div>
