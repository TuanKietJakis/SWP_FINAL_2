<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.FAQDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FAQ List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="/CSS/VyStyle/CreateProduct.css">
    </head>
    <body> 
  
      <style>
            .faq-list {
                list-style-type: none;
                padding: 0;
            }

            .faq-item {
                margin-bottom: 20px;
                border: 1px solid #ccc;
                padding: 10px;
                background-color: #f9f9f9;
                width: 400px;
            }

            .faq-item strong {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .search-box {
                margin-top: 10px;
            }
            /* styles.css */
            .faq-list {
                list-style-type: none;
                padding: 0;
            }

            .faq-item {
                margin-bottom: 20px;
                border: 1px solid #ccc;
                padding: 10px;
                background-color: #f9f9f9;
            }

            .faq-item strong {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .search-box {
                margin-top: 10px;
            }

        </style>
        <div class="container">
            <%
                int usID = (int) session.getAttribute("AdminstratorID");
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
                            <div class="admin_btn" onclick="location.href = '/Admin'" >
                                <span><i class="fa-solid fa-arrow-left "></i></span>
                            </div>
                                                    <div class="search-box">
                            <input type="text" id="searchInput" placeholder="Search FAQ...">
                        </div>
                        </div>
                        <div class="admin_content_infos">
                            <div class="brand-list">
                                <h3>FAQ List:</h3>
                                <ul class="faq-list">
                                <%
                                    FAQDAO faq = new FAQDAO();
                                    ResultSet rs = faq.GetAll();
                                    while (rs.next()) {
                                %>
                                <li class="faq-item">
                                    <strong>FAQ ID:</strong> <%= rs.getString("FAQID")%><br/>
                                    <strong>Question:</strong> <%= rs.getString("Question")%><br/>
                                    <strong>Answer:</strong> <%= rs.getString("Answer")%> 
                                </li>
                                <%
                                    }
                                    rs.close(); // Đóng ResultSet sau khi sử dụng
%>
                            </ul>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <script>
            // Xử lý tìm kiếm
            document.getElementById('searchInput').addEventListener('input', function () {
                var keyword = this.value.toLowerCase();
                var faqs = document.querySelectorAll('.brand-list ul li');

                for (var i = 0; i < faqs.length; i++) {
                    var faqInfo = faqs[i].innerText.toLowerCase();
                    if (faqInfo.includes(keyword)) {
                        faqs[i].style.display = 'block';
                    } else {
                        faqs[i].style.display = 'none';
                    }
                }
            });
        </script>
    </body>
</html>
