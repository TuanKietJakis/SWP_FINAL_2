<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.OrderDAO"%>
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
            int userID = 0;
            if (session.getAttribute("CustomerID") != null) {
                userID = (int) session.getAttribute("CustomerID");
            }
        %>
        <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=userID%>" />
        </jsp:include>
          <main class="main">
         <div class="section_title">
                <h1 class="cart_title">Order History</h1>
                <h2 class="cart_subtitle">Review Your Order History</h2>
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
                    <%
                        OrderDAO oDao = new OrderDAO();
                        ResultSet rs = oDao.GetOrderDetailsByUserID(userID);

                        if (rs != null && rs.next()) {
                            do {
                                int orderID = rs.getInt("OrderID");
                                String orderDate = rs.getString("OrderDate");
                                String productName = rs.getString("ProductName");
                                int productPrice = rs.getInt("ProductPrice");
                                int quantity = rs.getInt("Quantity");
                                int totalPrice = rs.getInt("TotalPrice");
                                String productImage = rs.getString("ProductImageURL");
                                int productID = rs.getInt("ProductID");
                                int active = rs.getInt("Active");
                                // Format date

                    %>
                   <!-- Hiển thị thông tin của đơn hàng tại đây -->
                      <div class="cart_t_item">
                            <div class="cart_t_i_content col-product">
                                <div class="cart_t_i_img">
                                    <img src="<%=rs.getString("ProductImageURL")%>" alt="">
                                </div>
                                <div class="cart_t_i_data">
                                    <h1 class="cart_t_i_title"><%= productName%></h1>
                                    <p class="cart_t_i_subtitle">Delivery:<%= orderDate%></p>
                                </div>
                            </div>
                            <h1 class="cart_t_i_price col-price">$<%= productPrice%></h1>
                            <p class="cart_t_i_quati col-quantity">Quantity: <%= quantity%></p>
                            <%
                                if (active == 2) {

                                } else {
                            %>                        
                        <button class="underline-button" onclick="openPopup(<%= productID%>,<%= orderID%>);">Rate Product</button> 
                            <%}%>

                        </td>
                    </tr>
                    <%
                        } while (rs.next());
                    } else {
                    %>
                    <!-- Hiển thị thông báo khi không tìm thấy đơn hàng -->
                    <tr>
                        <td colspan="9">No orders found for User ID: <%= userID%></td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
        </div>
          
                   
        <div id="ratingPopup" class="popup">
            <div class="popup-content">
                <span class="close-popup" onclick="closePopup()">&times;</span>
                <h2>Rate Product</h2>
                <div class="rating-stars">
                    <p>Please select your rating:</p>
                    <span class="star" onclick="setRating(1)">★</span>
                    <span class="star" onclick="setRating(2)">★</span>
                    <span class="star" onclick="setRating(3)">★</span>
                    <span class="star" onclick="setRating(4)">★</span>
                    <span class="star" onclick="setRating(5)">★</span>
                </div>
                <form id="ratingForm" method="post" action="RatingController">
                    <input type="hidden" name="productID" id="productID" value="">
                    <input type="hidden" name="userID" id="userID" value="<%=userID%>">
                    <input type="hidden" name="rating" id="rating" value="">
                    <input type="hidden" name="orderID" id="orderID" value="">

                    <textarea class="cart_dz_input ratingcmt"name="rateDes" id="comment" rows="4" cols="50" placeholder="Write a comment..."></textarea>
                    <button class="PopupBtn" type="submit" onclick="submitRating(event)">Submit</button>
                </form>
            </div>
                  
        </div>
               <div class="background"></div>      
                

</section>
        </main>

        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="js/DangScript/jquery.min.js"></script>
        <script src="Header.js"></script>
        <script src="footer.js"></script>
        <script src="js/VyScript/orderHistory.js"></script>

        <script>
                        let currentProductID = 0;
                        let currentOrderID = 0;

                        function openPopup(productID, orderID) {
                            currentOrderID = orderID;
                            currentProductID = productID;
                            document.getElementById("ratingPopup").style.display = "block";
                        }

                        function closePopup() {
                            document.getElementById("ratingPopup").style.display = "none";
                        }

                        let rating = 0;

                        function setRating(value) {
                            rating = value;
                            const stars = document.querySelectorAll('.star');
                            stars.forEach((star, index) => {
                                star.classList.toggle('rated', index < value);
                            });
                        }

                        function submitRating(event) {
                            event.preventDefault(); // This prevents the default form submission
                            document.getElementById("rating").value = rating;
                            document.getElementById("productID").value = currentProductID;
                            document.getElementById("orderID").value = currentOrderID;
                            console.log(document.getElementById("rating"));
                            console.log(document.getElementById("productID"));
                            console.log(document.getElementById("orderID"));
                            console.log(document.getElementById("userID"));
                            console.log(document.getElementById("comment").value);
                            closePopup();
                            document.getElementById("ratingForm").submit();
                        }




        </script>
        <script src="/js/DangScript/CartScript.js"></script>
        <script src="js/VyScript/orderHistory.js"></script>
    </body>

</html>
