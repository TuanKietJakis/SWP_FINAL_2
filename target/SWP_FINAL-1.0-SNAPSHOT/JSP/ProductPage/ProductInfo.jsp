<%-- 
    Document   : MyStore
    Created on : Jun 2, 2023, 8:40:36 AM
    Author     : User
--%>

<%@page import="DAOs.RatingDAO"%>
<%@page import="DAOs.BrandDAO"%>
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
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="/CSS/admindashboard.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/StyleAdminPanel.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/button5.css">
    </head>
    <body>
    <body>
        <%
            int usID = (int) session.getAttribute("AdminstratorID");

        %>

        <div class="container">
            <jsp:include page="/Admin_navigation.jsp">
                <jsp:param name="ID" value="<%=usID%>"/>
            </jsp:include>             
            <div class="admin_background">

            </div>
            <div class="admin_info grid-item">
                <jsp:include page="/Admin_anlyzes.jsp"></jsp:include>
                    <!--                    <div class="admin_content">-->
                    <!--                        <div>-->
                    <div class="order_list_container">
                        <section id="content">
                            <main>

                                <div class="table-data" style="">
                                    <div class="order" style="padding-bottom:  42px">
                                        <div class="head">
                                            <div>
                                                <i class='bx bx-chevron-right' ></i>
                                                <a href="/Admin/Product/List">Back</a>                          
                                            </div>
                                        </div>
                                        <div class="table_example">
                                            <table id="example">
                                                <thead>
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Price</th>
                                                        <th>Brand</th>
                                                        <th>Category</th>                                                 
                                                        <th>Quantity</th>
                                                        <th>Active</th>
                                                        <th>Image</th>
                                                    </tr>
                                                </thead>
                                                <tbody>                               
                                                <%
                                                    ProductDAO pDao = new ProductDAO();
                                                    ResultSet rs = pDao.getAllProduct();
                                                    while (rs.next()) {
                                                %>
                                                <tr>
                                                    <td class="tdName" style=""><%= rs.getString("ProductName")%></td>
                                                    <td class="tdPrice"><%= rs.getInt("Price")%>$</td>
                                                    <%
                                                        int BrandID = rs.getInt("BrandID");
                                                        BrandDAO bDao = new BrandDAO();
                                                        ResultSet rs2 = bDao.getNameBrandByBrandID(BrandID);
                                                        while (rs2.next()) {
                                                    %>
                                                    <td class="tdBrand"><%= rs2.getString("BrandName")%></td>
                                                    <%}%>
                                                    <%
                                                        int CategoryID = rs.getInt("CategoryID");
                                                        CategoryDAO cDao = new CategoryDAO();
                                                        ResultSet rs3 = cDao.getCategoryNameByCategoryID(CategoryID);
                                                        while (rs3.next()) {
                                                    %>
                                                    <td class="tdCat"><%= rs3.getString("CatName")%></td>
                                                    <%}%>
                                                    

                                                    <td class="tdQuantity"><%= rs.getInt("Quantity")%></td>

                                                    <%
                                                        byte active1 = rs.getByte("Active");
                                                        String active = "";
                                                        if (active1 == 1) {
                                                            active = "available";
                                                        } else {
                                                            active = "unavailable";
                                                        }
                                                    %>
                                                    <td style="text-align: center"> <%=active%></td>

                                                    <td class="tdImg"><img src="<%= rs.getString("ProductImageURL")%>" /></td>
                                                </tr>



                                                <tr style="border-bottom: 1px solid black">
                                                    <th>Description</th>
                                                    <td colspan="6"><%= rs.getString("ProductDes")%></td>
                                                    <td colspan="2">
                                                        <div class="text-center">
                                                            <a href="/Product/Update/<%= rs.getInt("ProductID")%>" class="button-2" role="button"><i class="fa-solid fa-pen-nib"></i> Update</a>
                                                            <a onclick="return confirm('Confirm for deletion?');" href="/Product/Delete/<%= rs.getInt("ProductID")%>" class="button-1" role="button"><i class="fa-solid fa-trash"></i> Delete</a>
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
                            </div>              
                        </main>
                        <!-- MAIN -->
                    </section>
                    <!-- CONTENT -->
                </div>
            </div>
        </div>

        <script src="<%= request.getContextPath()%>/JavaScript/script.js"></script>
        <script src="https://kit.fontawesome.com/53d8d93477.js" crossorigin="anonymous"></script>
    </body>
</html>
