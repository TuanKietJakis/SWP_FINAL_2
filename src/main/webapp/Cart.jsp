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
        <link rel="stylesheet" href="/CSS/DangStyles/CartStyles.css">
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
            int usID = 0;
            if (session.getAttribute("CustomerID") != null) {
                usID = (int) session.getAttribute("CustomerID");
            } else {
                response.sendRedirect("/Home");
            }
        %>
        <%
            tblUser us = (tblUser) session.getAttribute("UserInfo");
        %>

        <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=us.getUserID()%>"/>
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
                            int countProduct = 0;
                            CartDAO dao = new CartDAO();
                            ResultSet rs = dao.ShowCartByID(us.getUserID());
                            if (!rs.next()) {
                        %>
                        <P style="width:100%;text-align: center;padding: 1rem 0;">Please fill your cart with Fragrances</p>
                            <%
                            } else {
                                countProduct++;
                            %>
                        <P class="noItem" style="width:100%;text-align: center;padding: 1rem 0;display: none;">Please fill your cart with Fragrances</p>
                        <!-- ====================== item 1 ================== -->
                        <div class="cart_t_item" id="cart<%=rs.getInt("CartID")%>">
                            <div class="cart_t_i_content col-product">
                                <div class="cart_t_i_img" onclick="location.href = '/Shop/Detail/<%=rs.getInt("ProductID")%>'">
                                    <img src="<%=rs.getString("ProductImageURL")%>" alt="">
                                </div>
                                <div class="cart_t_i_data">
                                    <h1 class="cart_t_i_title" onclick="location.href = '/Shop/Detail/<%=rs.getInt("ProductID")%>'"><%=rs.getString("ProductName")%></h1>
                                    <p class="cart_t_i_subtitle">Category: Eau de perfume</p>
                                </div>
                            </div>
                            <h1 class="cart_t_i_price col-price" id="price<%=countProduct%>">$<%=rs.getInt("ProductPrice")%></h1>
                            <div class="col-quantity getForUpdate">
                                <!--========= edit quantity =============-->
                                <div class="cart_t_i_quantity" data-quantity-id="<%=countProduct%>">
                                    <div class="value-button decrease">-
                                    </div>
                                    <input type="number" id="number<%=countProduct%>" class="quantity-input" value="<%=rs.getInt("ProductAmount")%>" onkeydown="return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 8"/>
                                    <input type="hidden" name="proPrice" id="proPrice" class="proPrice" value="<%=rs.getInt("ProductPrice")%>" data-cart-id="<%=rs.getInt("CartID")%>">
                                    <input type="hidden" id="action" name="action" value="update-quan">
                                    <div class="value-button increase">+
                                    </div>
                                </div>
                            </div>
                            <!--============== Modifi here ===============-->
                            <button type="button" id="deleteBtn" class="cart_t_i_func" data-product-id="<%=rs.getInt("CartID")%>">
                                <div>
                                    <i class="fa-solid fa-trash"></i>
                                    <span>Delete</span>
                                    <input type="hidden" id="action" name="action" value="delete-product">
                                </div>
                            </button>
                        </div>

                        <%
                            msp += rs.getInt("CartID") + ",";
                            subtotal += rs.getInt("ProductPrice") * rs.getInt("ProductAmount");
                            while (rs.next()) {
                                countProduct++;
                        %>
                        <!-- ====================== item 1 ================== -->
                        <div class="cart_t_item" id="cart<%=rs.getInt("CartID")%>">
                            <div class="cart_t_i_content col-product">
                                <div class="cart_t_i_img" onclick="location.href = '/Shop/Detail/<%=rs.getInt("ProductID")%>'">
                                    <img src="<%=rs.getString("ProductImageURL")%>" alt="">
                                </div>
                                <div class="cart_t_i_data">
                                    <h1 class="cart_t_i_title" onclick="location.href = '/Shop/Detail/<%=rs.getInt("ProductID")%>'"><%=rs.getString("ProductName")%></h1>
                                    <p class="cart_t_i_subtitle">Category: Eau de perfume</p>
                                </div>
                            </div>
                            <h1 class="cart_t_i_price col-price" id="price<%=countProduct%>">$<%=rs.getInt("ProductPrice")%></h1>
                            <div class="col-quantity getForUpdate">
                                <!--========= edit quantity =============-->
                                <div class="cart_t_i_quantity" data-quantity-id="<%=countProduct%>" >
                                    <div class="value-button decrease">-
                                    </div>
                                    <input type="number" id="number<%=countProduct%>" class="quantity-input" value="<%=rs.getInt("ProductAmount")%>" onkeydown="return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 8"/>
                                    <input type="hidden" name="proPrice" id="proPrice" class="proPrice" value="<%=rs.getInt("ProductPrice")%>" data-cart-id="<%=rs.getInt("CartID")%>">
                                    <input type="hidden" id="action" name="action" value="update-quan">
                                    <div class="value-button increase">+
                                    </div>
                                </div>
                            </div>
                            <button type="button" id="deleteBtn" class="cart_t_i_func" data-product-id="<%=rs.getInt("CartID")%>">
                                <div>
                                    <i class="fa-solid fa-trash"></i>
                                    <span>Delete</span>
                                    <input type="hidden" id="action" name="action" value="delete-product">
                                </div>
                            </button>
                        </div>
                        <%
                                    msp += rs.getInt("CartID") + ",";
                                    subtotal += rs.getInt("ProductPrice") * rs.getInt("ProductAmount");
                                }
                            }
                        %>

                    </div>
                </div>
            </section>
            <section class="container">
                <form action="/Cart" method="post" class="cart_container cart_checkzone" id="cartForm">
                    <div class="cart_cz_summary">
                        <div class="cart_cz_title">
                            <h1>Confirm information</h1>
                        </div>
                        <div class="cart_dz_content">
                            <div class="cart_dz_data_area">
                                <div class="chooseAddressPlace">
                                    <select class="cart_dz_input cart_dz_select" id="cart_select">
                                        <option value="">Choose Delivery Address</option>
                                        <%
                                            ResultSet rsAddress = dao.getAllAddress(us.getUserID());
                                            while (rsAddress.next()) {
                                        %>
                                        <option value="<%=rsAddress.getInt("AddressID")%>"><%=rsAddress.getString("FullName")%> - <%=rsAddress.getString("Address")%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                    <button class="editAddress" type="button">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>
                                </div>
                                <input type="text" class="cart_dz_input" placeholder="Name of receiver" id="inputFullName" name="receiveName">
                                <input type="text" class="cart_dz_input" placeholder="Phone number" id="inputPhoneNumber" name="receivePhone">

                                <input type="radio" name="receivePayment" id="vnPay" style="display: none;" value="1">
                                <input type="radio" name="receivePayment" id="cash" style="display: none;" value="2">

                                <div class="cart_dz_input_label">
                                    <label for="vnPay" class="vnpayMethod">
                                        <div class="imgName">
                                            <img src="/img/vnpay-seeklogo.com.svg" alt="">
                                            <span>VN Pay</span>
                                        </div>

                                        <i class="fa-solid fa-circle-check" style="color: #2c64c3;"></i>
                                    </label>
                                    <label for="cash" class="cashMethod">
                                        <div class="imgName">
                                            <img src="/img/cash-icon.svg" alt="">
                                            <span>Cash On Delivery</span>
                                        </div>

                                        <i class="fa-solid fa-circle-check" style="color: #2c64c3;"></i>
                                    </label>
                                </div>
                                <textarea class="cart_dz_input" rows="3" name="receiveAddress" id="inputAddress"
                                          placeholder="Your address"></textarea>
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
                                <span class="subtotalClass">$ <%=subtotal%></span>
                                <input type="hidden" name="subtotal" id="subtotal" value="<%=subtotal%>">

                            </h3>
                            <h3 class="cart_dz_data">
                                Shipping and handling
                                <%
                                    int shipcost;
                                    if (subtotal <= 0) {
                                        shipcost = 0;
                                    } else {
                                        shipcost = 1 * countProduct;
                                    }
                                %>
                                <input type="hidden" name="shipcost" id="shipcost" value="<%=shipcost%>">
                                <span class="shipcostClass">
                                    $<%=shipcost%>
                                </span>
                            </h3>
                            <h3 class="cart_dz_data cart_dz_total">
                                Total
                                <span class="totalClass">$<%int Total = subtotal + shipcost;%><%=Total%></span>
                                <input type="hidden" name="total" id="total" value="<%=Total%>">
                            </h3>
                            <input type="hidden" name="listProduct" id="listProduct" value="<%=msp%>">
                            <input type="hidden" name="UserID" id="UserID" value="<%=us.getUserID()%>">
                            <button type="submit" class="cart_cz_checkout" name="checkout">Proceed to checkout</button>
                        </div>
                    </div>
                </form>
            </section>

            <!--======================================= Add Error ====================================================-->
            <div class="error_zone">
                <div>
                    <div class="error_zone_header">
                        <div class="error_zone_icon">
                            <i class="fa-solid fa-circle-xmark" style="color: rgb(235, 86, 116);"></i>
                        </div>
                        <p class="error_zone_title">Notice</p>
                    </div>
                    <div class="error_zone_content">
                        <ul class="error_zone_list">

                        </ul>
                    </div>
                    <div class="error_zone_func">
                        <button class="error_zone_close">Close</button>
                    </div>
                </div>
            </div>
            <!--================================= Address Management ======================================================-->
            <div class="addressManagement">
                <div class="address_management_container">
                    <h3 class="address_m_header">Your Delivery Address <span id="close-popup"><i
                                class="fa-regular fa-circle-xmark"></i></span></h3>
                    <div class="address_m_data">
                        <div class="classForAppend">
                            <%
                                ResultSet rsAd = dao.getAllAddress(us.getUserID());
                                while (rsAd.next()) {
                            %>
                            <!-- ============= Row 1 ======== -->
                            <div class="address_m_row" id="a<%=rsAd.getString("AddressID")%>">
                                <div class="address_m_info">
                                    <p class="address_m_name"><%=rsAd.getString("FullName")%></p>
                                    <p class="address_m_phone"><%=rsAd.getString("PhoneNumber")%></p>
                                    <p class="address_m_address"><%=rsAd.getString("Address")%></p>
                                </div>
                                <button class="address_m_func directToEdit" data-id="<%=rsAd.getString("AddressID")%>" data-address="<%=rsAd.getString("Address")%>" data-name="<%=rsAd.getString("FullName")%>" data-phone="<%=rsAd.getString("PhoneNumber")%>" data-method="<%=rsAd.getString("PaymentMethodID")%>">
                                    <i class="fa-solid fa-pen"></i>
                                </button>
                            </div>
                            <%}%>
                        </div>
                        <!-- ============= Row 1 ======== -->
                        <div class="address_m_row">
                            <button class="address_m_funcadd" id="directToAddress">
                                <i class="fa-solid fa-plus"></i>
                                Add Address
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!--============================================== Add Address ================================================-->
            <div class="address_m_add">
                <div class="address_m_add_container">
                    <h3 class="address_m_header">
                        <span id="backtoAddressManage"><i class="fa-solid fa-arrow-left"></i></span>
                        Add Your Address 
                        <span id="close-popup2"><i class="fa-regular fa-circle-xmark"></i></span>
                    </h3>
                    <div class="address_m_add_data">
                        <div class="address_m_add_data form" id="formForAdd">
                            <div class="cart_dz_data_area">
                                <input type="text" class="cart_dz_input" id="txtName1" placeholder="Name of receiver">
                                <input type="text" class="cart_dz_input" id="txtPhone1" placeholder="Phone number">

                                <input type="radio" name="payment" id="mvnPay1" style="display: none;">
                                <input type="radio" name="payment" id="mcash1" style="display: none;">

                                <div class="cart_dz_input_label">
                                    <label for="mvnPay1" class="vnpayMethod">
                                        <div class="imgName imgNameinpopup">
                                            <img src="/img/vnpay-seeklogo.com.svg" alt="">
                                            <span>VN Pay</span>
                                        </div>

                                        <i class="fa-solid fa-circle-check" style="color: #2c64c3;"></i>
                                    </label>
                                    <label for="mcash1" class="cashMethod">
                                        <div class="imgName imgNameinpopup">
                                            <img src="/img/cash-icon.svg" alt="">
                                            <span>Cash On Delivery</span>
                                        </div>

                                        <i class="fa-solid fa-circle-check" style="color: #2c64c3;"></i>
                                    </label>
                                </div>
                                <textarea class="cart_dz_input" id="txtAddress1" rows="3"
                                          placeholder="Your address"></textarea>
                            </div>
                        </div>
                        <div class="address_m_row address_add_funcadd">
                            <button class="address_m_funcadd" id="btnSubmitForAdd" data-id="<%=us.getUserID()%>">
                                Import Address
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!--============================================== Edit Address ================================================-->
            <div class="address_m_add address_m_edit">
                <div class="address_m_add_container">
                    <h3 class="address_m_header">
                        <span id="backtoAddressManage2"><i class="fa-solid fa-arrow-left"></i></span>
                        Add Your Address 
                        <span id="close-popup3"><i class="fa-regular fa-circle-xmark"></i></span>
                    </h3>
                    <div class="address_m_add_data">
                        <div class="address_m_add_data form">
                            <div class="cart_dz_data_area">
                                <input type="text" class="cart_dz_input" id="txtName" placeholder="Name of receiver">
                                <input type="text" class="cart_dz_input" id="txtPhone" placeholder="Phone number">

                                <input type="radio" name="payment" id="mvnPay" style="display: none;">
                                <input type="radio" name="payment" id="mcash" style="display: none;">
                                <input type="text" id="addressID" hidden value="">

                                <div class="cart_dz_input_label">
                                    <label for="mvnPay" class="vnpayMethod">
                                        <div class="imgName imgNameinpopup">
                                            <img src="/img/vnpay-seeklogo.com.svg" alt="">
                                            <span>VN Pay</span>
                                        </div>

                                        <i class="fa-solid fa-circle-check" style="color: #2c64c3;"></i>
                                    </label>
                                    <label for="mcash" class="cashMethod">
                                        <div class="imgName imgNameinpopup">
                                            <img src="/img/cash-icon.svg" alt="">
                                            <span>Cash On Delivery</span>
                                        </div>

                                        <i class="fa-solid fa-circle-check" style="color: #2c64c3;"></i>
                                    </label>
                                </div>
                                <textarea class="cart_dz_input" id="txtAddress" rows="3"
                                          placeholder="Your address"></textarea>
                            </div>
                        </div>
                        <div class="address_m_row address_add_funcadd">
                            <button class="address_m_funcadd address_m_funcremove" id="btnSubmitForRemove">
                                Remove
                            </button>
                            <button class="address_m_funcadd " id="btnSubmitForEdit">
                                Update Address
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="popup_bg"></div>
        </main>
        <jsp:include page="Footer.jsp"></jsp:include>      
        <script src="/js/DangScript/jquery.min.js"></script>
        <script src="/js/DangScript/CartScript.js"></script>

    </body>
</html>
