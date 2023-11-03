<%@page import="DAOs.CategoryDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.BrandDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Brand</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="/CSS/VyStyle/CreateProduct.css">
    </head>
    <body> 

        <div class="container">
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
            <jsp:include page="/Admin_navigation.jsp">

                <jsp:param name="ID" value="<%=usID%>"/>
            </jsp:include>
            <div class="admin_background"></div>
            <div class="admin_info grid-item">
                <jsp:include page="/Admin_anlyzes.jsp"></jsp:include>
                    <div class="admin_background"></div>
                    <div class="admin_content">
                        <div class="admin_content_info">
                            <!--                    <div class="product-img">
                                                    <img src="/img/Pic2.png" alt="">
                                                </div>-->
                            <div class="Category-list">
                                <h3>Existing Category:</h3>
                                <ul>
                                <%
                                    CategoryDAO cateDao = new CategoryDAO();
                                    ResultSet rs = cateDao.GetAll();
                                    while (rs.next()) {
                                %>
                                <li><%= rs.getString("CatName")%></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </div>
                        <div class="search-box">
                            <input type="text" id="searchInput" placeholder="Search Category...">
                        </div>

                        <input id="file-upload" type="file" name="txtCategoryName" accept="image/png, image/jpeg" />
                        <div class="admin_btn" onclick="location.href = '/Admin/Product/List'" >
                            <span><i class="fa-solid fa-arrow-left "></i></span>
                        </div>
                    </div>
                    <div class="admin_content_infos">

                        <form class="admin_form" onsubmit="return ValidateCategoryName()" action="/addNewCategory" method="post">
                            <div class="inputbox">

                                <div class="label-group">
                                    <label class="lb-title-np">Category Name</label>
                                    <input class="input" placeholder="Category Name" type="text" name="txtCategoryName" id="txtCategoryName">
                                </div>
                            </div>
                            <div class="btn_admin">
                                <input type="submit" class="dm" name="btnAddCategory" value="Add Category">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Thêm mã JavaScript vào trong thẻ <head> hoặc cuối trang -->
        <script>
            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
            %>
            alert("<%= message%>");

            <%
                }
            %>
        </script>

        <script>
            // Xử lý tìm kiếm
            document.getElementById('searchInput').addEventListener('input', function () {
                var keyword = this.value.toLowerCase();
                var brands = document.querySelectorAll('.Category-list ul li');

                for (var i = 0; i < brands.length; i++) {
                    var brandName = brands[i].innerText.toLowerCase();
                    if (brandName.includes(keyword)) {
                        brands[i].style.display = 'block';
                    } else {
                        brands[i].style.display = 'none';
                    }
                }
            });
        </script>
    </body>
</html>
