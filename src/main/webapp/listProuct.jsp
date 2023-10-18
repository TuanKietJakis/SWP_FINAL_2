<%-- 
    Document   : listProduct
    Created on : Sep 16, 2023, 11:41:15 PM
    Author     : ADMIN
--%>
<%@page import="DAOs.ProductDAO"%>
<%@page import="Models.tblProduct"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product's List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/CSS/listProduct.css"/>
    </head>
    <body>
        <%
            System.out.println(session.getAttribute("CustomerID"));
            int ID = 0;
            if (session.getAttribute("CustomerID") != null) {
                ID = (int) session.getAttribute("CustomerID");
            }
        %>

        <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=ID%>"/>
        </jsp:include>

        <div class="image2">
            <img width="1108px" height="460px" src="img/Back1.jpg" alt="" srcset="">

            <div class="sentence" style="position: absolute; width: 450px; height: 88px;">
                <p
                    style="color:#000; font-family: Inter; font-size: 36px; font-style: normal; font-weight: 400; line-height: normal;">
                    Explore a unique <br>
                    beautiful world of
                    <span
                        style="color:#FF66C4; font-family: Inter; font-size: 36px; font-style: normal; font-weight: 400; line-height: normal;">scents</span>
                </p>
            </div>

            <div class="explore" style="position: absolute; padding-top: 13px; color: #fff;">Explore now</div>
        </div>


        <!--list product-->
        <p style="margin-left: 250px; padding-top: 20px; padding-bottom: 20px; font-size: 20px"><b>All Products</b></p>
        <div class="container">
            <div class="row">
                <%
                    ProductDAO pDao = new ProductDAO();
                    ResultSet rs = pDao.getAllProduct();
                    while (rs.next()) {
                %>
                <div class="col-md-3">
                    <div class="pproduct_card item">
                                        <div class="pproduct_data_img">
                                            <button onclick="location.href = '/Shop/Detail'"><img src="<%=rs.getString("ProductImageURL")%>" alt=""></button>
                                            <form onsubmit="event.preventDefault()" class="pproduct_wishlist_ico">
                                                <button type="submit" class="i-color"><i class="fa-regular fa-heart "></i></button>
                                            </form>
                                            <form class="pproduct_addCart">
                                                <div class="input_flip">
                                                    <input type="submit" class="pproduct_addCart_btn" value="Add to cart">
                                                    <div class="input_back">
                                                        <i class="fa-solid fa-check"></i>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="pproduct_data_content">
                                            <div class="pproduct_data_des">
                                                <a href="#" class="pproduct_data_name"><%= rs.getString("ProductName")%></a>
                                                <p class="pproduct_data_price"><%= rs.getString("Price")%></p>
                                            </div>
                                        </div>
                                    </div>
                </div>
                <%
                    if (rs.getRow() % 4 == 0) {
                %>
            </div>
            <div class="row">
                <%
                        }
                    }
                %>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="/js/DangScript/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>
        <script src="/js/btnAddToCart.js"></script>
    </body>
</html>

