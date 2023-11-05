<%-- 
    Document   : Analytics
    Created on : Jun 2, 2023, 8:34:48 AM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAOs.RatingDAO"%>
<%@page import="DAOs.CategoryDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.BrandDAO"%>
<%@page import="DAOs.ProductDAO"%>
<%@page import="Models.tblProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Product Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="/CSS/MyStyle/updateProduct.css">
        <style>
            .table-data{
                text-align: center;
            }
            /*            .error {
                            color: red;
                            border-style: none;
                        }*/
            .btnDelete {
                min-width: 230px;
                height: 50px;
                color: #fff;
                padding: 8px 16px;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s ease;
                position: relative;
                display: inline-block;
                outline: none;
                border-radius: 5px;
                z-index: 0;
                background: #fff;
                overflow: hidden;
                border: 2px solid #adb5bd;
                color: #adb5bd;
                font-size: 18px;
            }
            .btnDelete:hover {
                color: #fff;
            }
            .btnDelete:hover:after {
                height: 100%;
            }
            .btnDelete:after {
                content: "";
                position: absolute;
                z-index: -1;
                transition: all 0.3s ease;
                left: 0;
                bottom: 0;
                height: 0;
                width: 100%;
                background: #adb5bd;
            }

            .btnUp{
                min-width: 230px;
                height: 50px;
                color: #fff;
                padding: 8px 16px;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s ease;
                position: relative;
                display: inline-block;
                outline: none;
                border-radius: 5px;
                border: none;
                font-size: 18px;
                background-size: 120% auto;
                background-image: linear-gradient(92deg, #FF66C4 -4.52%, #FFF27F 118.82%);
            }
            .btnUp:hover {
                background-position: right center;
            }
            .btnUp:active {
                top: 2px;
            }
        </style>
        <script src="<%=request.getContextPath()%>/js/ValidateProduct.js"></script>
    </head>
    <body>
        <%
            tblProduct pro = (tblProduct) request.getSession().getAttribute("ProductIDToUpdate");
            String ImgURL = (String) session.getAttribute("ImgURL");
            // ProductDAO dao = new ProductDAO();
            //tblProduct pro = dao.getInfoForUpdating(1);
%>

        <div class="container" style="position: relative">
            <div id="Create_error" class="error">
                <p id="error_msg"></p>
                <span id="close"><ion-icon name="close-circle-outline"></ion-icon></span>
            </div>
            <jsp:include page="/Admin_navigation.jsp">
                <jsp:param name="ID" value="${sessionScope.AdminstratorID}"/>
            </jsp:include>     
            <div class="admin_background"></div>
            <div class="admin_info grid-item">
                <jsp:include page="/Admin_anlyzes.jsp"></jsp:include>    
                    <div class="admin_background"></div>
                    <div class="admin_content">
                        <div class="admin_content_info">
                            <div class="product-img">
                                <img src="<%= pro.getProductImageURL()%>" alt="">
                        </div>
                        <button class="admin_content_info_name" style="text-align: center;">
                            <span class="file-upload"><i class="fas fa-plus"><i class="fa-solid fa-image"></i></i></span>
                        </button>
                        <!--                                <input id="file-upload" type="file" name="txtProductImageURL" accept="image/png, image/jpeg" />-->
                        <p class="admin_text"></p>

                        <div class="admin_btn" onclick="location.href='/Admin/Product/List'">
                            <span><i class="fa-solid fa-arrow-left"></i></span>

                        </div>
                    </div>
                    <div class="admin_content_infos">
                        <form class="admin_form" id="update_form" onsubmit="return ValidAllProductUpdate()" action="ProductController"  enctype="multipart/form-data" method="post"> 
                            <input id="file-upload" type="file" name="txtProductImageURL" accept="image/png, image/jpeg" />
                            <div class="inputbox">
                                <div class="birthday">    
                                    <label class="lb-title">Brand ID</label>
                                    <label class="lb-title">Category ID</label>
                                    <select name="txtBrand" class="input" id="day">
                                        <%
                                            BrandDAO DaoB = new BrandDAO();
                                            ResultSet rs = DaoB.GetAll();
                                            while (rs.next()) {
                                        %>
                                        <option value="<%=rs.getInt("BrandID")%>" <%=pro.getBrandID() == rs.getInt("BrandID") ? "selected" : ""%>><%=rs.getString("BrandName")%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                    <select name="txtCategoryID" class="input" id="month">
                                        <%
                                            CategoryDAO Dao = new CategoryDAO();
                                            ResultSet rs1 = Dao.GetAll();
                                            while (rs1.next()) {
                                        %>
                                        <option value="<%=rs1.getInt("CategoryID")%>" <%=pro.getCategoryID() == rs1.getInt("CategoryID") ? "selected" : ""%>><%=rs1.getString("CatName")%></option>
                                        <%
                                            }
                                        %>
                                    </select>                                
                                </div>
                            </div>

                            <div class="inputbox">
                                <div class="label-group"><label class="lb-title-np">Product Name</label>
                                    <input class="input" placeholder="Product Name" type="text" name="txtProductName" value="<%= pro.getProductName()%>"
                                           id="email">
                                </div>
                            </div>
                            <div class="inputbox">
                                <div class="label-group"><label class="lb-title-np">Price</label>
                                    <input class="input" placeholder="Price" type="text"  name="txtPrice" value="<%= pro.getPrice()%>" id="phone">
                                </div>
                            </div>
                            <div class="inputbox">
                                <div class="birthday-1">
                                    <label class="lb-title">Quantity</label>
                                    <label class="lb-title">Size</label>
                                    <label class="lb-title">Active</label>
                                    <input type="text" placeholder="Quantity" name="txtQuantity" value="<%= pro.getQuantity()%>" class="input" id="day">
                                    <input type="text" placeholder="Size" name="txtSize" value="<%= pro.getSize()%>" class="input" id="month">
                                    <select name="txtActive" class="input" id="month">
                                        <option value="1" <%= pro.getActive()%>"
                                                <%= pro.getActive() == 1 ? "selected" : ""%>> In Stock
                                        </option>
                                        <option value="0" <%= pro.getActive()%>"
                                                <%= pro.getActive() == 0 ? "selected" : ""%>> Sold Out
                                        </option>

                                    </select>
                                </div>
                            </div>
                            <div class="inputbox">
                                <div class="label-group"><label class="lb-title-np">Description</label>
                                    <textarea class="input" placeholder="Description" name="txtProductDes" value="<%= pro.getProductDes()%>" id="" cols="30"
                                              rows="3"><%= pro.getProductDes()%></textarea></div>
                            </div>
                            <div class="btn_admin">
                                <div class="button-group" style="display: flex; gap:1.5rem; align-items: center;">

                                    <button onclick="return confirm('Confirm for deletion?');" href="/Product/Delete/<%= pro.getProductID()%>" class="btnDelete" role="button"><i class="fa-solid fa-trash"></i> Delete</button>
                                    <input type="hidden" id="userID" name="userId" value=""> 
                                    <input type="hidden" name="txtProductID" value="<%= pro.getProductID()%>">
                                    <input type="hidden" name="oldImagePath" value="<%= pro.getProductImageURL()%>">
                                    <input type="submit" id="updateinfo" class="btnUp" name="btnUpdatePro" value="Change Update">
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
        <script src="/js/MyScript/UpdateProduct.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
