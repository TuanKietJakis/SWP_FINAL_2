<%-- 
    Document   : index
    Created on : Jun 2, 2023, 8:52:32 AM
    Author     : User
--%>
<%@page import="DAOs.AccountDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account Main Page</title>
        <!--BootStrap -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script><link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel="stylesheet">
        <!--BootStrap -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/StyleAdminPanel.css">
    </head>
    <body>

        <!-- SIDEBAR -->
        <%@include file="/JSP/SectionList.jsp" %>
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
           
            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Dashboard</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Home</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <jsp:include page="/JSP/AccountPage/InfoBox.jsp"></jsp:include>

                    <div class="table-data">
                        <div class="order">
                            <div class="head">
                                <h3>Account Management</h3>
                            </div>
                            <table id="example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Full Name</th>
                                        <th>Email</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>                               
                                <%
                                    AccountDAO Dao = new AccountDAO();
                                    ResultSet rs = Dao.GetNotAdmin();
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td> <%=rs.getInt("UserID")%></td>
                                    <td> <%=rs.getString("Fullname")%></td>
                                    <td> <%=rs.getString("Email")%></td>
                                    <td>
                                        <a href="/Account/View/<%=rs.getInt("UserID")%>">More</a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>				
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script src="JavaScript/script.js">
        </script>
    </body>
</html>
