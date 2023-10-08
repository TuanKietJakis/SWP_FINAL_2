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
        <title>Account Information</title>
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
                <div class="order">
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
                                <div>
                                    <h3>Account Management</h3>
                                    <i class='bx bx-chevron-right' ></i>
                                    <a href="/Account">Back</a>                          
                                </div>
                            </div>
                            <table id="example">
                                <%
                                    AccountDAO Dao = new AccountDAO();
                                    int Info = (Integer) session.getAttribute("UserID");
                                    ResultSet rs = Dao.GetAll(Info);
                                    if (rs.next()) {
                                %> 
                                <thead>
                                    <tr>
                                        <th>User ID</th>
                                        <th>Username</th>
                                        <th>Full Name</th>
                                        <th>Phone Number</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th>Gender</th>
                                        <th>DOB</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%=rs.getInt("UserID")%> </td>
                                        <td><%=rs.getString("FullName")%> </td>
                                        <td><%=rs.getString("Username")%> </td>
                                        <td><%=rs.getString("PhoneNumber")%> </td>
                                        <td><%=rs.getString("Email")%> </td>
                                        <td><%=rs.getString("Address")%>  </td>
                                        <td><%=rs.getString("Gender")%>  </td>
                                        <td><%=rs.getString("Dob")%>  </td>
                                        <td>
                                            <div class="text-center">  
                                                <a onclick="return confirm('Do you want to delete this account?');" href="/Account/Delete/<%=rs.getInt("UserID")%>" class="button-1" role="button" ><i class="fa-solid fa-trash"></i></a>
                                                <a onclick="return confirm('Do you want to make this person Admin?');" href="/Account/MakeAdmin/<%=rs.getInt("UserID")%>" class="button-5" role="button" >Add Admin</a>
                                            </div>
                                        </td>
                                    </tr> 

                                </tbody>
                            </table>


                            <%

                                }
                            %>
                        </div>				
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="../JavaScript/script.js"></script>
        <script src="https://kit.fontawesome.com/53d8d93477.js" crossorigin="anonymous"></script>
    </body>
</html>
