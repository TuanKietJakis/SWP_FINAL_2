
<%@page import="DAOs.BrandDAO"%>
<%@page import="DAOs.CategoryDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ProductDAO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Product</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>


        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/StyleAdminPanel.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/button5.css">



    </head>
    <body>
    <body>
        <!-- SIDEBAR -->
      
         <%
                int usID = (int) session.getAttribute("AdminstratorID");
            %>
            <div class="order_list_container">
            <jsp:include page="/Admin_navigation.jsp">

                <jsp:param name="ID" value="<%=usID%>"/>
            </jsp:include>
        <section id="content">
            <!-- MAIN -->
            <main>

                <div class="headerBox" >
                    <label class="MP" style="width:300px">Admin's Product</label>

                    <label class="searchBox">
                        <input type='test' placeholder='Product name'/>
                        <div class="search">
                            Search
                        </div>
                    </label>
                    <div class="search">
                        Search
                    </div>
                </div>
                <% ProductDAO pDao = new ProductDAO();

                    int totalProducts = pDao.getTotalProductCount();

                %>

                <i class="AP" style="width: 200px">ALL PRODUCT</i>

                <div class="table-data">
                    <div class="order">
                        <div class="Header">
                            <div class="pHeader"><%= totalProducts%> product</div>
                            <label class="addNewBrand" onclick="location.href = '/addNewBrand'">Add new Brands</label>
                            <label class="addNewCategory"  onclick="location.href = '/addNewCategory'">Add new categories</label>
                            <label class="addNewProduct">Add new products</label>
                        </div>
                        <table id="example">

                            <thead>
                                <tr>
                                    <th style="padding-left: 20px">Product Name</th>
                                    <th>Brand</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Inventory</th>
                                    <th>Sold</th>
                                    <th>Operation</th>
                                </tr>
                            </thead>
                            <tbody>                               
                                <%
                                    ResultSet rs = pDao.getAllProduct();
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td style="padding-left: 20px"> 
                                        <img class="pImg" src="<%= rs.getString("ProductImageURL")%>" alt="alt"/>
                                        <%=rs.getString("ProductName")%>
                                    </td>
                                    <%
                                        int BrandID = rs.getInt("BrandID");
                                        BrandDAO bDao = new BrandDAO();
                                        ResultSet rs2 = bDao.getNameBrandByBrandID( BrandID);
                                        while (rs2.next()) {
                                    %>
                                    <td><%=rs2.getString("BrandName")%></td>
                                    <%}%>
                                    
                                    <%
                                        int CategoryID = rs.getInt("CategoryID");
                                        CategoryDAO cDao = new CategoryDAO();
                                        ResultSet rs3 = cDao.getCategoryNameByCategoryID(CategoryID);
                                        while (rs3.next()){
                                    %>
                                    <td><%=rs3.getString("CatName")%></td>
                                    <%}%>
                                    <td> <%=rs.getInt("Price")%></td>
                                    <td> <%=rs.getInt("Quantity")%></td>
                                    <td> <%=rs.getByte("Active")%></td>
                                    <td> <a class="info" href="/Product/View/<%=rs.getInt("CategoryID")%>"><b>Info ></b></a></td>
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
                            </div>
        <!-- CONTENT -->

        <script src="<%= request.getContextPath()%>/JavaScript/script.js"></script>
        <script src="https://kit.fontawesome.com/53d8d93477.js" crossorigin="anonymous"></script>
    </body>
</html>
