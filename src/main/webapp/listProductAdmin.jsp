<%-- 
    Document   : Admin_Dashboard
    Created on : Oct 24, 2023, 11:19:57 PM
    Author     : khoic
--%>

<%@page import="DAOs.ProductDAO"%>
<%@page import="DAOs.CategoryDAO"%>
<%@page import="DAOs.BrandDAO"%>
<%@page import="DAOs.CategoryDAO"%>
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
        <link rel="stylesheet" href="/CSS/admindashboard.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/StyleAdminPanel.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/button5.css">
        <title>JSP Page</title>
    </head>

    <body>
        <%
            int usID = (int) session.getAttribute("AdminstratorID");

        %>

        <div class="container">
            <jsp:include page="Admin_navigation.jsp">
                <jsp:param name="ID" value="<%=usID%>"/>
            </jsp:include>             
            <div class="admin_background">

            </div>
            <div class="admin_info grid-item">
                <jsp:include page="Admin_anlyzes.jsp"></jsp:include>
                    <!--                    <div class="admin_content">-->
                    <!--                        <div>-->
                    <div class="order_list_container">
                        <section id="content">
                            <main>
                            <% ProductDAO pDao = new ProductDAO();

                                int totalProducts = pDao.getTotalProductCount();

                            %>
                            <div class="table-data">
                                <div class="order">
                                    <div class="Header">
                                        <div class="pHeader"><%= totalProducts%> product</div>
                                        <label class="addNewBrand" onclick="location.href = '/addNewBrand'">Add new Brands</label>
                                        <label class="addNewCategory"  onclick="location.href = '/addNewCategory'">Add new categories</label>
                                        <label class="addNewProduct" onclick="location.href = '/Admin/Product/addNewProduct'">Add new products</label>
                                    </div>
                                    <div class="table_example">
                                        <table id="example">

                                            <thead>
                                                <tr>
                                                    <th style="">Product Name</th>
                                                    <th>Brand</th>
                                                    <th>Category</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Active</th>
                                                    <th>Operation</th>
                                                </tr>
                                            </thead>
                                            <tbody>                               
                                                <%
                                                    ResultSet rs = pDao.getAllProduct();
                                                    while (rs.next()) {
                                                %>
                                                <tr>
                                                    <td style="text-align: center"> 
                                                        <img class="pImg" src="<%= rs.getString("ProductImageURL")%>" alt="alt"/>
                                                        <%=rs.getString("ProductName")%>
                                                    </td>
                                                    <%
                                                        int BrandID = rs.getInt("BrandID");
                                                        BrandDAO bDao = new BrandDAO();
                                                        ResultSet rs2 = bDao.getNameBrandByBrandID(BrandID);
                                                        while (rs2.next()) {
                                                    %>
                                                    <td style="text-align: center"><%=rs2.getString("BrandName")%></td>
                                                    <%}%>

                                                    <%
                                                        int CategoryID = rs.getInt("CategoryID");
                                                        CategoryDAO cDao = new CategoryDAO();
                                                        ResultSet rs3 = cDao.getCategoryNameByCategoryID(CategoryID);
                                                        while (rs3.next()) {
                                                    %>
                                                    <td style="text-align: center"><%=rs3.getString("CatName")%></td>
                                                    <%}%>
                                                    <td style="text-align: center"> <%=rs.getInt("Price")%></td>
                                                    <td style="text-align: center"> <%=rs.getInt("Quantity")%></td>
                                                    <td style="text-align: center"> <%=rs.getByte("Active")%></td>
                                                    <td style="text-align: center"> <a class="info" href="/Product/View/<%=rs.getInt("CategoryID")%>"><b>Info ></b></a></td>
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
                    </section>
                </div>
            </div>
        </div>
        <!--            </div>
                </div>-->
        <script src="js/Admin_dashboard.js"></script>



    </body>
</html>