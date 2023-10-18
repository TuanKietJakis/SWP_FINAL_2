<%-- 
    Document   : oderHistory
    Created on : Oct 18, 2023, 11:17:56 AM
    Author     : ddand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rating Cart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/CSS/VyStyle/oderHisStyle.css">
    <!--<link rel="stylesheet" href="path/to/popup.css">-->
</head>

<body>
    <%
            int ID = 0;
            if (session.getAttribute("CustomerID") != null) {
                ID = (int) session.getAttribute("CustomerID");
            }
        %>
        <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=ID%>"/>
        </jsp:include>

    <main class="main">
        <div id="ratingPopup" class="popup">
                        <div class="popup-content1">
                            <h2>Product Reviews</h2>
                            <div class="popup-intr">
                                <div class="cart_t_i_img">
                                    <img src="img/Item1.jpg" alt="">
                                </div>
                                <div class="cart_t_i_data">
                                    <h1 class="cart_t_i_title">This is name of product</h1>
                                    <p class="cart_t_i_subtitle">Category: Eau de perfume</p>
                                </div>

                            </div>
                            <div class="popup-content">
                                <div class="popup-rati">
                                    <p>Please select your rating:</p>
                                    <div class="rating-stars">
                                        <!-- <p>Please select your rating:</p> -->
                                        <span class="star"><i class="fa-solid fa-star"></i></span>
                                        <span class="star"><i class="fa-solid fa-star"></i></span>
                                        <span class="star"><i class="fa-solid fa-star"></i></span>
                                        <span class="star"><i class="fa-solid fa-star"></i></span>
                                        <span class="star"><i class="fa-regular fa-star"></i></span>
                                    </div>
                                </div>
                                <div>
                                    <textarea class="cart_dz_input ratingcmt" rows="3" name="" id=""
                                        placeholder="Your comment"></textarea>
                                </div>
                                <div class="Btnpopup">
                                    <button class="PopupBtn2" id="closePopupBtn">Cancel</button>
                                    <button class="PopupBtn" id="submitRatingBtn ">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="overlay" class="hideoverlay overlay"></div>
        <div class="section_title">
            <h1 class="cart_title"> Purchase History </h1>
            <h2 class="cart_subtitle">Review Your Purchase History</h2>
        </div>
        <section class="container cart_container">
            <div class="cart_table">
                <div class="cart_t_header">
                    <h1 class="cart_h_title col-product">Product</h1>
                    <h1 class="cart_h_title col-price">Price</h1>
                    <h1 class="cart_h_title col-quantity">Quantity</h1>
                    <h1 class="cart_h_title col-remove">Rating</h1>
                </div>
                <div class="cart_t_frame">
                    <!-- ====================== item 1 ================== -->
                    <div class="cart_t_item">
                        <div class="cart_t_i_content col-product">
                            <div class="cart_t_i_img">
                                <img src="img/Item1.jpg" alt="">
                            </div>
                            <div class="cart_t_i_data">
                                <h1 class="cart_t_i_title">This is name of product</h1>
                                <p class="cart_t_i_subtitle">Category: Eau de perfume</p>
                            </div>
                        </div>
                        <h1 class="cart_t_i_price col-price">64.000 vnd</h1>
                        <p class="col-number col-quantity"> <span>1</span></p>

                        <button class="openPopupBtn"><i class="fa fa-lg fa-star small-star"
                                style="color: rgb(255, 213, 0);"></i>
                            Rating</button>

                    </div>
                    <!-- ====================== item 1 ================== -->
                    <div class="cart_t_item">
                        <div class="cart_t_i_content col-product">
                            <div class="cart_t_i_img">
                                <img src="img/Item1.jpg" alt="">
                            </div>
                            <div class="cart_t_i_data">
                                <h1 class="cart_t_i_title">This is name of product</h1>
                                <p class="cart_t_i_subtitle">Category: Eau de perfume</p>
                            </div>
                        </div>
                        <h1 class="cart_t_i_price col-price">64.000 vnd</h1>
                        <p class="col-number col-quantity"> 1 </p>

                        <button class="openPopupBtn"><i class="fa fa-lg fa-star small-star"
                                                        style="color: rgb(255, 213, 0);"></i>
                            Rating</button>


                    </div>
                    <!-- ====================== item 1 ================== -->
                    <div class="cart_t_item">
                        <div class="cart_t_i_content col-product">
                            <div class="cart_t_i_img">
                                <img src="img/Item1.jpg" alt="">
                            </div>
                            <div class="cart_t_i_data">
                                <h1 class="cart_t_i_title">This is name of product</h1>
                                <p class="cart_t_i_subtitle">Category: Eau de perfume</p>
                            </div>
                        </div>
                        <h1 class="cart_t_i_price col-price">64.000 vnd</h1>
                        <p class="col-number col-quantity"> 1 </p>

                        <button class="openPopupBtn"><i class="fa fa-lg fa-star small-star"
                                                        style="color: rgb(255, 213, 0);"></i>
                            Rating</button>


                    </div>
                    <!-- ====================== item 1 ================== -->
                    <div class="cart_t_item">
                        <div class="cart_t_i_content col-product">
                            <div class="cart_t_i_img">
                                <img src="img/Item1.jpg" alt="">
                            </div>
                            <div class="cart_t_i_data">
                                <h1 class="cart_t_i_title">This is name of product</h1>
                                <p class="cart_t_i_subtitle">Category: Eau de perfume</p>
                            </div>
                        </div>
                        <h1 class="cart_t_i_price col-price">64.000 vnd</h1>
                        <p class="col-number col-quantity"> 1 </p>

                        <button class="openPopupBtn"><i class="fa fa-lg fa-star small-star"
                                                        style="color: rgb(255, 213, 0);"></i>
                            Rating</button>


                    </div>
                    <!-- ====================== item 1 ================== -->
                    <div class="cart_t_item">
                        <div class="cart_t_i_content col-product">
                            <div class="cart_t_i_img">
                                <img src="img/Item1.jpg" alt="">
                            </div>
                            <div class="cart_t_i_data">
                                <h1 class="cart_t_i_title">This is name of product</h1>
                                <p class="cart_t_i_subtitle">Category: Eau de perfume</p>
                            </div>
                        </div>
                        <h1 class="cart_t_i_price col-price">64.000 vnd</h1>
                        <p class="col-number col-quantity"> 1 </p>
                        <button class="openPopupBtn"><i class="fa fa-lg fa-star small-star"
                                style="color: rgb(255, 213, 0);"></i>
                            Rating</button>
                    </div>
                </div>
            </div>

        </section>
    </main>
    <jsp:include page="Footer.jsp"></jsp:include>
    <script src="Header.js"></script>
    <script src="footer.js"></script>
    <script src="js/VyScript/orderHistory.js"></script>
</body>

</html>
