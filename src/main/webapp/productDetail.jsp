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
        <script src="js/OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/docs_src/assets/vendors/jquery.min.js"></script>
        <script src="js/OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/docs/assets/owlcarousel/owl.carousel.min.js"></script>
        <link rel="stylesheet" href="js/OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css"/>
        <link rel="stylesheet" href="js/OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product's Detail</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="node_modules/bootstrap-social/bootstrap-social.css">
        <!--        <script src="js/OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/docs_src/assets/vendors/jquery.min.js"></script>
                <script src="js/OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/docs/assets/owlcarousel/owl.carousel.min.js"></script>-->
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/detailProduct.css"/>
    </head>    
    <body>
        <header>
            <div class="taskbar">
                <div class="logo"> <img src="img/Logo_img.png" alt=""></div>

                <div class="taskbar_link">
                    <a href="http://">Home</a>
                    <a href="http://">Shop Online</a>
                    <a href="http://">What's New</a>
                    <a href="http://">Contact</a>
                    <a chref="http://">About us</a>
                </div>

                <div class="taskbar_logo"><a href="http://"><img width="38px" height="37px" src="img/logoSearch.png" alt=""></a>
                    <a href="http://"><img width="38px" height="37px" src="img/logoStore.png" alt=""></a>
                </div>

                <div class="account">LHAnh <img src="img/logo3.png" width="30px" height="30px" alt=""></div>
            </div>
        </header

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
                        <h6>Retated Products</h6>



                        <section class="pproduct_section section">
                            <div class="pproduct_container container ">
                                <!--<h1 class="pproduct_title relate_title">Relate Product</h1>-->
                                <div class="owl-carousel owl-theme  owl-loaded retatedProduct_container"> 
                                    <div class="row">
                                        <% while (rs.next()) {%>

                                        <div class="col-md-3">
                                            <div class="item">
                                                <img src="<%= rs.getString("ProductImageURL")%>" class="card-img" alt="Product Image">
                                                <span id="addToCart">Add to cart</span>
                                                <div class="card-body">
                                                    <h5 class="card-name"><%= rs.getString("ProductName")%></h5>
                                                    <p class="card-price"><%= rs.getString("Price")%></p>
                                                </div>
                                            </div>
                                        </div>

                                        <%}%>
                                    </div>
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

                <footer>
                    <div>
                        <div>
                            <div style="width: 100px; height: 93px; padding-top: 76px;"> <img src="img/Logo_footer.png" alt=""></div>
                            <div style="width: 262px; height: 57px;color: #0D0D0D;
                                 font-family: Inter;
                                 font-size: 16px;
                                 font-style: normal;
                                 font-weight: 400;
                                 line-height: normal; padding-top: 70px; margin-left: 30px;padding-bottom: 187px;">Lorem Ipsum is simply dummy text <br> of the printing and typesetting <br> industry.
                            </div>
                        </div>
                    </div>

                    <div style="padding-top: 82px; margin-left: 50px;">
                        <span style="color: #FF9C00;
                              font-family: Inter;
                              font-size: 18px;
                              font-style: normal;
                              font-weight: 700;
                              line-height: normal; ;">Pages</span> <br> <br>
                        Home <br>
                        Shop Online <br>
                        Contact Us <br>
                        About us <br>
                        What's New <br>
                        Most Popular 
                    </div>

                    <div style="padding-top: 82px; margin-left: 70px;">
                        <span style="color: #FF9C00;
                              font-family: Inter;
                              font-size: 18px;
                              font-style: normal;
                              font-weight: 700;
                              line-height: normal; ;">Categories</span> <br> <br>
                        Category 1 <br>
                        Category 2 <br>
                        Category 3 <br>
                        Category 4 <br>
                        Category 5 <br>
                        Category 6 
                    </div>

                    <div style="padding-top: 82px; margin-left: 60px;">
                        <span style="font-family: Poppins;
                              font-size: 20px;
                              font-style: normal;
                              font-weight: 500;
                              line-height: 124.5%; /* 24.9px */
                              letter-spacing: 0.1px; color: #5e6282;">Discover our fanpage</span> <br>
                        <span> <img src="img/logoFooter.png" alt=""></span> <br>
                        <span>hoanganhle0203@gmail.com <br> +011 2 345 678 </span>
                    </div>

            </div>
        </footer>

        <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="js/btnDes_Rev.js"></script>
</body>
</html>
