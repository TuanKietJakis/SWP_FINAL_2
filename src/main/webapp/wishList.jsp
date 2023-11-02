<%-- 
    Document   : wishList.jsp
    Created on : Oct 18, 2023, 11:31:55 AM
    Author     : ddand
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.WishListDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>WishList Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="/CSS/MyStyle/wishList.css">
    </head>

    <body>
        <%
            int ID = 0;
            if (session.getAttribute("CustomerID") != null) {
                ID = (int) session.getAttribute("CustomerID");
            }
        %>
        <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=ID%>"/>
        </jsp:include>

        <main class="main">
            <div class="section_title">
                <h1 class="cart_title">Wish List</h1>
                <h2 class="cart_subtitle">The Things You Wish Here</h2>
            </div>
            <section class="container cart_container">
                <div class="cart_table">
                    <div class="cart_t_header">
                        <h1 class="cart_h_title col-product" style="padding-left: 4px;">Product</h1>
                        <h1 class="cart_h_title col-price" style="padding-left: 11px;">Price</h1>
                        <h1 class="cart_h_title col-remove">Add to cart</h1>
                        <h1 class="cart_h_title col-remove" style="padding-left: 50px;">Remove</h1>
                    </div>

                    <div class="cart_t_frame">
                        <%
                            /*ID = (int) request.getSession().getAttribute("CustomerID");
                            WishListDAO wDAO = new WishListDAO();                       
                            ResultSet rs = wDAO.GetAll(ID);*/
                            ResultSet rs = (ResultSet) request.getAttribute("list");
                            while (rs.next()) {
                        %>
                        <!-- ====================== item 1 ================== -->
                        <div class="cart_t_item">

                            <div class="cart_t_i_content col-product">
                                <a href="/Shop/Detail/<%= rs.getInt("ProductId")%>" style="display: flex"> 
                                    <div class="cart_t_i_img" style="margin-right: 10px">
                                        <img src="<%= rs.getString("ProductImageURL")%>" alt="">
                                    </div>
                                    <div class="cart_t_i_data">
                                        <h1 class="cart_t_i_title"><%= rs.getString("ProductName")%></h1>
                                        <p class="cart_t_i_subtitle"><%= rs.getString("CatName")%></p>
                                    </div>
                                </a>
                            </div>
                            <h1 class="cart_t_i_price col-price">$<%= rs.getInt("ProductPrice")%></h1>


                            <div class="cart_add">
                                <button class="cart_t_i_func">
                                    <i class="fa-solid fa-cart-plus fa-lg" style="margin-right: 2px;"></i>
                                    <span style="font-size: 14px; margin-left: 2px;"><a href="/Cart/Add/<%= rs.getInt("ProductId")%>/<%= rs.getInt("Quantity")%>" style="color: white">Add to cart</a></span>
                                </button>
                            </div>
                            <div style="padding-left: 55px; margin-bottom: 10px;">
                                <div style="text-align: center; font-size: x-small; margin-left: 1rem;" class="remove">
                                    <a onclick="return confirm('Are you sure to get it out of the wishlist?');" href="/wishlist/delete/<%= rs.getInt("WishListId")%>">Remove</a>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                </div>  
            </section>
        </main>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="/js/MyScript/wishList.js"></script>
        <script src="/js/DangScript/Header.js"></script>
        <!--<script src="footer.js"></script>-->
        <script src="/js/DangScript/jquery.min.js"></script>
    </body>

</html>
