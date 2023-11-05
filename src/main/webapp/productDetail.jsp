<%-- 
    Document   : productDetail
    Created on : Oct 7, 2023, 1:56:28 PM
    Author     : ADMIN
--%>

<%@page import="DAOs.CartDAO"%>
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
        <%
            int AmountFromCart = 0;
        %>
        <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=ID%>"/>
        </jsp:include>
        <main class="main" id="main">
            <%
                tblProduct pro = (tblProduct) request.getAttribute("Product");
                if (session.getAttribute("CustomerID") != null) {
                    CartDAO dao = new CartDAO();
                    AmountFromCart = dao.getAmountFromCart(pro.getProductID(), ID);
                }
            %>
            <section class="product_section section">
                <div class="product_container container">
                    <div class="product_data">
                        <div class="product_data_img"><img src="<%=pro.getProductImageURL()%>" alt=""></div>
                        <div class="product_data_content_outer">
                            <div class="product_data_content">
                                <div class="product_d_c_info">
                                    <h1 class="product_d_c_name"><%=pro.getProductName()%></h1>
                                    <h2 class="product_d_c_price">$ <%=pro.getPrice()%></h2>
                                    <p class="product_d_c_subdes"><%=pro.getProductDes()%></p>
                                </div>
                                <div class="product_d_c_option">
                                    <div class="product_d_c_o_row">
                                        <p class="product_d_c_o_col1">Brand<span>:</span></p>
                                        <p class="product_d_c_o_col2"><span onclick="location.href = '#'"><%=pro.getBrandName()%></span></p>
                                    </div>
                                    <div class="product_d_c_o_row">
                                        <p class="product_d_c_o_col1">Category<span>:</span></p>
                                        <p class="product_d_c_o_col2"><span onclick="location.href = '#'"><%=pro.getCatName()%></span></p>
                                    </div>
                                    <div class="product_d_c_o_row" style="margin-top: 18px;">
                                        <div class="product_d_c_o_col1">
                                            <div class="cart_t_i_quantity" data-quantity-id="1">
                                                <div class="value-button decrease">-
                                                </div>
                                                <input type="number" id="number1" class="quantity-input" value="1" onkeydown="return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 8"/>
                                                <div class="value-button increase">+
                                                </div>
                                            </div></div>
                                        <div class="product_d_c_o_col">
                                            <button class="product_d_c_o_addtoCart" data-user-id="<%=ID%>">Add To Cart</button>
                                            <p class="showQuan"><span><%=pro.getQuantity()%></span> Avalaible</p>
                                            <input type="hidden" id="productID"  value="<%=pro.getProductID()%>">
                                            <input type="hidden" id="AmountFromCart"  value="<%=AmountFromCart%>">
                                            <input type="hidden" id="StoreQuan"  value="<%=pro.getQuantity()%>">
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
                            <%
                                ProductDAO pdao = new ProductDAO();
                                ResultSet rs = pdao.GetProductRating(pro.getProductID());
                                if (rs.next()) {
                            %>
                            <!-- ==================comment 1 ================-->   
                            <div class="inner">
                                <div class="des_content_rev_img">
                                    <%
                                        if (rs.getInt("RateNumber") == 5) {
                                    %>
                                    <img src="/img/wd1.jpg" alt="">
                                    <%
                                    } else if (rs.getInt("RateNumber") < 5 && rs.getInt("RateNumber") > 3) {
                                    %>
                                    <img src="/img/Bloons 6のTwitterイラスト検索結果。.png" alt="">
                                    <%
                                    } else {
                                    %>
                                    <img src="/img/Group 2527.svg" alt="">
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="des_content_rev_data">
                                    <div class="des_content_rev_header">
                                        <h1 class="des_content_rev_name"><%=rs.getString("FullName")%></h1>
                                        <div class="dev_content_rev_star">
                                            <%
                                                int n = 0;
                                                n = rs.getInt("RateNumber");
                                                for (int i = 0; i < 5; i++) {
                                                    if (n > 0) {
                                            %>
                                            <i class="fa-solid fa-star"></i>
                                            <%
                                                n--;
                                            } else {
                                            %>  
                                            <i class="fa-regular fa-star"></i>
                                            <%
                                                    }
                                                }
                                            %>
                                        </div>
                                    </div>
                                    <div class="des_content_rev_des">
                                        <%=rs.getString("RateDes")%>
                                    </div>
                                </div>
                            </div>
                            <%
                                while (rs.next()) {
                            %>
                            <!-- ==================comment 1 ================-->   
                            <div class="inner">
                                <div class="des_content_rev_img">
                                    <%
                                        if (rs.getInt("RateNumber") == 5) {
                                    %>
                                    <img src="/img/wd1.jpg" alt="">
                                    <%
                                    } else if (rs.getInt("RateNumber") < 5 && rs.getInt("RateNumber") > 3) {
                                    %>
                                    <img src="/img/Bloons 6のTwitterイラスト検索結果。.png" alt="">
                                    <%
                                    } else {
                                    %>
                                    <img src="/img/Group 2527.svg" alt="">
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="des_content_rev_data">
                                    <div class="des_content_rev_header">
                                        <h1 class="des_content_rev_name"><%=rs.getString("FullName")%></h1>
                                        <div class="dev_content_rev_star">
                                            <%
                                                n = rs.getInt("RateNumber");
                                                for (int i = 0; i < 5; i++) {
                                                    if (n > 0) {
                                            %>
                                            <i class="fa-solid fa-star"></i>
                                            <%
                                                n--;
                                            } else {
                                            %>  
                                            <i class="fa-regular fa-star"></i>
                                            <%
                                                    }
                                                }
                                            %>
                                        </div>
                                    </div>
                                    <div class="des_content_rev_des">
                                        <%=rs.getString("RateDes")%>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            } else {
                            %>
                            <div class="inner">
                                Hope you have the product and leave a comment for this
                            </div>
                            <%
                                }
                            %>

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
                            int n = 0;
                            while (rs2.next() && n < 6) {
                        %>
                        <!-- ================ Card 1 -->
                        <div class="pproduct_card item">
                            <div class="pproduct_data_img" onmouseenter="checkLove(this)">
                                <div onclick="location.href = '/Shop/Detail/<%=rs2.getInt("ProductID")%>'" class="pproduct_data_img_inline"><img src="<%=rs2.getString("ProductImageURL")%>"
                                                                                                                                                 alt=""></div>
                                <div class="pproduct_wishlist_ico" onclick="AddtoWishlist(this)" data-user-id="<%=ID%>" data-product-id="<%=rs2.getInt("ProductID")%>">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart "></i></button>
                                </div>
                                <div class="pproduct_addCart">
                                    <div class="input_flip">
                                        <button type="button" class="pproduct_addCart_btn" onclick="AddtoCart(this)" data-user-id="<%=ID%>" data-product-id="<%=rs2.getInt("ProductID")%>">
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
                                    <a href="/Shop/Detail/<%=rs2.getInt("ProductID")%>" class="pproduct_data_name"><%=rs2.getString("ProductName")%></a>
                                    <p class="pproduct_data_price">$<%=rs2.getInt("Price")%></p>
                                </div>
                            </div>
                        </div>
                        <%
                                n++;
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
        <script src="/js/DangScript/productDetail.js"></script>
    </body>
</html>
