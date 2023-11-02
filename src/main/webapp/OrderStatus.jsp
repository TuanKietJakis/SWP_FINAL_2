<%-- 
    Document   : Admin_Dashboard
    Created on : Oct 24, 2023, 11:19:57 PM
    Author     : khoic
--%>

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
            int usID = (int) session.getAttribute("AdminstratorID");
            OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
            ResultSet resultSet = orderStatusDAO.GetAll();

            int[] statusIDs = new int[3];
            String[] statusNames = new String[3];

            int index = 0;
            while (resultSet.next()) {
                statusIDs[index] = resultSet.getInt("StatusID");
                statusNames[index] = resultSet.getString("StatusName");
                index++;
            }
            int pendingCount = orderStatusDAO.GetTotalCount(1);
            int deliveredCount = orderStatusDAO.GetTotalCount(2);
            int rejectedCount = orderStatusDAO.GetTotalCount(3);
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
                const ctx = document.getElementById('myChart');
                new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: ['Pending <%= pendingCount%>', 'Delivered <%= deliveredCount%>', 'Rejected <%= rejectedCount%>'], // Thay đổi các nhãn tại đây
                        datasets: [{
                                label: '# of Orders',
                                data: [<%= pendingCount%>, <%= deliveredCount%>, <%= rejectedCount%>],
                                borderWidth: 1,
                                backgroundColor: ['#F1C40F', '#228B22', '#FF0000'],
                            }]
                    },
                    options: {
                        plugins: {
                            legend: {
                                onHover: handleHover,
                                onLeave: handleLeave
                            }
                        }
                    }
                });
                function handleHover(evt, item, legend) {
                    legend.chart.data.datasets[0].backgroundColor.forEach((color, index, colors) => {
                        colors[index] = index === item.index || color.length === 9 ? color : color + '4D';
                    });
                    legend.chart.update();
                }
                // Removes the alpha channel from background colors
                function handleLeave(evt, item, legend) {
                    legend.chart.data.datasets[0].backgroundColor.forEach((color, index, colors) => {
                        colors[index] = color.length === 9 ? color.slice(0, -2) : color;
                    });
                    legend.chart.update();
                }
        </script>
    </body>
</html>
