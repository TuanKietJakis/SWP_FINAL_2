<%-- 
    Document   : Admin_Dashboard
    Created on : Oct 24, 2023, 11:19:57 PM
    Author     : khoic
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="CSS/admindashboard.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("adminID") && !cookie.getValue().equals("")) {
                        session.setAttribute("AdminstratorID", Integer.parseInt(cookie.getValue()));
                        break;
                    }
                }
            }
        %>
        <%
            int usID = 0;
            if (session.getAttribute("AdminstratorID") != null) {
                usID = (int) session.getAttribute("AdminstratorID");
            }else{
            response.sendRedirect("/Home");
            }
        %>
        <div class="container">
            <jsp:include page="Admin_navigation.jsp">
                <jsp:param name="ID" value="<%=usID%>"/>
            </jsp:include>             
                <div class="admin_background">

                </div>
                <div class="admin_info grid-item">
                <jsp:include page="Admin_anlyzes.jsp"></jsp:include>
                    <div class="admin_content">
                        <div class="table_container">
                            <div class="table" id="filterTable">
                                <div class="table_tittle">

                                    <h3>Account ID</h3>
                                    <h3>Username</h3>
                                    <h3>Customer Name</h3>

                                    <select class="select" id="filterSelect">
                                        <option selected="selected" value="0">All</option>
                                        <option value="1">Customer</option>
                                        <option value="2">Admin</option>
                                    </select>

                                </div>
                                <div class="table_body">
                                <%
                                    AccountDAO Dao = new AccountDAO();
                                    ResultSet rs = Dao.GetAllAccountDashboard();
                                    while (rs.next()) {
                                        if (rs.getInt("UserID") == usID) {

                                        } else {
                                %>
                                <div class="table_data" data-table="<%= rs.getInt("RoleID")%> ">
                                    <div class="data"><p> <%=rs.getInt("UserID")%> </p></div>
                                    <div class="data"><p> <%=rs.getString("Username")%> </p></div>
                                    <div class="data email_input"><p><%=rs.getString("Email")%></p></div>
                                    <div class="list_role" onclick="location.href = '/Admin/Detail/<%=rs.getInt("UserID")%>/<%=rs.getInt("RoleID")%>'">
                                        <p><%=rs.getString("Role")%></p>
                                        <i class="fa-solid fa-chevron-right" ></i>
                                    </div>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <div class="Account_search">
                        <input type="text" id="search_input" placeholder="Search...">
                    </div>
                </div>
            </div>
        </div>
        <script src="js/Admin_dashboard.js"></script>
    </body>
</html>
