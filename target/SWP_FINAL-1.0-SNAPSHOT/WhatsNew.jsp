<%-- Document : WhatNew Created on : Oct 28, 2023, 5:50:50 PM Author : Truc Vy CE171243 --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>What's New</title>
            <link rel="stylesheet" href="CSS/DangStyles/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
            <link rel="stylesheet" href="CSS/DangStyles/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
            <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
            <link rel="stylesheet" href="/CSS/VyStyle/WhatsNew.css">
        </head>

        <body>
            <% int ID=0; if (session.getAttribute("CustomerID") !=null) { ID=(int) session.getAttribute("CustomerID"); }
                %>
                <jsp:include page="header.jsp">
                    <jsp:param name="ID" value="<%=ID%>" />
                </jsp:include>
                <main class="main" id="main">
                    <section class="home_section">
                        <div class="home_addition_bg">
                            <div class="owl-carousel owl-theme home_container">
                                <!-- ========= item 1 =========== -->
                                <div class="item home_slide">
                                    <div class="home_slide_content container">
                                        <div class="home_slide_data">
                                            <h1 class="home_slide_subtitle ani_title1"
                                                style="animation-duration: 1000ms;">
                                                Welcome To Our Store</h1>
                                            <h1 class="home_slide_title  ">What's New</h1>
                                            <p class="home_slide_des ani_title1" style="animation-duration: 1000ms;">
                                                <br>
                                                <br>
                                                <br>
                                            </p>
                                            <!--                                    <a href="#" class="home_slide_button ani_btn1">View collection</a>-->
                                        </div>
                                    </div>
                                    <div class="home_slide_img1"><img src="img/Back9.jpg"></div>
                                </div>
                            </div>
                            <div class="home_img1"><img src="/img/e9a9b60fc6 1.png" alt="">
                            </div>
                            <div class="home_img0"><img src="/img/3c5f5ccab1825d270129dce586a85752-removebg-preview.png"
                                    alt="">
                                <!--                    </div>
                    <div class="home_img2"><img src="/img/3c5f5ccab1825d270129dce586a85752-removebg-preview.png" alt="">
                    </div>-->
                            </div>
                    </section>


                    <!-- ========================= Introduce Product ===================== -->
                    <section class="intro_section">
                        <div class="col-1">
                            <h2>Floral Fatansy</h2>
                            <h3>New Perfume</h3>
                            <p>"Perfume is the most intense form of memory"</p>
                            <h5> - Jean Paul Guerlain</h5>
                            <button class="btn">
                                <div class="wrapper">
                                    <a href="/AbouUs.jsp" class="text">Shop Now</a>
                                    <div class="flower flower1">
                                        <div class="petal one"></div>
                                        <div class="petal two"></div>
                                        <div class="petal three"></div>
                                        <div class="petal four"></div>
                                    </div>
                                    <div class="flower flower2">
                                        <div class="petal one"></div>
                                        <div class="petal two"></div>
                                        <div class="petal three"></div>
                                        <div class="petal four"></div>
                                    </div>
                                    <div class="flower flower3">
                                        <div class="petal one"></div>
                                        <div class="petal two"></div>
                                        <div class="petal three"></div>
                                        <div class="petal four"></div>
                                    </div>
                                    <div class="flower flower4">
                                        <div class="petal one"></div>
                                        <div class="petal two"></div>
                                        <div class="petal three"></div>
                                        <div class="petal four"></div>
                                    </div>
                                    <div class="flower flower5">
                                        <div class="petal one"></div>
                                        <div class="petal two"></div>
                                        <div class="petal three"></div>
                                        <div class="petal four"></div>
                                    </div>
                                    <div class="flower flower6">
                                        <div class="petal one"></div>
                                        <div class="petal two"></div>
                                        <div class="petal three"></div>
                                        <div class="petal four"></div>
                                    </div>
                                </div>
                            </button>
                            <!-- <Button><a href="AboutUs.html" class="">Shop Now</a></Button> -->
                        </div>
                        <div class="col-2">
                            <img src="./img/card1.png" class="img-lv">
                            <div class="color-box"></div>
                        </div>
                    </section>

                    <!-- ======================== Section High quality ======================= -->
                    <section class="advertOne_section section">
                        <div class="advertOne_bg">
                            <div class="arrival_container container">
                                <h1 class="advertOne_title">
                                    Why Should Men <br>
                                    Also Use Perfume?
                                </h1>
                                <p class="advertOne_des1">
                                    Men should use perfume because it creates confidence, charm and specialness.<br> It
                                    binds
                                    memories and creates a unique impression. Perfume is a symbol of ego and personal
                                    expression.
                                    <br> Use perfume to shine and attract!
                                </p>
                                <p class="advertOne_des2">
                                    Perfume is a symbol that represents your ego and self. Everyone has their own
                                    favorite fragrance
                                    <br>
                                    that carries meaning and reflects each person's personality. Choosing a suitable
                                    perfume is a
                                    <br>
                                    way to express your ego and unique preferences. Understanding that, we have provided
                                    many types
                                    <br>
                                    of perfumes, click the button below to learn more...
                                </p>
                                <button class="shopnow_btn"><a href="AboutUs.html" class="textshop">Shop
                                        Now</a></button>
                            </div>
                        </div>
                    </section>

                    <!--========-->
                    <section class="shopnow_section section">
                        <div class="shopnow_container container">
                            <div class="shopnow_flex">
                                <div class="shopnow_image_area">
                                    <div class="shopnow_pic1" data-aos="fade-up" data-aos-duration="2000">
                                        <img src="/img/heart.jpg" alt="">
                                    </div>
                                    <div class="shopnow_pic2" data-aos="fade-down" data-aos-duration="2000">
                                        <img src="/img/wd1.jpg" alt="">
                                    </div>
                                </div>
                                <div class="shopnow_content">
                                    <!-- <div class="shopnow_icon"><i class="fa-solid fa-store"></i></div> -->
                                    <div class="shopnow_intro">
                                        <h1 class="shopnow_title">The secret <br>of scent</h1>
                                        <p class="shopnow_des">Scent is the magical language of love. It spreads from
                                            fresh flowers,
                                            from the sweet notes of
                                            ripe fruit. The fragrance of love cannot be captured by theory or words but
                                            can only be
                                            conveyed
                                            by touching the heart and feeling from the bottom of the heart. It is the
                                            crystallization of
                                            emotions, a miracle that brings us closer together and brings sweet memories
                                            for a
                                            lifetime.So come to our store and choose a scent for yourself to get an
                                            unforgettable
                                            impression....</p>
                                    </div>
                                    <button class="btn">
                                        <div class="wrapper">
                                            <a href="AboutUs.html" class="text">Shop Now</a>
                                            <div class="flower flower1">
                                                <div class="petal one"></div>
                                                <div class="petal two"></div>
                                                <div class="petal three"></div>
                                                <div class="petal four"></div>
                                            </div>
                                            <div class="flower flower2">
                                                <div class="petal one"></div>
                                                <div class="petal two"></div>
                                                <div class="petal three"></div>
                                                <div class="petal four"></div>
                                            </div>
                                            <div class="flower flower3">
                                                <div class="petal one"></div>
                                                <div class="petal two"></div>
                                                <div class="petal three"></div>
                                                <div class="petal four"></div>
                                            </div>
                                            <div class="flower flower4">
                                                <div class="petal one"></div>
                                                <div class="petal two"></div>
                                                <div class="petal three"></div>
                                                <div class="petal four"></div>
                                            </div>
                                            <div class="flower flower5">
                                                <div class="petal one"></div>
                                                <div class="petal two"></div>
                                                <div class="petal three"></div>
                                                <div class="petal four"></div>
                                            </div>
                                            <div class="flower flower6">
                                                <div class="petal one"></div>
                                                <div class="petal two"></div>
                                                <div class="petal three"></div>
                                                <div class="petal four"></div>
                                            </div>
                                        </div>
                                    </button>
                                </div>

                            </div>
                        </div>
                    </section>


                    <!-- ========================= Product  ===================== -->

                    <!-- ================================= brand ========================= -->
                    <section class="logo_section section">
                        <div class="brand_container">
                            <div class="owl-carousel owl-theme logo_container container">
                                <!--=============== item 1 ================-->
                                <div class="item logo_item">
                                    <img src="/img/logo1.png" alt="">
                                </div>
                                <!--=============== item 1 ================-->
                                <div class="item logo_item">
                                    <img src="/img/logo2.png" alt="">
                                </div>
                                <!--=============== item 1 ================-->
                                <div class="item logo_item">
                                    <img src="/img/logo3-removebg-preview.png" alt="">
                                </div>
                                <!--=============== item 1 ================-->
                                <div class="item logo_item">
                                    <img src="/img/logo4-removebg-preview.png" alt="">
                                </div>
                                <!--=============== item 1 ================-->
                                <div class="item logo_item">
                                    <img src="/img/logo5-removebg-preview.png" alt="">
                                </div>
                                <!--=============== item 1 ================-->
                                <div class="item logo_item">
                                    <img src="/img/logo7-removebg-preview.png" alt="">
                                </div>
                                <!--=============== item 1 ================-->
                                <div class="item logo_item">
                                    <img src="/img/logo8-removebg-preview.png" alt="">
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