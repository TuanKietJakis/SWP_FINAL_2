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
        <link rel="stylesheet" href="/CSS/DangStyles/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="/CSS/DangStyles/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
        <link rel="stylesheet" href="/CSS/DangStyles/HomeStyle.css"/>
    </head>
    <body>
       <%
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("userID") && !cookie.getValue().equals("")) {
                            session.setAttribute("CustomerID", Integer.parseInt(cookie.getValue()));
                            break;
                        }
                    }
                }
        %>
        <%
            int ID = 0;
            if (session.getAttribute("CustomerID") != null) {
                ID = (int) session.getAttribute("CustomerID");
            }
        %>

        <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=ID%>"/>
        </jsp:include>

        <!--        <div class="image2">
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
                </div>-->
        <main class="main" id="main">
            <section class="home_section">
                <div class="home_addition_bg">
                    <div class="owl-carousel owl-theme home_container owl-loaded">
                        <!-- ========= item 1 =========== -->
                        <div class="item home_slide">
                            <div class="home_slide_content container">
                                <div class="home_slide_data">
                                    <h1 class="home_slide_subtitle ani_title1" style="animation-duration: 1000ms;">Most Popular Perfume & Cologne Brands</h1>
                                    <h1 class="home_slide_title ani_title1">Best Fragrances</h1>
                                    <p class="home_slide_des ani_title1" style="animation-duration: 1000ms;">
                                        Perfumor is the place where you can get high-quality fragrances
                                        <br> from certified consultants, who are not just professionals but
                                        <br> also talented masters.
                                    </p>
                                    <a href="#" class="home_slide_button ani_btn1">View collection</a>
                                </div>
                            </div>
                            <div class="home_slide_img1"><img src="/img/Back4.jpg"></div>
                        </div>
                        <!-- ========= item 2 =========== -->
                        <div class="item home_slide">
                            <div class="home_slide_content container">
                                <div class="home_slide_data">
                                    <h1 class="home_slide_subtitle ani_title2" style="animation-duration: 1000ms;">Most Popular Perfume & Cologne Brands</h1>
                                    <h1 class="home_slide_title ani_title2" style="animation-duration: 1500ms;">Best Fragrances</h1>
                                    <p class="home_slide_des ani_title2" style="animation-duration: 1700ms;">
                                        Perfumor is the place where you can get high-quality fragrances
                                        <br> from certified consultants, who are not just professionals but
                                        <br> also talented masters.
                                    </p>
                                    <a href="#" class="home_slide_button ani_btn2">View collection</a>
                                </div>
                            </div>
                            <div class="home_slide_img2"><img src="/img/Back2.jpg" alt=""></div>
                        </div>
                        <!-- ========= item 3 =========== -->
                        <div class="item home_slide">
                            <div class="home_slide_content container">
                                <div class="home_slide_data">
                                    <h1 class="home_slide_subtitle ani_title3" >Most Popular Perfume & Cologne Brands</h1>
                                    <h1 class="home_slide_title ani_title3" style="animation-duration: 1000ms">Best Fragrances</h1>
                                    <p class="home_slide_des ani_title3" style="animation-duration: 1000ms">
                                        Perfumor is the place where you can get high-quality fragrances
                                        <br> from certified consultants, who are not just professionals but
                                        <br> also talented masters.
                                    </p>
                                    <a href="#" class="home_slide_button ani_btn3">View collection</a>
                                </div>
                            </div>
                            <div class="home_slide_img3"><img src="/img/Back5.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- =========================== Product ================================== -->
            <section class="pproduct_section section">
                <div class="pproduct_container container">
                    <h1 class="pproduct_title">All Products</h1>
                    <div class="pproduct_content grid">
                         <input type="hidden" id="userID" value="<%=ID%>">

                    </div>
                        <div class="pproduct_getmore"><button id="btn-load-more">More Product</button></div>
                </div>
            </section>

        </main>
        <!--list product-->
        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="/js/DangScript/jquery.min.js"></script>
        <script src="/CSS/DangStyles/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>-->
        <!--<script src="/js/btnAddToCart.js"></script>-->
        <script src="/js/listProduct.js"></script>      
        <script src="/js/DangScript/Home.js"></script>      
    </body>
</html>

