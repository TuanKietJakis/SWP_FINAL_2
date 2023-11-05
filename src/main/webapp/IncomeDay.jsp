<%@page import="javafx.scene.control.Cell"%>
<%@page import="com.sun.rowset.internal.Row"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.OrderDAO"%>
<%@page import="DAOs.AccountDAO"%>
<%@page import="DAOs.OrderStatusDAO"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="org.apache.poi.ss.usermodel.*"%>
<%@page import="java.io.*"%>
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
            // income day dã xong, xuat bill chua duoc mac du da goi DAO xong.
            String Day = request.getParameter("date");
            if (Day == null) {
                Day = "NULL"; // xy ly null
            }

            OrderDAO oDAO = new OrderDAO();
            ResultSet resultSet1 = oDAO.GetIncomeOnDay(Day);

//            ResultSet resultSet2 = oDAO.GetBillOnDay(Day);
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
                                    <h1>Income Day</h1>
                                    <canvas id="myChart1"></canvas> <!-- This is for the first chart -->

                                </div>
                                <div class="chart2">
                                    <!-- Sửa tiêu đề của chart ở đây -->
                                    <h1>Total Order</h1>
                                    <canvas id="myChart2"></canvas> <!-- This is for the second chart -->
                                </div>
                                <!-- Hai cái nút để bấm -->
                            </div>
                        </div>
                        <div class="admin_content_infos">
                            <form action="ExportFileController" method="get">
                                <div class="table_container">
                                    <div class="table" id="filterTable">
                                        <div class="table_tittle">

                                            <h3>Order ID</h3>
                                            <h3>Order Date</h3>
                                            <h3>Product Name</h3>
                                            <h3>Product Price</h3>
                                            <h3>Product Cost</h3>
                                            <h3>Quantity</h3>
                                            <h3>Total Price</h3>
                                            <h3>Product ID</h3>
                                            <h3>Active</h3>
                                            <h3>Full Name</h3>
                                            <h3>Email</h3>
                                            <h3>Phone Number</h3>


                                        </div>
                                        <div class="table_body">
                                        <%
                                            try {
                                                ResultSet resultSet2 = oDAO.GetBillOnDay(Day);
                                                while (resultSet2.next()) {
                                        %>
                                        <div class="table_data table_data2" data-table="2">
                                            <p><%= resultSet2.getInt("OrderID")%></p>
                                            <p><%= resultSet2.getString("OrderDate")%></p>
                                            <p class="email_input"><%= resultSet2.getString("ProductName")%></p>
                                            <p class="email_input"><%= resultSet2.getInt("ProductPrice")%></p>
                                            <p class="role"><%= resultSet2.getInt("ProductCost")%> </p>
                                            <p><%= resultSet2.getInt("Quantity")%> </p>
                                            <p><%= resultSet2.getInt("TotalPrice")%></p>
                                            <p><%= resultSet2.getInt("ProductID")%></p>
                                            <p><%= resultSet2.getInt("Active")%></p>
                                            <p><%= resultSet2.getString("FullName")%></p>
                                            <p><%= resultSet2.getString("Email")%></p>
                                            <p><%= resultSet2.getString("PhoneNumber")%></p>
                                        </div>
                                        <% }
                                            } catch (SQLException e) {
                                                e.printStackTrace();
                                            }
                                        %>

                                    </div>
                                </div>
                                <div class="export_btn">
                                    <input type="hidden" name="date" value="<%= Day%>">

                                    <div class="export_btn">
                                        <input type="submit" value="Export to Excel">
                                    </div>
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
            <%while (resultSet1.next()) {
            %>
            const ctx1 = document.getElementById('myChart1');
            new Chart(ctx1, {
                type: 'bar',
                data: {
                    labels: ['Income'],
                    datasets: [{
                            label: 'Total Income',
                            data: [<%= resultSet1.getInt("TotalProductPrice") - resultSet1.getInt("TotalProductCost")%>],
                            borderWidth: 1,
                            backgroundColor: ['#04B200'],
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
                            backgroundColor: ['rgba(255, 238, 89, 1.5)', 'rgba(127, 255, 140, 1.5)', 'rgba(255, 150, 127, 1.5)'],
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