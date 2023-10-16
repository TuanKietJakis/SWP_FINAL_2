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
        <title>Product's Information</title>
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
        <<%@include file="/JSP/SectionList.jsp" %>  
        <!-- SIDEBAR -->
        <!-- CONTENT -->
        <section id="content">

            <!-- MAIN -->
            <main>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <div>
                                <h3>Product Management</h3>
                                <i class='bx bx-chevron-right' ></i>
                                <a href="/Product">Back</a>                          
                            </div>
                        </div>
                        <table id="example">
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Brand ID</th>
                                    <th>Rating ID</th>
                                    <th>Product Description</th>
                                    <th>Quantity</th>
                                    <th>Active</th>
                                    <th>ProductImageURL</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>                               
                                <%
                                    int infonum = (Integer) session.getAttribute("CategoryID");
                                    ProductDAO Dao = new ProductDAO();
                                    ResultSet rs = Dao.getAllProduct2(infonum);
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td> <%=rs.getInt("ProductID")%></td>
                                    <td> <%=rs.getString("ProductName")%></td>
                                    <td> <%=rs.getInt("Price")%>$</td>
                                    <td> <%=rs.getInt("BrandID")%></td>
                                    <td> <%=rs.getInt("RatingID")%></td>
                                    <td> <%=rs.getString("ProductDes")%></td>  
                                    <td> <%=rs.getInt("Quantity")%></td>
                                    <td> <%=rs.getInt("Active")%></td>
                                    <td> <%=rs.getString("ProductImageURL")%></td>
                                    <td>
                                        <div class="text-center">
                                            <a href="/Product/Update/<%=rs.getInt("ProductID")%>" class="button-2" role="button"><i class="fa-solid fa-pen-nib"></i></a>
                                            <!-- HTML !-->
                                            <a onclick="return confirm('Confirm for deletion?');" href="/Product/Delete/<%=rs.getInt("ProductID")%>" class="button-1" role="button"><i class="fa-solid fa-trash"></i> </a>
                                        </div>
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
</html>
