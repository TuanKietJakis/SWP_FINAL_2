<%-- 
    Document   : listProduct
    Created on : Sep 16, 2023, 11:41:15 PM
    Author     : ADMIN
--%>
<%@page import="DAOs.CategoryDAO"%>
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
        <style>
            label{
                cursor: pointer;
                &:hover{
                    text-decoration: underline;
                }
            }
        </style>
        <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=ID%>"/>
        </jsp:include>

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
            <%
                String regex = (String) request.getAttribute("inputValue");
                if (regex == null || regex == "") {
                    response.sendRedirect("/Shop");
                }
            %>
            <!-- =========================== Product ================================== -->
            <section class="pproduct_section section">
            <input type="text" id="regex" value="<%=regex%>..." hidden/>
                <div class="pproduct_container container">
                    <div class="filter_container">
                        <div class="filter_list_chip">
<!--                            <div class="filter_item_chip">
                                <span class="filter_item_chip_name">
                                    p..
                                </span>
                                <i class="fa-solid fa-xmark"></i>
                            </div>-->
<!--                            <div class="filter_item_chip">
                                <span class="filter_item_chip_name">
                                    Category 1
                                </span>
                                <i class="fa-solid fa-xmark"></i>
                            </div>
                            <div class="filter_item_chip">
                                <span class="filter_item_chip_name">
                                    Brand 1
                                </span>
                                <i class="fa-solid fa-xmark"></i>
                            </div>-->
                        </div>
                        <div class="filter_list_menu">
                            <!-- ============== Item 1 ================= -->
                            <div class="filter_list_menu_item">
                                <h1 class="filter_list_menu_header">Category</h1>
                                <ul class="filter_list_menu_body">
                                    <%
                                    CategoryDAO dao = new CategoryDAO();
                                    ResultSet rsCate = dao.GetAllCategory();
                                    while(rsCate.next()){
                                    %>
                                    <li class="filter_list_menu_body_link"><i class="fa-solid fa-inbox"></i> <label for="c<%=rsCate.getInt("CategoryID")%>"><%=rsCate.getString("CatName")%></label></li>
                                    <input type="checkbox" id="c<%=rsCate.getInt("CategoryID")%>" name="category" data-name="<%=rsCate.getString("CatName")%>" value="<%=rsCate.getInt("CategoryID")%>" hidden/>
                                    <%
                                        }
                                    %>
                                </ul>
                            </div>
                            <!-- ============== Item 1 ================= -->
                            <div class="filter_list_menu_item">
                                <h1 class="filter_list_menu_header">Brand</h1>
                                <ul class="filter_list_menu_body">
                                    <%
                                    ResultSet rsBrand = dao.GetAllBrand();
                                    while(rsBrand.next()){
                                    %>
                                    <li class="filter_list_menu_body_link"><i class="fa-solid fa-tag"></i> <label for="b<%=rsBrand.getInt("BrandID")%>"><%=rsBrand.getString("BrandName")%></label></li>
                                    <input type="checkbox" id="b<%=rsBrand.getInt("BrandID")%>" name="brand" data-name="<%=rsBrand.getString("BrandName")%>" value="<%=rsBrand.getInt("BrandID")%>" hidden/>
                                    <%}%>
                                </ul>
                            </div>
                            <!-- ============== Item 1 ================= -->
                            <div class="filter_list_menu_item">
                                <h1 class="filter_list_menu_header">Price</h1>
                                <ul class="filter_list_menu_body">
                                    <li class="filter_list_menu_body_link"><i class="fa-solid fa-arrow-up-1-9"></i><label for="price-lowtohigh"> Low to High</label></li>
                                                                        <input type="radio" id="price-lowtohigh" name="pricesort" data-name="Low To High" value="lowtohigh" hidden/>
                                    <li class="filter_list_menu_body_link"><i class="fa-solid fa-arrow-up-9-1"></i> <label for="price-hightolow">High to Low</label></li>
                                                                        <input type="radio" id="price-hightolow" name="pricesort" data-name="High To Low" value="hightolow" hidden/>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <%
                        ProductDAO pDAO = new ProductDAO();
                        ResultSet rs1 = pDAO.getSearchProductnolimit(regex);
                        if (!rs1.next()) {
                    %>
                    <h1 class="pproduct_title" style="font-weight: 500">No Result for <Span style="font-weight: 600"><%=regex%></Span>...</h1>
                    <div class="pproduct_content grid">
                    </div>
                    <%
                    } else {
                    %>
                    <h1 class="pproduct_title" style="font-weight: 500">Search Result for <Span style="font-weight: 600"><%=regex%></Span>...</h1>
                    <div class="pproduct_content grid">
                        <!-- ================ Card 1 -->
                        <div class="pproduct_card">
                            <div class="pproduct_data_img" onmouseenter="checkLove(this)">
                                <div onclick="location.href = '/Shop/Detail/<%=rs1.getInt("ProductID")%>'" class="pproduct_data_img_inline"><img src="<%=rs1.getString("ProductImageURL")%>"
                                                                                                                                                 alt=""></div>
                                <div class="pproduct_wishlist_ico" onclick="AddtoWishlist(this)" data-user-id="<%=ID%>" data-product-id="<%=rs1.getInt("ProductID")%>">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart "></i></button>
                                </div>
                                <div class="pproduct_addCart">
                                    <div class="input_flip">
                                        <button type="button" class="pproduct_addCart_btn" onclick="AddtoCart(this)" data-user-id="<%=ID%>" data-product-id="<%=rs1.getInt("ProductID")%>">
                                            <i class="btn_icon_cart fa-solid fa-cart-shopping"></i>
                                            <i class="btn_icon_box fa-solid fa-parachute-box"></i>
                                            <span>Add to cart</span>
                                        </button>
                                        <input type="hidden" id="productID"  value="<%=rs1.getInt("ProductID")%>">
                                        <input type="hidden" id="action" name="action" value="addtoCart">
                                        <div class="input_back">
                                            <i class="fa-solid fa-check"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pproduct_data_content">
                                <div class="pproduct_data_des">
                                    <a href="/Shop/Detail/<%=rs1.getInt("ProductID")%>" class="pproduct_data_name"><%=rs1.getString("ProductName")%></a>
                                    <p class="pproduct_data_price">$<%=rs1.getInt("Price")%></p>
                                </div>
                            </div>
                        </div>
                        <%
                            while (rs1.next()) {
                        %>
                        <!-- ================ Card 1 -->
                        <div class="pproduct_card">
                            <div class="pproduct_data_img" onmouseenter="checkLove(this)">
                                <div onclick="location.href = '/Shop/Detail/<%=rs1.getInt("ProductID")%>'" class="pproduct_data_img_inline"><img src="<%=rs1.getString("ProductImageURL")%>"
                                                                                                                                                 alt=""></div>
                                <div class="pproduct_wishlist_ico" onclick="AddtoWishlist(this)" data-user-id="<%=ID%>" data-product-id="<%=rs1.getInt("ProductID")%>">
                                    <button type="button" class="i-color"><i class="fa-regular fa-heart "></i></button>
                                </div>
                                <div class="pproduct_addCart">
                                    <div class="input_flip">
                                        <button type="button" class="pproduct_addCart_btn" onclick="AddtoCart(this)" data-user-id="<%=ID%>" data-product-id="<%=rs1.getInt("ProductID")%>">
                                            <i class="btn_icon_cart fa-solid fa-cart-shopping"></i>
                                            <i class="btn_icon_box fa-solid fa-parachute-box"></i>
                                            <span>Add to cart</span>
                                        </button>
                                        <input type="hidden" id="productID"  value="<%=rs1.getInt("ProductID")%>">
                                        <input type="hidden" id="action" name="action" value="addtoCart">
                                        <div class="input_back">
                                            <i class="fa-solid fa-check"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pproduct_data_content">
                                <div class="pproduct_data_des">
                                    <a href="/Shop/Detail/<%=rs1.getInt("ProductID")%>" class="pproduct_data_name"><%=rs1.getString("ProductName")%></a>
                                    <p class="pproduct_data_price">$<%=rs1.getInt("Price")%></p>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>

                    </div>
                    <div class="pproduct_getmore"><button id="btn-load-more">More Product</button></div>
                    <%
                        }
                    %>
            </section>

        </main>
        <!--list product-->
        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="/js/DangScript/jquery.min.js"></script>
        <script src="/CSS/DangStyles/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>-->
        <!--<script src="/js/btnAddToCart.js"></script>-->
        <script src="/js/DangScript/Home.js"></script>    
        <script src="/js/DangScript/FilterProduct.js"></script>    

    </body>
</html>

