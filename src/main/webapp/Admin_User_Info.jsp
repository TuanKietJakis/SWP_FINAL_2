<%-- 
    Document   : Admin_User_Info
    Created on : Oct 23, 2023, 2:56:00 PM
    Author     : khoic
--%>

<%@page import="Models.tblUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="/CSS/adminUserinfo.css">
    </head>
    <body>
        <%
            tblUser us = (tblUser) session.getAttribute("user");
            String[] birthday = us.getDOB().split("-");
            String year = birthday[birthday.length - 3];
            String month = birthday[birthday.length - 2];
            String day = birthday[birthday.length - 1];
            
        %>
        <div class="container">
            <jsp:include page="Admin_navigation.jsp">
                <jsp:param name="ID" value="<%= us.getUserID() %>"/>
            </jsp:include>     
                <div class="admin_background">

                </div>
                <div class="admin_info grid-item">
                <jsp:include page="Admin_anlyzes.jsp"></jsp:include>    
                    <div class="admin_background"></div>
                    <div class="admin_content">
                        <div class="admin_content_info">
                            <div>
                                <img src="/img/Group 2527.svg" alt="">
                            </div>
                            <div class="admin_content_info_name" style="text-align: center;">
                                <p><%= us.getUserName()%></p>
                            <p><%= us.getFullName()%></p>
                        </div>
                        <div class="content_total">
                            <div class="total_text">
                                <text>Total order</text>
                                <number>13</number>
                            </div>
                            <div class="total_text">
                                <text>Total rating</text>
                                <number>5</number>
                            </div>
                        </div> 
                        <p class="admin_text">User</p>

                        <div class="admin_btn">
                            <span><i class="fa-solid fa-arrow-left"></i></span>

                        </div>
                    </div>
                    <div class="admin_content_infos">
                        <div class="admin_form" id="update_form">
                            <div class="inputbox">
                                <div class="birthday">
                                    <input type="text" disabled placeholder="dd" name="" value="<%= day%>" class="input input_birth" id="day">
                                    <input type="text" disabled placeholder="mm" name="" value="<%= month%>" class="input input_birth" id="month">
                                    <input type="text" disabled placeholder="yyyy" name="" value="<%= year%>" class="input input_birth" id="year">
                                </div>

                                <select id="genderSelect" disabled class="input" name="genderSelect">
                                    <option value="Male" <%= "Male".equals(us.getGender()) ? "selected" : ""%>>Male</option>
                                    <option value="Female" <%= "Female".equals(us.getGender()) ? "selected" : ""%>>Female</option>
                                </select>
                            </div>
                            <div class="inputbox">
                                <input class="input" disabled placeholder="ABC@gmail.com" type="text" name="" value="<%= us.getEmail()%>" id="email">
                            </div>
                            <div class="inputbox">
                                <input class="input" disabled placeholder="0123456789" type="text" name="" value="<%= us.getPhoneNumber()%>" id="phone">
                            </div>
                            <div class="inputbox">
                                <textarea class="input" disabled placeholder="Address" name="" id="" cols="30" rows="10"><%= us.getAddress()%></textarea>
                            </div>
                            <div class="btn_admin">
                                <input type="hidden" name="getID" id="userID" value="<%= us.getUserID()%>">
                                <input type="button" name="btn_ID" id="update" class="dm cm" value="Add Admin">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/js/DangScript/jquery.min.js"></script>
        <script src="/js/admininfo.js"></script>
    </body>
</html>
