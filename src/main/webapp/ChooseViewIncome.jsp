<%-- 
    Document   : Admin_Dashboard
    Created on : Oct 24, 2023, 11:19:57 PM
    Author     : khoic
--%>

<%@page import="DAOs.ProductDAO"%>
<%@page import="DAOs.CategoryDAO"%>
<%@page import="DAOs.BrandDAO"%>
<%@page import="DAOs.CategoryDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.AccountDAO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="/CSS/admindashboard.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/StyleAdminPanel.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/button5.css">
        <title>JSP Page</title>
    </head>

    <body>
        <%
            int usID = (int) session.getAttribute("AdminstratorID");

        %>

        <div class="container">
            <jsp:include page="Admin_navigation.jsp">
                <jsp:param name="ID" value="<%=usID%>"/>
            </jsp:include>             
            <div class="admin_background">

            </div>
            <div class="admin_info grid-item">
                <jsp:include page="Admin_anlyzes.jsp"></jsp:include>
                <div class="order_list_container">
                    <section id="content">
                        <main>
                            <div class="table-data">
                                <div class="order">
                                    <button class="addNewBrand" onclick="getIncomeByDay()">Income Day</button>
                                    <button class="addNewBrand" onclick="getIncomeByMonth()">Income Month</button>
                                    <form id="dateForm" action="/Admin/Income/Day" method="get">
                                        <input type="hidden" id="selectedDate" name="date">
                                    </form>
                                    <form id="monthForm" action="/Admin/Income/Month" method="get">
                                        <input type="hidden" id="selectedStartDate" name="startDate">
                                        <input type="hidden" id="selectedEndDate" name="endDate">
                                    </form>


                                    <div class="table_example">
                                        <table id="example">
                                        </table>
                                    </div>
                                </div>				
                            </div>            
                        </main>
                    </section>
                </div>
            </div>
        </div>
        <script src="js/Admin_dashboard.js"></script>
        <script>
//                                        function getIncomeByDay() {
//                                            var date = prompt("Enter date (YYYY-MM-DD):");
//                                            if (date !== null) {
//                                                document.getElementById('selectedDate').value = date;
//                                                document.getElementById('dateForm').submit();
//                                                alert('Form submitted with date: ' + date);
//                                            }
//                                        }
//
//                                        function getIncomeByMonth() {
//                                            var monthYear = prompt("Enter month and year (MM-YYYY):");
//                                            if (monthYear !== null) {
//                                                var parts = monthYear.split("-");
//                                                var month = parts[0];
//                                                var year = parts[1];
//                                                document.getElementById('selectedMonth').value = month;
//                                                document.getElementById('selectedYear').value = year;
//                                                document.getElementById('monthForm').submit();
//                                                alert('Form submitted with month and year: ' + monthYear);
//                                            }
//                                        }
                                        function getIncomeByDayBackup() {
                                            var date = prompt("Enter date (YYYY-MM-DD):");
                                            if (date !== null) {
                                                // Kiểm tra định dạng ngày
                                                var dateRegex = /^\d{4}-\d{2}-\d{2}$/;
                                                if (!date.match(dateRegex)) {
                                                    alert('Invalid date format. Please use YYYY-MM-DD.');
                                                    return;
                                                }

                                                document.getElementById('selectedDate').value = date;
                                                document.getElementById('dateForm').submit();
                                                alert('Form submitted with date: ' + date);
                                            }
                                        }

//                                        function getIncomeByMonth() {
//                                            var monthYear = prompt("Enter month and year (MM-YYYY):");
//                                            if (monthYear !== null) {
//                                                // Kiểm tra định dạng tháng
//                                                var monthYearRegex = /^\d{2}-\d{4}$/;
//                                                if (!monthYear.match(monthYearRegex)) {
//                                                    alert('Invalid month and year format. Please use MM-YYYY.');
//                                                    return;
//                                                }
//
//                                                var parts = monthYear.split("-");
//                                                var month = parts[0];
//                                                var year = parts[1];
//                                                document.getElementById('selectedMonth').value = month;
//                                                document.getElementById('selectedYear').value = year;
//                                                document.getElementById('monthForm').submit();
//                                                alert('Form submitted with month and year: ' + monthYear);
//                                            }
//                                        }
                                        function getIncomeByDay() {
                                            var date = prompt("Enter date (YYYY-MM-DD):");
                                            if (date !== null) {
                                                var dateRegex = /^\d{4}-\d{2}-\d{2}$/;
                                                if (!date.match(dateRegex)) {
                                                    alert('Invalid date format. Please use YYYY-MM-DD.');
                                                    return;
                                                }

                                                document.getElementById('selectedDate').value = date;
                                                document.getElementById('dateForm').submit();
                                                alert('Form submitted with date: ' + date);
                                            }
                                        }

                                        function getIncomeByMonth() {
                                            var startDate = prompt("Enter start date (YYYY-MM-DD):");
                                            if (startDate !== null) {
                                                var endDate = prompt("Enter end date (YYYY-MM-DD):");
                                                if (endDate !== null) {
                                                    var dateRegex = /^\d{4}-\d{2}-\d{2}$/;
                                                    if (!startDate.match(dateRegex) || !endDate.match(dateRegex)) {
                                                        alert('Invalid date format. Please use YYYY-MM-DD.');
                                                        return;
                                                    }

                                                    document.getElementById('selectedStartDate').value = startDate;
                                                    document.getElementById('selectedEndDate').value = endDate;
                                                    document.getElementById('monthForm').submit();
                                                    alert('Form submitted with start date: ' + startDate + ' and end date: ' + endDate);
                                                }
                                            }
                                        }




        </script>
    </body>
</html>
