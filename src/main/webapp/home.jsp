<%-- 
    Document   : home.jsp
    Created on : Oct 3, 2023, 9:05:52 PM
    Author     : Kiet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <link rel="stylesheet" href="CSS/DangStyles/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="CSS/DangStyles/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
        <link rel="stylesheet" href="CSS/DangStyles/HomeStyle.css">
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
                            <div class="home_slide_img1"><img src="img/Back4.jpg"></div>
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
                            <div class="home_slide_img2"><img src="img/Back2.jpg" alt=""></div>
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
                            <div class="home_slide_img3"><img src="img/Back5.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="home_img1"><img src="img/e9a9b60fc6 1.png" alt="">
                    </div>
                    <div class="home_img0"><img src="img/3c5f5ccab1825d270129dce586a85752-removebg-preview.png" alt="">
                    </div>
                    <div class="home_img2"><img src="img/3c5f5ccab1825d270129dce586a85752-removebg-preview.png" alt="">
                    </div>
                </div>
            </section>
            <!-- ======================= Shop Now ======================= -->
            <section class="shopnow_section section">
                <div class="shopnow_container container">
                    <div class="shopnow_flex">
                        <div class="shopnow_image_area">
                            <div class="shopnow_pic1" data-aos="fade-up" data-aos-duration="2000">
                                <img src="img/the-perfume-shop-joop-homme.jpg" alt="">
                            </div>
                            <div class="shopnow_pic2" data-aos="fade-down" data-aos-duration="2000">
                                <img src="img/Pic1.jpg" alt="">
                            </div>
                        </div>
                        <div class="shopnow_content">
                            <!-- <div class="shopnow_icon"><i class="fa-solid fa-store"></i></div> -->
                            <div class="shopnow_intro">
                                <h1 class="shopnow_title">Why Our Clients Choose Us</h1>
                                <p class="shopnow_des">Lorem Ipsum is simply dummy text of the printing <br> and typesetting
                                    industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                            </div>
                            <button class="shopnow_btn button">Read More</button>
                        </div>

                    </div>
                </div>
            </section>
            <!-- ======================== Section High quality ======================= -->
            <section class="advertOne_section section">
                <div class="advertOne_bg">
                    <div class="arrival_container container">
                        <h1 class="advertOne_title">
                            High-Quality Fragrances <br>
                            By Famous Brands
                        </h1>
                        <p class="advertOne_des1">
                            Established in 1999, Perfumor is here to open you an absolutely <br>
                            new world, full of sensuality and positive emotions.
                        </p>
                        <p class="advertOne_des2">
                            We are the largest fragrance retailer with over 260 stores <br>
                            nationwide, selling all major designer fragrance brands, classic <br>
                            and celebrity perfumes at very affordable prices.
                        </p>
                        <div class="advertOnt_signature">
                            <img src="img/signature.png" alt="">
                        </div>
                    </div>
                </div>
            </section>
            <!-- ========================= Category ===================== -->
            <section class="category_section section">
                <div class="cate_container container">
                    <h1 class="cate_title">Top Categories</h1>
                    <div class="cate_content grid">
                        <!-- ===== data 1 ====== -->
                        <div class="cate_flip">
                            <div class="cate_card">
                                <div class="cate_data i1 cate_front">
                                    <h1 class="cate_data_title">Perfume or Parfum</h1>
                                    <div class="cate_data_img">
                                        <img src="img/4.png" alt="">
                                    </div>
                                </div>
                                <div class="cate_back">
                                    <div class="cate_btn">
                                        <a href="#" class="cate_back_link">View Detail</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- ===== data 2 ====== -->
                        <div class="cate_flip">
                            <div class="cate_card">
                                <div class="cate_data i2 cate_front">
                                    <h1 class="cate_data_title">Perfume or Parfum</h1>
                                    <div class="cate_data_img">
                                        <img src="img/5.png" alt="">
                                    </div>
                                </div>
                                <div class="cate_back">
                                    <div class="cate_btn">
                                        <a href="#" class="cate_back_link">View Detail</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ===== data 3 ====== -->
                        <div class="cate_flip">
                            <div class="cate_card">
                                <div class="cate_data i3 cate_front">
                                    <h1 class="cate_data_title">Perfume or Parfum</h1>
                                    <div class="cate_data_img">
                                        <img src="img/6.png" alt="">
                                    </div>
                                </div>
                                <div class="cate_back">
                                    <div class="cate_btn">
                                        <a href="#" class="cate_back_link">View Detail</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ===== data 4 ====== -->
                        <div class="cate_flip">
                            <div class="cate_card">
                                <div class="cate_data i4 cate_front">
                                    <h1 class="cate_data_title">Perfume or Parfum</h1>
                                    <div class="cate_data_img">
                                        <img src="img/1.png" alt="">
                                    </div>
                                </div>
                                <div class="cate_back">
                                    <div class="cate_btn">
                                        <a href="#" class="cate_back_link">View Detail</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ===== data 5 ====== -->
                        <div class="cate_flip">
                            <div class="cate_card">
                                <div class="cate_data i5 cate_front">
                                    <h1 class="cate_data_title">Perfume or Parfum</h1>
                                    <div class="cate_data_img">
                                        <img src="img/2.png" alt="">
                                    </div>
                                </div>
                                <div class="cate_back">
                                    <div class="cate_btn">
                                        <a href="#" class="cate_back_link">View Detail</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ===== data 6 ====== -->
                        <div class="cate_flip">
                            <div class="cate_card">
                                <div class="cate_data i6 cate_front">
                                    <h1 class="cate_data_title">Perfume or Parfum</h1>
                                    <div class="cate_data_img">
                                        <img src="img/3.png" alt="">
                                    </div>
                                </div>
                                <div class="cate_back">
                                    <div class="cate_btn">
                                        <a href="#" class="cate_back_link">View Detail</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- ========================== User comment ========================== -->
            <section class="comment_section section">
                <div class="comment_addtion_background">
                    <div class=" owl-carousel owl-theme comment_container container">
                        <!-- ================== User 1 ============== -->
                        <div class="item comment_item">
                            <div class="comment_item_data">
                                <div class="comment_item_data_qoute">
                                    <div class="comment_item_img">
                                        <img src="img/Bloons 6のTwitterイラスト検索結果。.png" alt="">
                                    </div>
                                    <div class="quote_icon"><i class="fa-solid fa-quote-left"></i></div>
                                </div>
                                <div class="comment_item_content">
                                    <p class="comment_item_des">
                                        Working in conjunction with humanitarian aid agencies, we have
                                        supported programmes to help alleviate human suffering.
                                    </p>
                                    <p class="comment_item_name">
                                        - Canisdang
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!-- ================== User 2 ============== -->
                        <div class="item comment_item">
                            <div class="comment_item_data">
                                <div class="comment_item_data_qoute">
                                    <div class="comment_item_img">
                                        <img src="img/Bloons 6のTwitterイラスト検索結果。.png" alt="">
                                    </div>
                                    <div class="quote_icon"><i class="fa-solid fa-quote-left"></i></div>
                                </div>
                                <div class="comment_item_content">
                                    <p class="comment_item_des">
                                        Working in conjunction with humanitarian aid agencies, we have
                                        supported programmes to help alleviate human suffering.
                                    </p>
                                    <p class="comment_item_name">
                                        - Canisdang
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="home_img3"><img src="img/0d44f4256f79eea68f1da47b84196ef0-removebg-preview.png" alt="">
                    </div>
                </div>
            </section>

            <!-- =========================== Product ================================== -->
            <section class="pproduct_section section">
                <div class="pproduct_container container">
                    <h1 class="pproduct_title">Most Popular Products</h1>
                    <div class="pproduct_content grid">
                        <!-- ================ Card 1 -->
                        <div class="pproduct_card">
                            <div class="pproduct_data_img">
                                <button onclick="location.href = '#'"><img src="img/3b7d5965d9372f3185e778c20596d3dc.jpg"
                                                                           alt=""></button>
                                <form onsubmit="event.preventDefault()" class="pproduct_wishlist_ico">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart "></i></button>
                                </form>
                                <form class="pproduct_addCart" onsubmit="event.preventDefault()">
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
                                    <a href="#" class="pproduct_data_name">Product Name</a>
                                    <p class="pproduct_data_price">$10.00</p>
                                </div>
                            </div>
                        </div>
                        <!-- ================ Card 2 -->
                        <div class="pproduct_card">
                            <div class="pproduct_data_img">
                                <button onclick="location.href = '#'"><img src="img/fe9a5514120ffdbb557352079e2b96c6.png"
                                                                           alt=""></button>
                                <form onsubmit="event.preventDefault()" class="pproduct_wishlist_ico">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart"></i></button>
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
                                    <h1 class="pproduct_data_name">Product Name</h1>
                                    <p class="pproduct_data_price">$10.00</p>
                                </div>
                            </div>
                        </div>
                        <!-- ================ Card 3 -->
                        <div class="pproduct_card">
                            <div class="pproduct_data_img">
                                <button onclick="location.href = '#'"><img src="img/the-perfume-shop-joop-homme.jpg"
                                                                           alt=""></button>
                                <form onsubmit="event.preventDefault()" class="pproduct_wishlist_ico">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart"></i></button>
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
                                    <h1 class="pproduct_data_name">Product Name</h1>
                                    <p class="pproduct_data_price">$10.00</p>
                                </div>
                            </div>
                        </div>
                        <!-- ================ Card 4 -->
                        <div class="pproduct_card">
                            <div class="pproduct_data_img">
                                <button onclick="location.href = '#'"><img
                                        src="img/z4752894108147_93ce64c63470671b3b4d3472ac95679a.jpg" alt=""></button>
                                <form onsubmit="event.preventDefault()" class="pproduct_wishlist_ico">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart"></i></button>
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
                                    <h1 class="pproduct_data_name">Product Name</h1>
                                    <p class="pproduct_data_price">$10.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ========================== May Like ============================== -->
            <section class="pproduct_section section maylike_section">
                <div class="pproduct_container container ">
                    <h1 class="pproduct_title">You May Like</h1>
                    <div class="owl-carousel owl-theme mayLike_container">
                        <!-- ================ Card 1 -->
                        <div class="pproduct_card item">
                            <div class="pproduct_data_img">
                                <button onclick="location.href = '#'"><img src="img/3b7d5965d9372f3185e778c20596d3dc.jpg"
                                                                           alt=""></button>
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
                                    <a href="#" class="pproduct_data_name">Product Name</a>
                                    <p class="pproduct_data_price">$10.00</p>
                                </div>
                            </div>
                        </div>
                        <!-- ================ Card 2 -->
                        <div class="pproduct_card item">
                            <div class="pproduct_data_img">
                                <button onclick="location.href = '#'"><img src="img/fe9a5514120ffdbb557352079e2b96c6.png"
                                                                           alt=""></button>
                                <form onsubmit="event.preventDefault()" class="pproduct_wishlist_ico">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart"></i></button>
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
                                    <h1 class="pproduct_data_name">Product Name</h1>
                                    <p class="pproduct_data_price">$10.00</p>
                                </div>
                            </div>
                        </div>
                        <!-- ================ Card 3 -->
                        <div class="pproduct_card item">
                            <div class="pproduct_data_img">
                                <button onclick="location.href = '#'"><img src="img/the-perfume-shop-joop-homme.jpg"
                                                                           alt=""></button>
                                <form onsubmit="event.preventDefault()" class="pproduct_wishlist_ico">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart"></i></button>
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
                                    <h1 class="pproduct_data_name">Product Name</h1>
                                    <p class="pproduct_data_price">$10.00</p>
                                </div>
                            </div>
                        </div>
                        <!-- ================ Card 4 -->
                        <div class="pproduct_card item">
                            <div class="pproduct_data_img">
                                <button onclick="location.href = '#'"><img
                                        src="img/z4752894108147_93ce64c63470671b3b4d3472ac95679a.jpg" alt=""></button>
                                <form onsubmit="event.preventDefault()" class="pproduct_wishlist_ico">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart"></i></button>
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
                                    <h1 class="pproduct_data_name">Product Name</h1>
                                    <p class="pproduct_data_price">$10.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pproduct_getmore"><button>More Product</button></div>
                </div>
            </section>
            <!-- ================================= brand ========================= -->
            <section class="logo_section section">
                <div class="brand_container">
                    <div class="owl-carousel owl-theme logo_container container">
                        <!--=============== item 1 ================-->
                        <div class="item logo_item">
                            <img src="img/logo1.png" alt="">
                        </div>
                        <!--=============== item 1 ================-->
                        <div class="item logo_item">
                            <img src="img/logo2.png" alt="">
                        </div>
                        <!--=============== item 1 ================-->
                        <div class="item logo_item">
                            <img src="img/logo3-removebg-preview.png" alt="">
                        </div>
                        <!--=============== item 1 ================-->
                        <div class="item logo_item">
                            <img src="img/logo4-removebg-preview.png" alt="">
                        </div>
                        <!--=============== item 1 ================-->
                        <div class="item logo_item">
                            <img src="img/logo5-removebg-preview.png" alt="">
                        </div>
                        <!--=============== item 1 ================-->
                        <div class="item logo_item">
                            <img src="img/logo7-removebg-preview.png" alt="">
                        </div>
                        <!--=============== item 1 ================-->
                        <div class="item logo_item">
                            <img src="img/logo8-removebg-preview.png" alt="">
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="js/DangScript/jquery.min.js"></script>
        <script src="CSS/DangStyles/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
                                    AOS.init();
        </script>
        <script src="js/DangScript/Home.js"></script>
    </body>
</html>