<%-- Document : Analytics Created on : Jun 2, 2023, 8:34:48 AM Author : User --%>

    <%@page import="DAOs.RatingDAO" %>
        <%@page import="DAOs.CategoryDAO" %>
            <%@page import="java.sql.ResultSet" %>
                <%@page import="DAOs.BrandDAO" %>
                    <%@page import="DAOs.ProductDAO" %>
                        <%@page import="Models.tblProduct" %>
                            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                                <!DOCTYPE html>
                                <html>

                                <head>
                                    <meta charset="UTF-8">
                                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                    <title>Create Product</title>
                                    <link rel="stylesheet"
                                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
                                        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
                                        crossorigin="anonymous" referrerpolicy="no-referrer" />
                                    <link rel="stylesheet" href="/CSS/VyStyle/CreateProduct.css">
                                    <style>
                                        .table-data {
                                            text-align: center;
                                        }

                                        .error {
                                            color: red;
                                            border-style: none;
                                        }
                                    </style>
                                    <script src="<%=request.getContextPath()%>/js/ValidateProduct.js"></script>
                                </head>

                                <body>
                                    <div class="container">
                                        <jsp:include page="/Admin_navigation.jsp"></jsp:include>
                                        <div class="admin_background"></div>
                                        <div class="admin_info grid-item">
                                            <jsp:include page="/Admin_anlyzes.jsp"></jsp:include>
                                            <div class="admin_background"></div>
                                            <div class="admin_content">
                                                <div class="admin_content_info">
                                                    <div class="product-img">
                                                        <img src="/img/Item8.png" alt="">
                                                    </div>
                                                    <button class="admin_content_info_name" style="text-align: center;">
                                                        <span class="file-upload"><i class="fas fa-plus"></i></span>
                                                    </button>
                                                    <input id="file-upload" type="file" name="txtProductImageURL"
                                                        accept="image/png, image/jpeg" />
                                                    <p class="admin_text"></p>

                                                    <div class="admin_btn">
                                                        <span><i class="fa-solid fa-arrow-left"></i></span>

                                                    </div>
                                                </div>
                                                <div class="admin_content_infos">
                                                    <form class="admin_form" id="update_form"
                                                        onsubmit="return ValidAllProductUpdate()"
                                                        action="ProductController" enctype="multipart/form-data"
                                                        method="post">
                                                        <div class="inputbox">
                                                            <div class="birthday">
                                                                <label class="lb-title">Brand ID</label>
                                                                <label class="lb-title">Category ID</label>
                                                                <select name="txtBrand" class="input" id="day">
                                                                    <% BrandDAO DaoB=new BrandDAO(); ResultSet
                                                                        rs=DaoB.GetAll(); while (rs.next()) { %>
                                                                        <option value="<%=rs.getInt(" BrandID")%>">
                                                                            <%=rs.getString("BrandName")%>
                                                                        </option>
                                                                        <% } %>
                                                                </select>

                                                                <select name="txtCategoryID" class="input" id="month">
                                                                    <% CategoryDAO Dao=new CategoryDAO(); ResultSet
                                                                        rs1=Dao.GetAll(); while (rs1.next()) { %>
                                                                        <option value="<%=rs1.getInt(" CategoryID")%>" >
                                                                            <%=rs1.getString("CatName")%>
                                                                        </option>
                                                                        <% } %>
                                                                </select>
                                                                <input type="hidden" name="txtRatingID" value="1">
                                                            </div>
                                                        </div>

                                                        <div class="inputbox">
                                                            <div class="label-group"><label class="lb-title-np">Product
                                                                    Name</label>
                                                                <input class="input" placeholder="Product Name"
                                                                    type="text" name="txtProductName" value=""
                                                                    id="email">
                                                            </div>
                                                        </div>
                                                        <div class="inputbox">
                                                            <div class="label-group"><label
                                                                    class="lb-title-np">Price</label>
                                                                <input class="input" placeholder="Price" type="text"
                                                                    name="txtPrice" value="" id="phone">
                                                            </div>
                                                        </div>
                                                        <div class="inputbox">
                                                            <div class="birthday-1">
                                                                <label class="lb-title">Quantity</label>
                                                                <label class="lb-title">Size</label>
                                                                <label class="lb-title">Active</label>
                                                                <input type="text" placeholder="Quantity"
                                                                    name="txtQuantity" value="" class="input" id="day">
                                                                <input type="text" placeholder="Size" name="txtSize"
                                                                    value="" class="input" id="month">
                                                                <select name="txtActive" class="input" id="month">
                                                                    <option value="1"> In Stock
                                                                    </option>
                                                                    <option value="2"> Sold Out
                                                                    </option>

                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="inputbox">
                                                            <div class="label-group"><label
                                                                    class="lb-title-np">Description</label>
                                                                <textarea class="input" placeholder="Description"
                                                                    name="txtProductDes" value="" id="" cols="30"
                                                                    rows="3"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="btn_admin">

                                                            <div class="btn_admin">
                                                                <input type="hidden" id="userID" name="userId" value="">
                                                                <input type="submit" id="updateinfo" class="dm"
                                                                    name="btnInsertPro" value="Add Product">
                                                            </div>

                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <script>
                                        document.addEventListener("DOMContentLoaded", function () {
                                            const fileUpload = document.getElementById("file-upload");
                                            const customUpload = document.querySelector(".admin_content_info_name");

                                            customUpload.addEventListener("click", function () {
                                                fileUpload.click();
                                            });
                                        });
                                    </script>
                                    <script src="<%=request.getContextPath()%>/Jquery.js"></script>
                                    <script src="<%=request.getContextPath()%>/bootstrap.min.js"></script>
                                </body>

                                </html>