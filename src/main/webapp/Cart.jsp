<%-- 
    Document   : Cart
    Created on : Sep 18, 2023, 3:09:47 PM
    Author     : ddand
--%>

<%@page import="Models.tblUser"%>
<%@page import="DAOs.AccountDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/CSS/CartStyles.css">
    </head>

    <body>
        <%
            int ID = 2;
            AccountDAO aDAO = new AccountDAO();
            tblUser us = aDAO.GetCartByUserID(ID);
        %>

        <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=ID%>"/>
        </jsp:include>  

        <main class="main">
            <div class="section_title">
                <h1 class="cart_title">User Shopping Cart</h1>
                <h2 class="cart_subtitle">Final Step Before Your Payment</h2>
            </div>
            <section class="container cart_container">
                <div class="cart_table">
                    <div class="cart_t_header">
                        <h1 class="cart_h_title col-product">Product</h1>
                        <h1 class="cart_h_title col-price">Price</h1>
                        <h1 class="cart_h_title col-quantity">Quantity</h1>
                        <h1 class="cart_h_title col-remove">Remove</h1>
                    </div>
                    <div class="cart_t_frame">
                        <%
                            //                        String idkh = (String) session.getAttribute("idkh");
                            String msp = "";
                            int subtotal = 0;
                            int countProduct = 1;
                            CartDAO dao = new CartDAO();
                            ResultSet rs = dao.ShowCartByID(ID);
                            if (!rs.next()) {
                        %>
                        <P style="width:100%;text-align: center;padding: 1rem 0;">Không có sản phẩm trong giỏ</p>
                            <%
                            } else {
                            %>
                        <!-- ====================== item 1 ================== -->
                        <div class="cart_t_item">
                            <div class="cart_t_i_content col-product">
                                <div class="cart_t_i_img">
                                    <img src="<%=rs.getString("ProductImageURL")%>" alt="">
                                </div>
                                <div class="cart_t_i_data">
                                    <h1 class="cart_t_i_title"><%=rs.getString("ProductName")%></h1>
                                    <p class="cart_t_i_subtitle">Category: Eau de perfume</p>
                                </div>
                            </div>
                            <h1 class="cart_t_i_price col-price" id="price<%=countProduct%>">$<%=rs.getInt("ProductPrice")%></h1>
                            <div class="col-quantity">
                                <!--========= edit quantity =============-->
                                <div class="cart_t_i_quantity" data-quantity-id="<%=countProduct%>">
                                    <div class="value-button decrease">-
                                    </div>
                                    <input type="number" id="number<%=countProduct%>" class="quantity-input" value="<%=rs.getInt("ProductAmount")%>" onchange="updateTotal(<%=countProduct%>)" />
                                    <div class="value-button increase">+
                                    </div>
                                </div>
                            </div>
                            <a href="#" class="cart_t_i_func">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </div>

                        <%
                            msp += rs.getInt("ProductID") + ",";
                            subtotal += rs.getInt("ProductPrice");
                            while (rs.next()) {
                                countProduct++;
                        %>
                        <!-- ====================== item 1 ================== -->
                        <div class="cart_t_item">
                            <div class="cart_t_i_content col-product">
                                <div class="cart_t_i_img">
                                    <img src="<%=rs.getString("ProductImageURL")%>" alt="">
                                </div>
                                <div class="cart_t_i_data">
                                    <h1 class="cart_t_i_title"><%=rs.getString("ProductName")%></h1>
                                    <p class="cart_t_i_subtitle">Category: Eau de perfume</p>
                                </div>
                            </div>
                            <h1 class="cart_t_i_price col-price" id="price<%=countProduct%>"><%=rs.getInt("ProductPrice")%></h1>
                            <div class="col-quantity">
                                <!--========= edit quantity =============-->
                                <div class="cart_t_i_quantity" data-quantity-id="<%=countProduct%>">
                                    <div class="value-button decrease">-
                                    </div>
                                    <input type="number" id="number<%=countProduct%>" class="quantity-input" value="<%=rs.getInt("ProductAmount")%>" onchange="updateTotal(<%=countProduct%>)"/>
                                    <div class="value-button increase">+
                                    </div>
                                </div>
                            </div>
                            <a href="#" class="cart_t_i_func">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </div>
                        <%
                                    msp += rs.getInt("ProductID") + ",";
                                    subtotal += rs.getInt("ProductPrice");
                                }
                            }
                        %>

                    </div>
                </div>
            </section>
            <section class="container">
                <form action="" class="cart_container cart_checkzone">
                    <div class="cart_cz_summary">
                        <div class="cart_cz_title">
                            <h1>Confirm information</h1>
                        </div>
                        <div class="cart_dz_content">
                            <p class="cart_dz_subtitle t-caution">Please confirm your information before check out.</p>
                            <div class="cart_dz_data_area">
                                <input type="text" class="cart_dz_input" placeholder="Name of receiver" value="<%=us.getFullName()%>">
                                <input type="text" class="cart_dz_input" placeholder="Phone number" value="<%=us.getPhoneNumber()%>">
                                <select name="" id="" class="cart_dz_input cart_dz_select">
                                    <option value="">Choose payment method</option>
                                    <option value="cod">Collect on delivery</option>
                                    <option value="op">Online payment</option>
                                </select>
                                <textarea class="cart_dz_input" rows="3" name="" id=""
                                          placeholder="Your address"><%=us.getAddress()%></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="cart_cz_summary">
                        <div class="cart_cz_title">
                            <h1>Order summary</h1>
                        </div>
                        <div class="cart_dz_content">
                            <p class="cart_dz_subtitle">Shipping and additional costs are calculated based on values you
                                have entered.</p>
                            <h3 class="cart_dz_data">
                                Order subtotal
                                <span>$ <%=subtotal%></span>
                            </h3>
                            <h3 class="cart_dz_data">
                                Shipping and handling
                                <%
                                    int shipcost;
                                    if (subtotal <= 0) {
                                        shipcost = 0;
                                    } else {
                                        shipcost = 12;
                                    }
                                %>
                                <span>
                                    $<%=shipcost%>
                                </span>
                            </h3>
                            <h3 class="cart_dz_data cart_dz_total">
                                Total
                                <span>$<%int Total = subtotal + shipcost;%><%=Total%></span>
                            </h3>
                            <input type="submit" value="Proceed to checkout" class="cart_cz_checkout">
                        </div>
                    </div>
                </form>
            </section>
        </main>
        <jsp:include page="Footer.jsp"></jsp:include>                     

        <script src="js/CartScript.js"></script>
    </body>
</html>
