<%-- 
    Document   : listProduct
    Created on : Sep 16, 2023, 11:41:15 PM
    Author     : ADMIN
--%>
<%@page import="DAOs.ProductDAO"%>
<%@page import="Models.tblProduct"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product's List</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="node_modules/bootstrap-social/bootstrap-social.css">
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/listProduct.css"/>
    </head>
    <body>

        <header>
            <div class="taskbar">
                <div class="logo"> <img src="img/Logo_img.png" alt=""></div>

                <div class="taskbar_link">
                    <a href="http://">Home</a>
                    <a href="http://">Shop Online</a>
                    <a href="http://">What's New</a>
                    <a href="http://">Contact</a>
                    <a chref="http://">About us</a>
                </div>

                <div class="taskbar_logo"><a href="http://"><img width="38px" height="37px" src="img/logoSearch.png" alt=""></a>
                    <a href="http://"><img width="38px" height="37px" src="img/logoStore.png" alt=""></a>
                </div>

                <div class="account">LHAnh <img src="img/logo3.png" width="30px" height="30px" alt=""></div>
            </div>

            <div class="image2">
                <img width="1108px" height="460px" src="img/Back1.jpg" alt="" srcset="">

                <div class="sentence" style="position: absolute; width: 450px; height: 88px;">
                    <p
                        style="color:#000; font-family: Inter; font-size: 36px; font-style: normal; font-weight: 400; line-height: normal;">
                        Explore a unique <br>
                        beautiful world of
                        <span
                            style="color:#FF66C4; font-family: Inter; font-size: 36px; font-style: normal; font-weight: 400; line-height: normal;">scents</span>
                    </p>
                </div>

                <div class="explore" style="position: absolute; padding-top: 13px; color: #fff;">Explore now</div>
            </div>
        </header>

 <!--list product-->
        <p style="margin-left: 250px; padding-top: 20px; padding-bottom: 20px; font-size: 20px"><b>All Products</b></p>
        <div class="container">
            <div class="row">
                <%
                    ProductDAO pDao = new ProductDAO();
                    ResultSet rs = pDao.getAllProduct();
                    while (rs.next()) {
                %>
                <div class="col-md-3" style="padding-bottom: 10px; width: 265px">
                    <div  class="card" style="width:265px; border: none">
                        <img src="<%= rs.getString("ProductImageURL")%>" class="card-img" style="width: 265px; height: 265px" alt="Product Image">
                        <span  id="addToCart" style="display: none; border: 1px solid black; border-radius: 30px 30px 30px 30px; width: 108px; height: 32px; text-align: center; align-self: center">Add to cart</span>
                        <div class="card-body" style="width: 265px">
                            <h5 style="width: 250px; font-size: 17px" class="card-name"><%= rs.getString("ProductName")%></h5>
                            <p class="card-price"> <%= rs.getString("Price")%></p>
                        </div>
                    </div>
                </div>
                <%
                    if (rs.getRow() % 4 == 0) {
                %>
            </div>
            <div class="row">
                <%            
                        }
                    }
                %>
            </div>
        </div>



        <footer>
            <div>
                <div>
                    <div style="width: 213px; height: 93px; padding-left: 20px; padding-top: 76px;"> <img src="img/Logo_footer.png" alt=""></div>
                    <div style="width: 262px; height: 57px;color: #0D0D0D;
                         font-family: Inter;
                         font-size: 16px;
                         font-style: normal;
                         font-weight: 400;
                         line-height: normal; padding-top: 70px; margin-left: 50px;padding-bottom: 187px;">Lorem Ipsum is simply dummy text <br> of the printing and typesetting <br> industry.
                    </div>
                </div>
            </div>

            <div style="padding-top: 82px; margin-left: 50px;">
                <span style="color: #FF9C00;
                      font-family: Inter;
                      font-size: 18px;
                      font-style: normal;
                      font-weight: 700;
                      line-height: normal; ;">Pages</span> <br> <br>
                Home <br>
                Shop Online <br>
                Contact Us <br>
                About us <br>
                What's New <br>
                Most Popular 
            </div>

            <div style="padding-top: 82px; margin-left: 70px;">
                <span style="color: #FF9C00;
                      font-family: Inter;
                      font-size: 18px;
                      font-style: normal;
                      font-weight: 700;
                      line-height: normal; ;">Categories</span> <br> <br>
                Category 1 <br>
                Category 2 <br>
                Category 3 <br>
                Category 4 <br>
                Category 5 <br>
                Category 6 
            </div>

            <div style="padding-top: 82px; margin-left: 60px;">
                <span style="font-family: Poppins;
                      font-size: 20px;
                      font-style: normal;
                      font-weight: 500;
                      line-height: 124.5%; /* 24.9px */
                      letter-spacing: 0.1px; color: #5e6282;">Discover our fanpage</span> <br>
                <span> <img src="img/logoFooter.png" alt=""></span> <br>
                <span>hoanganhle0203@gmail.com <br> +011 2 345 678 </span>
            </div>

        </div>
    </footer>


    <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="js/btnAddToCart.js"></script>
</body>
</html>

