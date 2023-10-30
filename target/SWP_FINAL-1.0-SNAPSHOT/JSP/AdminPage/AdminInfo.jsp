<%-- 
    Document   : AccountInfo
    Created on : Jun 5, 2023, 5:57:41 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Info</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js">
        </script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js">
        </script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/StyleAdminPanel.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/button5.css">
    </head>
    <body>
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
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <div>
                                <h3>Account Management</h3>
                                <i class='bx bx-chevron-right' ></i>
                                <a href="/Account">Back</a>                          
                            </div>
                        </div>
                        <table id="example">
                            <%
                                AccountDAO Dao = new AccountDAO();
                                int Info = (Integer) session.getAttribute("AdminID");
                                ResultSet rs = Dao.GetAll(Info);
                                if (rs.next()) {
                            %> 
                            <thead>
                                <tr>
                                    <th>User ID</th>
                                    <th>Full Name</th>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>Phone Number</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%=rs.getInt("UserID")%> </td>
                                    <td><%=rs.getString("Fullname")%> </td>
                                    <td><%=rs.getString("Username")%> </td>
                                    <td> <%=rs.getString("Password")%></td>
                                    <td><%=rs.getString("PhoneNumber")%> </td>
                                    <td><%=rs.getString("Email")%> </td>
                                    <td><%=rs.getString("Address")%>  </td>
                                    <td>
                                        <div class="text-center">  
                                            
                                            <a onclick="return confirm('Do you want to make remove this Admin?');" href="/Admin/DeleteAdmin/<%=rs.getInt("UserID")%>" class="button-1" role="button" ><i class="fa-solid fa-trash"></i></a>
                                        </div>
                                    </td>
                                </tr> 
                            </tbody>
                        </table>
                        =
                    </div>				
                </div>
                <%
                    }
                %>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="../JavaScript/script.js"></script>
        <script src="https://kit.fontawesome.com/53d8d93477.js" crossorigin="anonymous"></script>
    </body>
</html>
