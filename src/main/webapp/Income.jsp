<%-- 
    Document   : Admin_Dashboard
    Created on : Oct 24, 2023, 11:19:57 PM
    Author     : khoic
--%>

<%@page import="DAOs.OrderDAO"%>
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
        .chart-container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        canvas {
            width: 100%;
            height: auto;
            display: block;
            border-radius: 8px;
        }

    </style>
    <body>
        <%
            String Day = "2023-10-22";
            String Month = "";
            String Year = "";
            int usID = (int) session.getAttribute("AdminstratorID");
            OrderDAO oDAO = new OrderDAO();
            ResultSet resultSet1 = oDAO.GetIncomeOnDay(Day);
            ResultSet resultSet2 = oDAO.GetIncomeOnMonth(Month, Year);

        %>

        <div class="container">
            <jsp:include page="Admin_navigation.jsp">
                <jsp:param name="ID" value="<%=usID%>"/>
            </jsp:include>             
            <div class="admin_background">

            </div>
            <div class="admin_info grid-item">
                <jsp:include page="Admin_anlyzes.jsp"></jsp:include>
                    <div class="admin_content">
                        <div class="chart-container">
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>

                </div>
            </div>
            <script src="js/Admin_dashboard.js"></script>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
            <%while (resultSet1.next()) {
            %>
            const ctx = document.getElementById('myChart');

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Income'],
                    datasets: [{
                            label: 'Total Income',
                            data: [<%= resultSet1.getInt("TotalProductPrice") -resultSet1.getInt("TotalProductCost") %>],
                            borderWidth: 1,
                            backgroundColor: ['#009900'],

                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            <% }%>
        </script>
    </body>
</html>