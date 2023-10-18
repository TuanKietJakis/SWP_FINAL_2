<%-- 
    Document   : wishList.jsp
    Created on : Oct 18, 2023, 11:31:55 AM
    Author     : ddand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="/CSS/MyStyle/wishList.css">
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
            <div class="section_title">
                <h1 class="cart_title">Wish List</h1>
                <h2 class="cart_subtitle">The Things You Wish Here</h2>
            </div>
            <section class="container cart_container">
                <div class="cart_table">
                    <div class="cart_t_header">
                        <h1 class="cart_h_title col-product" style="padding-left: 4px;">Product</h1>
                        <h1 class="cart_h_title col-price" style="padding-left: 11px;">Price</h1>
                        <h1 class="cart_h_title col-quantity">Quantity</h1>
                        <h1 class="cart_h_title col-remove">Add to cart</h1>
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
                            <div class="col-quantity">
                                <!--========= edit quantity =============-->
                                <div class="cart_t_i_quantity" data-quantity-id="1">
                                    <div class="value-button decrease">-
                                    </div>
                                    <input type="number" id="number1" class="quantity-input" value="1" />
                                    <div class="value-button increase">+
                                    </div>
                                </div>
                            </div>
                            <div class="cart_add">
                                <button class="cart_t_i_func">
                                    <i class="fa-solid fa-cart-plus fa-lg" style="margin-right: 2px;"></i>
                                    <span style="font-size: 14px; margin-left: 2px;">Add to cart</span>
                                </button>
                                <div style="text-align: center; font-size: x-small; margin-left: 1rem;" class="remove">
                                    <a href="">Remove</a>
                                </div>
                            </div>
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
                            <div class="col-quantity">
                                <!--========= edit quantity =============-->
                                <div class="cart_t_i_quantity" data-quantity-id="2">
                                    <div class="value-button decrease">-
                                    </div>
                                    <input type="number" id="number2" class="quantity-input" value="1" />
                                    <div class="value-button increase">+
                                    </div>
                                </div>
                            </div>
                            <div class="cart_add">
                                <button class="cart_t_i_func">
                                    <i class="fa-solid fa-cart-plus fa-lg" style="margin-right: 2px;"></i>
                                    <span style="font-size: 14px; margin-left: 2px;">Add to cart</span>
                                </button>
                                <div style="text-align: center; font-size: x-small; margin-left: 1rem;" class="remove">
                                    <a href="">Remove</a>
                                </div>
                            </div>
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
                            <div class="col-quantity">
                                <!--========= edit quantity =============-->
                                <div class="cart_t_i_quantity" data-quantity-id="3">
                                    <div class="value-button decrease">-
                                    </div>
                                    <input type="number" id="number3" class="quantity-input" value="1" />
                                    <div class="value-button increase">+
                                    </div>
                                </div>
                            </div>
                            <div class="cart_add">
                                <button class="cart_t_i_func">
                                    <i class="fa-solid fa-cart-plus fa-lg" style="margin-right: 2px;"></i>
                                    <span style="font-size: 14px; margin-left: 2px;">Add to cart</span>
                                </button>
                                <div style="text-align: center; font-size: x-small; margin-left: 1rem;" class="remove">
                                    <a href="">Remove</a>
                                </div>
                            </div>
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
                            <div class="col-quantity">
                                <!--========= edit quantity =============-->
                                <div class="cart_t_i_quantity" data-quantity-id="4">
                                    <div class="value-button decrease">-
                                    </div>
                                    <input type="number" id="number4" class="quantity-input" value="1" />
                                    <div class="value-button increase">+
                                    </div>
                                </div>
                            </div>
                            <div class="cart_add">
                                <button class="cart_t_i_func">
                                    <i class="fa-solid fa-cart-plus fa-lg" style="margin-right: 2px;"></i>
                                    <span style="font-size: 14px; margin-left: 2px;">Add to cart</span>
                                </button>
                                <div style="text-align: center; font-size: x-small; margin-left: 1rem;" class="remove">
                                    <a href="">Remove</a>
                                </div>
                            </div>
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
                            <div class="col-quantity">
                                <!--========= edit quantity =============-->
                                <div class="cart_t_i_quantity" data-quantity-id="5">
                                    <div class="value-button decrease">-
                                    </div>
                                    <input type="number" id="number5" class="quantity-input" value="1" />
                                    <div class="value-button increase">+
                                    </div>
                                </div>
                            </div>
                            <div class="cart_add">
                                <button class="cart_t_i_func">
                                    <i class="fa-solid fa-cart-plus fa-lg" style="margin-right: 2px;"></i>
                                    <span style="font-size: 14px; margin-left: 2px;">Add to cart</span>
                                </button>
                                <div style="text-align: center; font-size: x-small; margin-left: 1rem;" class="remove">
                                    <a href="">Remove</a>
                                </div>
                            </div>
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
                            <div class="col-quantity">
                                <!--========= edit quantity =============-->
                                <div class="cart_t_i_quantity" data-quantity-id="6">

                                    <div class="value-button decrease">-
                                    </div>
                                    <input type="number" id="number6" class="quantity-input" value="1" />
                                    <div class="value-button increase">+
                                    </div>
                                </div>
                            </div>
                            <div class="cart_add">
                                <button class="cart_t_i_func">
                                    <i class="fa-solid fa-cart-plus fa-lg" style="margin-right: 2px;"></i>
                                    <span style="font-size: 14px; margin-left: 2px;">Add to cart</span>
                                </button>
                                <div style="text-align: center; font-size: x-small; margin-left: 1rem;" class="remove">
                                    <a href="">Remove</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="/js/MyScript/wishList.js"></script>
        <script src="/js/DangScript/Header.js"></script>
        <!--<script src="footer.js"></script>-->
    </body>

</html>
