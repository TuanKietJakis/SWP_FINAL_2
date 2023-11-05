<%-- 
    Document   : Admin_Dashboard
    Created on : Oct 24, 2023, 11:19:57 PM
    Author     : khoic
--%>

<%@page import="DAOs.FaQDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.AccountDAO"%>
<%@page import="DAOs.OrderStatusDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="/CSS/admindashboard.css">
        <title>JSP Page</title>
    </head>
    <style>
        .admin_content{
            justify-content: center;
            
        }
        .faq-list {
            list-style-type: none;
            padding: 0;
        }

        .faq-item {
            margin-bottom: 20px;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #f9f9f9;
            /*width: 400px;*/
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
            display: flex;
            flex-direction: column;
            
            list-style-type: none;
            padding: 0;
        }

        .faq-item {
            flex: 1;
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
            } else {
                response.sendRedirect("/Home");
            }
        %>

        <div class="container">
            <jsp:include page="Admin_navigation.jsp">
                <jsp:param name="ID" value="<%=usID%>"/>
            </jsp:include>             
            <div class="admin_background">

            </div>
            <div class="admin_info grid-item">
                <jsp:include page="/Admin_anlyzes.jsp"></jsp:include>
                    <div class="admin_background"></div>
                    <div class="admin_content">
                        <div class="admin_content_info">
                            <div class="admin_btn" onclick="location.href = '/Admin'" >
                                <span><i class="fa-solid fa-arrow-left"></i></span>
                            </div>
<!--                            <div class="search-box">
                                <input type="text" id="searchInput" placeholder="Search FAQ...">
                            </div>-->
                        </div>
                        <div class="admin_content_infos">
                            <div class="brand-list">
                                <h3>FAQ List:</h3>
                                <ul class="faq-list">
                                <%
                                    FaQDAO faq = new FaQDAO();
                                    ResultSet rs = faq.GetAll();
                                    while (rs.next()) {
                                %>
                                <li class="faq-item">
                                    <strong>FAQ ID:</strong> <%= rs.getString("FAQID")%><br/>
                                    <strong>Question:</strong> <%= rs.getString("Question")%><br/>
                                    <strong>Email:</strong> <%= rs.getString("Email")%> 
                                </li>
                                <%
                                    }
                                    rs.close(); // Close the ResultSet after use
                                %>
                            </ul>
                        </div>
                    </div>
                    <div class="Account_search">
                        <input type="text" id="searchInput" placeholder="Search...">
                    </div>
                </div>
            </div>
        </div>
        <script src="/js/Admin_dashboard.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
                                // Search functionality
                                document.getElementById('searchInput').addEventListener('input', function () {
                                    var keyword = this.value.toLowerCase();
                                    var faqs = document.querySelectorAll('.brand-list ul li');

                                    faqs.forEach(function (faq) {
                                        var faqInfo = faq.innerText.toLowerCase();
                                        if (faqInfo.includes(keyword)) {
                                            faq.style.display = 'block';
                                        } else {
                                            faq.style.display = 'none';
                                        }
                                    });
                                });
        </script>
    </body>
</html>
