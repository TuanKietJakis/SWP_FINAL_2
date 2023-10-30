<%-- 
    Document   : productDetail
    Created on : Oct 7, 2023, 1:56:28 PM
    Author     : ADMIN
--%>

<%@page import="Models.tblProduct"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product's Detail</title>
        <link rel="stylesheet" href="/CSS/DangStyles/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="/CSS/DangStyles/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
        <link rel="stylesheet" href="/CSS/DangStyles/HomeStyle.css">
        <link rel="stylesheet" href="/CSS/detailProduct.css"/>
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
        <main class="main" id="main">
            <%
                tblProduct pro = (tblProduct) request.getAttribute("Product");
            %>
            <section class="product_section section">
                <div class="product_container container">
                    <div class="product_data">
                        <div class="product_data_img"><img src="<%=pro.getProductImageURL()%>" alt=""></div>
                        <div class="product_data_content_outer">
                            <div class="product_data_content">
                                <div class="product_d_c_info">
                                    <h1 class="product_d_c_name"><%=pro.getProductName()%></h1>
                                    <h2 class="product_d_c_price"><%=pro.getPrice()%></h2>
                                    <p class="product_d_c_subdes"><%=pro.getProductDes()%></p>
                                </div>
                                <div class="product_d_c_option">
                                    <div class="product_d_c_o_row">
                                        <p class="product_d_c_o_col1">Size</p>
                                        <p class="product_d_c_o_col2"><%=pro.getSize()%>ML</p>
                                    </div>
                                    <div class="product_d_c_o_row">
                                        <p class="product_d_c_o_col1">Brand</p>
                                        <p class="product_d_c_o_col2">Good Brand</p>
                                    </div>
                                    <div class="product_d_c_o_row">
                                        <p class="product_d_c_o_col1"></p>
                                        <div class="product_d_c_o_col">
                                            <div class="cart_t_i_quantity" data-quantity-id="1">
                                                <div class="value-button decrease">-
                                                </div>
                                                <input type="number" id="number1" class="quantity-input" value="1" />
                                                <div class="value-button increase">+
                                                </div>
                                            </div>
                                            <button class="product_d_c_o_addtoCart">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="descript_section section">
                <div class="descript_container container">
                    <div class="des_nav">
                        <h1 class="des_nav_list des_nav_des active">Description</h1>
                        <h1 class="des_nav_list des_nav_rev">Review</h1>
                    </div>
                    <div class="des_content">
                        <p class="des_content_active des_content_des active">Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.</p>
                        <div class="des_content_active des_content_rev">
                            <!-- ==================comment 1 ================-->   
                            <div class="inner">
                                <div class="des_content_rev_img">
                                    <img src="/img/Bloons 6のTwitterイラスト検索結果。.png" alt="">
                                </div>
                                <div class="des_content_rev_data">
                                    <div class="des_content_rev_header">
                                        <h1 class="des_content_rev_name">Ariana Grande</h1>
                                        <div class="dev_content_rev_star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="des_content_rev_des">
                                        Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
                                    </div>
                                </div>
                            </div>
                            <!-- ==================comment 1 ================-->   
                            <div class="inner">
                                <div class="des_content_rev_img">
                                    <img src="/img/Bloons 6のTwitterイラスト検索結果。.png" alt="">
                                </div>
                                <div class="des_content_rev_data">
                                    <div class="des_content_rev_header">
                                        <h1 class="des_content_rev_name">Ariana Grande</h1>
                                        <div class="dev_content_rev_star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="des_content_rev_des">
                                        Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
                                    </div>
                                </div>
                            </div>
                            <!-- ==================comment 1 ================-->   
                            <div class="inner">
                                <div class="des_content_rev_img">
                                    <img src="/img/Bloons 6のTwitterイラスト検索結果。.png" alt="">
                                </div>
                                <div class="des_content_rev_data">
                                    <div class="des_content_rev_header">
                                        <h1 class="des_content_rev_name">Ariana Grande</h1>
                                        <div class="dev_content_rev_star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="des_content_rev_des">
                                        Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="background_cate">
                Category: eau de perfume
            </div>

            <!-- ========================== May Like ============================== -->
            <section class="pproduct_section section maylike_section">
                <div class="pproduct_container container ">
                    <h1 class="pproduct_title">Related Products</h1>
                    <div class="owl-carousel owl-theme mayLike_container">
                        <%
                            ProductDAO pDao = new ProductDAO();
                            ResultSet rs2 = pDao.getAllProduct();
                            while (rs2.next()) {
                        %>
                        <!-- ================ Card 1 -->
                        <div class="pproduct_card item">
                            <div class="pproduct_data_img">
                                <div onclick="location.href = '#'" class="pproduct_data_img_inline"><img src="<%=rs2.getString("ProductImageURL")%>"
                                                                                                         alt=""></div>
                                <form onsubmit="event.preventDefault()" class="pproduct_wishlist_ico">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart "></i></button>
                                </form>
                                <div class="pproduct_addCart">
                                    <div class="input_flip">
                                        <button type="button" class="pproduct_addCart_btn" data-user-id="<%=ID%>">
                                            <i class="btn_icon_cart fa-solid fa-cart-shopping"></i>
                                            <i class="btn_icon_box fa-solid fa-parachute-box"></i>
                                            <span>Add to cart</span>
                                        </button>
                                        <input type="hidden" id="productID"  value="<%=rs2.getInt("ProductID")%>">
                                        <input type="hidden" id="action" name="action" value="addtoCart">
                                        <div class="input_back">
                                            <i class="fa-solid fa-check"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pproduct_data_content">
                                <div class="pproduct_data_des">
                                    <a href="#" class="pproduct_data_name"><%=rs2.getString("ProductName")%></a>
                                    <p class="pproduct_data_price">$<%=rs2.getInt("Price")%></p>
                                </div>
                            </div>
                        </div>
                        <%

                            }
                        %>

                    </div>
                </div>
            </section>
        </main>
        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="/js/DangScript/jquery.min.js"></script>
        <script src="/CSS/DangStyles/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
        <script src="/js/btnDes_Rev.js"></script>
        <script src="/js/DangScript/Home.js"></script>
    </body>
</html>
