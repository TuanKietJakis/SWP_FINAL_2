<%-- 
    Document   : MyStore
    Created on : Jun 2, 2023, 8:40:36 AM
    Author     : User
--%>

<%@page import="DAOs.CategoryDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Of Product</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js">
        </script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js">
        </script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/StyleAdminPanel.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/button5.css">
    </head>
    <body>
    <body>
        <!-- SIDEBAR -->
        <%@include file="/JSP/SectionList.jsp" %>     
        <!-- SIDEBAR -->



        <!-- CONTENT -->
        <section id="content">
            <!-- MAIN -->
            
            <main>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Catagories Management</h3>
                            
                        </div>
                        <div class="text-center">
                                <a href="/Product/Create"class="button-5" role="button"><i class="fa-solid fa-plus"></i></a>
                                <!-- HTML !-->
                            </div>
                        <table id="example">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Strength</th>
                                    <th>Lasting</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>                               
                                <%
                                    CategoryDAO Dao = new CategoryDAO();
                                    ResultSet rs = Dao.GetAll();
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td> <%=rs.getInt("Category_ID")%></td>
                                    <td> <%=rs.getString("Cat_name")%></td>
                                    <td> <%=rs.getString("Cat_Strength")%></td>
                                    <td> <%=rs.getString("Cat_Lasting")%></td>
                                    <td>
                                        <div> More Info</div>
                                    </td>
                                    <td>
                                        <a href="/Product/View/<%=rs.getInt("Category_ID")%>">Show Product</a>
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

        <script src="<%= request.getContextPath()%>/JavaScript/script.js"></script>
        <script src="https://kit.fontawesome.com/53d8d93477.js" crossorigin="anonymous"></script>
    </body>
</body>
</html>
