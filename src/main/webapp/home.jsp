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
        <link rel="stylesheet" href="CSS/DangStyles/HomeStyle.css">
    </head>

    <body>
        <jsp:include page="header.jsp">
            <jsp:param name="ID" value=""/>
        </jsp:include>

        <main class="main" id="main">
            <section class="home_section">
                <div class="home_addition_bg">
                    <div class="owl-carousel owl-theme home_container">
                        <!-- ========= item 1 =========== -->
                        <div class="item home_slide">
                            <div class="home_slide_content container">
                                <div class="home_slide_data">
                                    <h1 class="home_slide_title ani_title1">Explore a unique <br>
                                        beautiful world of <span>scents</span></h1>
                                    <a href="/Shop/" class="button home_slide_button ani_btn1">Explore Now</a>
                                </div>
                                <div class="home_slide_img1"><img src="img/Back4.jpg" alt=""></div>
                            </div>
                        </div>
                        <!-- ========= item 2 =========== -->
                        <div class="item home_slide">
                            <div class="home_slide_content container">
                                <div class="home_slide_data">
                                    <h1 class="home_slide_title ani_title2">Explore a unique <br>
                                        beautiful world of <span>scents</span></h1>
                                    <a href="/Shop/" class="button home_slide_button ani_btn2">Explore Now</a>
                                </div>
                                <div class="home_slide_img2"><img src="img/Back2.jpg" alt=""></div>
                            </div>
                        </div>
                        <!-- ========= item 3 =========== -->
                        <div class="item home_slide">
                            <div class="home_slide_content container">
                                <div class="home_slide_data">
                                    <h1 class="home_slide_title ani_title3">Explore a unique <br>
                                        beautiful world of <span>scents</span></h1>
                                    <a href="/Shop/" class="button home_slide_button ani_btn3">Explore Now</a>
                                </div>
                                <div class="home_slide_img3"><img src="img/Back5.jpg" alt="">
                                </div>
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
                                    <h1 class="pproduct_data_name">Product Name</h1>
                                    <p class="pproduct_data_price">$10.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pproduct_getmore"><button>More Product</button></div>
                </div>
            </section>

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
                    <div class="home_img3"><img src="img/0d44f4256f79eea68f1da47b84196ef0-removebg-preview.png" alt=""></div>
                </div>
            </section>
            <section class="pproduct_section section">
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
                        <div class="pproduct_card item">
                            <div class="pproduct_data_img">
                                <button onclick="location.href = '#'"><img src="img/fe9a5514120ffdbb557352079e2b96c6.png"
                                                                         alt=""></button>
                                <form onsubmit="event.preventDefault()" class="pproduct_wishlist_ico">
                                    <button type="submit" class="i-color"><i class="fa-regular fa-heart"></i></button>
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
                                    <h1 class="pproduct_data_name">Product Name</h1>
                                    <p class="pproduct_data_price">$10.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ======================= Shop Now ======================= -->
            <section class="shopnow_section section">
                <div class="shopnow_container container">
                    <div class="shopnow_grid grid">
                        <div class="shopnow_content">
                            <div class="shopnow_icon"><i class="fa-solid fa-store"></i></div>
                            <div class="shopnow_intro">
                                <h1 class="shopnow_title">Get more product</h1>
                                <p class="shopnow_des">Lorem Ipsum is simply dummy text of the printing and typesetting
                                    industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                            </div>
                            <button class="shopnow_btn button" onclick="location.href='/Shop/'">Shop Now</button>
                        </div>
                        <div class="shopnow_pic1">
                            <img src="img/Pic1.jpg" alt="">
                        </div>
                        <div class="shopnow_pic2">
                            <img src="img/the-perfume-shop-joop-homme.jpg" alt="">
                        </div>
                    </div>
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
        <script src="js/DangScript/Home.js"></script>
    </body>
</html>