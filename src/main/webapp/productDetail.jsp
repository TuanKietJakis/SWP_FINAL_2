<%-- 
    Document   : productDetail
    Created on : Oct 7, 2023, 1:56:28 PM
    Author     : ADMIN
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="/js/OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css"/>
        <link rel="stylesheet" href="/js/OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css"/>
        <!--        <link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css">-->
        <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/CSS/detailProduct.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product's Detail</title>
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

        <!--Product's Detail-->
        <div class="container">
            <div class="row">
                <%
                    ProductDAO pDao = new ProductDAO();
                    ResultSet rs = pDao.getAllProduct();
                    while (rs.next()) {
                %>
                <div class="col-md-12" style="padding-top: 90px;">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="<%= rs.getString("ProductImageURL")%>" class="card-img" style="width: 446px; height: 577px" alt="Product Image">
                        </div>
                        <div class="col-md-6">
                            <h5 id="card-name" class="card-name"><%= rs.getString("ProductName")%></h5>
                            <p id="card-price" class="card-price"><%= rs.getString("Price")%></p>
                            <p class="card-graph">Nulla eget sem vitae eros pharetra viverra.
                                Nam vitae luctus ligula. Mauris consequat ornare feugiat. </p> <br>
                            <table style="margin-left: 30px">
                                <tr>
                                    <td style="width: 90px">
                                        <p class="size_country">Size</P>
                                    </td>
                                    <td>
                                        <label class="label"><%= rs.getInt("Size")%></label>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 90px">
                                        <p class="size_country">Brand:</P>
                                    </td>
                                    <td>
                                        <label class="label"><%= rs.getString("BrandID")%></label>
                                    </td>
                                </tr>
                            </table>

                            <div>
                                <button class="decrease">-</button>
                                <input class="quantity" style="border: none; width: 45px; text-align: center" type="text" value="<%= rs.getString("Quantity")%>">
                                <button class="increase">+</button>

                                <button class="ADT">add to cart</button>
                            </div>
                        </div>
                        <div class="detail" style="margin-left: 15px;">
                            <div style="align-content: center">
                                <input class="description" type="button" value="Description" onclick="showDescription(this)">
                                <input class="review" type="button"  value="Review" onclick="showReview(this)">

                                <div class="sp-description"><%= rs.getString("ProductDes")%></div>
                                <div class="sp-review">So Good</div>
                            </div>
                        </div>

                        <div class="detail_2" style="margin-top: 99px" >
                            <input class="category" type="button"  value="Category: eau de perfume">
                        </div>

                        <!--/* ================= Retated Product=================== */-->

                        <section class="pproduct_section section maylike_section col-12">
                            <div class="pproduct_container container ">
                                <h6 class="pproduct_title">Retated Products</h6>
                                <div class="owl-carousel owl-theme mayLike_container">
                                    <!-- ================ Card 1 -->
                                    <% while (rs.next()) {%>
                                    <div class="pproduct_card item">
                                        <div class="pproduct_data_img">
                                            <button onclick="location.href = '#'"><img src="<%=rs.getString("ProductImageURL")%>" alt=""></button>
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
                                    <%}%>
                                </div>
                            </div>
                        </section>

                        <%
                            if (rs.getRow() % 2 == 0) {
                        %>
                        <div class="clearfix"></div>
                        <%
                            }
                        %>
                        <%
                            }
                        %>
                        <script>
                        </script>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="/js/DangScript/jquery.min.js"></script>
        <script src="/CSS/DangStyles/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>-->
        <script src="/js/btnDes_Rev.js"></script>
    </body>
</html>
