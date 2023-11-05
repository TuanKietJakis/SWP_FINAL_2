<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.OrderDAO"%>
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
        <!--<link rel="stylesheet" href="/CSS/admindashboard.css">-->
        <link rel="stylesheet" href="/CSS/Income.css">
        <title>JSP Page</title>

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
            } else {
                response.sendRedirect("/Home");
            }
        %>
        <%
// income Month chua xong, xuat bill chua duoc.
            String start = request.getParameter("startDate");
            String end = request.getParameter("endDate");

            OrderDAO oDAO = new OrderDAO();
            ResultSet resultSet2 = oDAO.GetIncomeOnMonth(start, end);

            OrderDAO o3DAO = new OrderDAO();
//            ResultSet resultSet3 = oDAO.GetBillOnMonth(start, end);

            OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
            ResultSet resultSet = orderStatusDAO.GetAll();

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
                    <div class="admin_background"></div>
                    <div class="admin_content">
                        <div class="admin_content_info">
                            <div class="chart">
                                <div class="chart1">
                                    <!-- Sửa tiêu đề của chart ở đây -->
                                    <h1>ABC</h1>
                                    <canvas id="myChart1"></canvas> <!-- This is for the first chart -->

                                </div>
                                <div class="chart2">
                                    <!-- Sửa tiêu đề của chart ở đây -->
                                    <h1>ABC</h1>
                                    <canvas id="myChart2"></canvas> <!-- This is for the second chart -->
                                </div>
                                <!-- Hai cái nút để bấm -->
                            </div>
                        </div>
                        <div class="admin_content_infos">
                            <form action="">
                                <div class="table_container">
                                    <div class="table" id="filterTable">
                                        <div class="table_tittle">

                                            <h3>OrderID</h3>
                                            <h3>Order Date</h3>
                                            <h3>Product Name</h3>
                                            <h3>Product Price</h3>
                                            <h3>Product Cost</h3>
                                            <h3>Quantity</h3>
                                            <h3>Total Price</h3>
                                            <h3>Product ID</h3>
                                            <h3>Active</h3>
                                            <h3>Rate Number</h3>
                                            <h3>Full Name</h3>
                                            <h3>Email</h3>
                                            <h3>Phone Number</h3>


                                        </div>
                                        <div class="table_body">
                                        <%
                                            ResultSet resultSet3 = oDAO.GetBillOnMonth(start, end);
                                            while (resultSet3.next()) {
                                        %>
                                        <div class="table_data table_data2" data-table="2">
                                            <p><%= resultSet3.getInt("OrderID")%></p>
                                            <p><%= resultSet3.getString("OrderDate")%></p>
                                            <p class="email_input"><%= resultSet3.getString("ProductName")%></p>
                                            <p class="email_input"><%= resultSet3.getInt("ProductPrice")%></p>
                                            <p class="role"><%= resultSet3.getInt("ProductCost")%> </p>
                                            <p><%= resultSet3.getInt("Quantity")%> </p>
                                            <p><%= resultSet3.getInt("TotalPrice")%></p>
                                            <p><%= resultSet3.getInt("ProductID")%></p>
                                            <p><%= resultSet3.getInt("Active")%></p>
                                            <p><%= resultSet3.getString("FullName")%></p>
                                            <p><%= resultSet3.getString("Email")%></p>
                                            <p><%= resultSet3.getString("PhoneNumber")%></p>
                                            <p><%= resultSet3.getInt("TotalPrice")%></p>
                                        </div>
                                        <% }%>
                                    </div>
                                </div>
                                <div class="export_btn">
                                    <input type="submit" value="Export">
                                </div>

                            </div>
                        </form>

                    </div>
                </div>
            </div>

        </div>
        <script src="js/Admin_dashboard.js"></script>
        <script src="js/Utils.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script>
            <%while (resultSet2.next()) {
            %>
            const ctx1 = document.getElementById('myChart1');
            new Chart(ctx1, {
                type: 'bar',
                data: {
                    labels: ['Income'],
                    datasets: [{
                            label: 'Total Income',
                            data: [<%= resultSet2.getInt("GrandTotalProductPrice") - resultSet2.getInt("GrandTotalProductCost")%>],
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




        <script>
            const ctx2 = document.getElementById('myChart2');
            new Chart(ctx2, {
                type: 'pie',
                data: {
                    labels: ['Pending <%= pendingCount%>', 'Delivered <%= deliveredCount%>', 'Rejected <%= rejectedCount%>'],
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

            function handleLeave(evt, item, legend) {
                legend.chart.data.datasets[0].backgroundColor.forEach((color, index, colors) => {
                    colors[index] = color.length === 9 ? color.slice(0, -2) : color;
                });
                legend.chart.update();
            }
        </script>
    </body>
</html>