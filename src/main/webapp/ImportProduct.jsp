<%-- 
    Document   : ImportProduct
    Created on : Nov 1, 2023, 10:16:48 PM
    Author     : khoic
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="/CSS/AddNewProduct.css">
    </head>
    <body>
        <%
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("adminID") && !cookie.getValue().equals("")) {
                        session.setAttribute("AdminstratorID", Integer.parseInt(cookie.getValue()));
                        break;
                    }
                }
            }
        %>
        <%
            int usID = 0;
            if (session.getAttribute("AdminstratorID") != null) {
                usID = (int) session.getAttribute("AdminstratorID");
            }else{
            response.sendRedirect("/Home");
            }
        %>
        <div class="container">
            <jsp:include page="/Admin_navigation.jsp">
                <jsp:param name="ID" value="<%=usID%>"/>
            </jsp:include>
            <div class="admin_background">

            </div>
            <div class="admin_info grid-item">
                <jsp:include page="Admin_anlyzes.jsp"></jsp:include>  
                    <div class="admin_background"></div>
                    <div class="admin_content">
                        <div class="admin_content_info">
                            <div class="container_add_image">
                                <div class="image_container">
                                    <img src="/img/default-product-image.jpg" alt="" id="show_image">
                                </div>
                                <label class="new_image" for="chooseImage">+</label>
                            </div>
                            <div class="admin_btn" onclick="location.href='/Admin/Product/List'">
                                <span><i class="fa-solid fa-arrow-left"></i></span>

                            </div>
                        </div>
                        <div class="admin_content_infos">
                            <form class="admin_form" id="update_form" action="/Admin/Product" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="imgTmp" value="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg">
                                <input type="file" hidden name="txtProductImageURL" id="chooseImage">
                                <div class="inputbox_select">
                                    <div class="selected">
                                        <div class="selected_select">
                                            <select class="input_other " name="BrandSelect" id="Brand">
                                            <%
                                                ProductDAO dao = new ProductDAO();
                                                ResultSet rs = dao.GetAllBrandName();
                                                while (rs.next()) {
                                            %>
                                            <option value="<%= rs.getString("BrandName")%>"><%= rs.getString("BrandName")%></option>
                                            <%
                                                }
                                            %>
                                            <option value="100">Other</option>
                                        </select>
                                        <input type="text" name="brandinput" id="input_brand" class="hide_input">
                                    </div>
                                    <div class="hide_error i1" id="error"></div>
                                </div>
                                <div class="selected">
                                    <div class="selected_select">
                                        <select class="input_other "  name="CateSelect" id="Category">
                                            <%
                                                ProductDAO dao1 = new ProductDAO();
                                                ResultSet rs1 = dao1.GetAllCategoryName();
                                                while (rs1.next()) {
                                            %>
                                            <option value="<%= rs1.getString("CatName")%>"><%= rs1.getString("CatName")%></option>
                                            <%
                                                }
                                            %>
                                            <option value="100">Other</option>
                                        </select>
                                        <input type="text" name="cateinput" id="input_category" class=" hide_input">
                                    </div>
                                    <div class="hide_error i2" id="error"></div>
                                </div>

                            </div>
                            <div class="inputbox">
                                <input class="input" placeholder="Product Name" type="text" name="ProName" id="email">
                                <div class="hide_error i3" id="error">A</div>
                            </div>
                            <div class="inputbox_number">  
                                <div class="input_number">
                                    <input class="input_number_field" placeholder="Price" type="text" name="ProPrice" id="phone">
                                    <div class="hide_error i4" id="error">A</div>
                                </div>
                                <div class="input_number">
                                    <input class="input_number_field" placeholder="Original Price" type="text" name="ProOrPrice" id="OrPrice">
                                    <div class="hide_error i8" id="error">A</div>
                                </div>

                            </div>
                            <div class="inputbox_number">
                                <div class="input_number">
                                    <input class="input_number_field" placeholder="Quantity" type="text" name="ProQuan" id="Quantity">
                                    <div class="hide_error i5" id="error">A</div>
                                </div>
                                <div class="input_number">
                                    <input class="input_number_field" placeholder="Size" type="text" name="ProSize" id="size">
                                    <div class="hide_error i6" id="error">A</div>
                                </div>


                            </div>
                            <div class="inputbox">
                                <textarea class="input" placeholder="Description" name="ProDes" id="des" cols="30" rows="10"></textarea>
                                <div class="hide_error i7" id="error">
                                    A
                                </div>
                            </div>
                            <!-- <div class="message">
                                <p id="show_message" style="color: green;"></p>
                            </div> -->
                            <div class="btn_admin">
                                <input type="submit" id="update" name="btnImportProduct" class="dm" value="Import New Product">

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="/js/ImportProduct.js"></script>
    </body>
</html>
