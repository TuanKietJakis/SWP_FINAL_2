<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Type Select</title>      
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <!-- Bootstrap JS -->

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/bootstrap.min.css">
        <!-- Bootstrap CSS -->

        <!-- Style -->       
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/StyleAdminPanel.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/button5.css">
        <!-- Style -->
    </head>
    <body>
        <!-- SIDEBAR -->
        <%@include file="/JSP/SectionList.jsp" %>  
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
            <!-- MAIN -->

            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Dashboard</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#">Home</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content">    

                    <div class="table-data">
                        <div class="col-md-12">
                            <div class="box">
                                <form class="mb-5" method="post"  action="Order" > 
                                    <div class="row">  
                                        <div class="col-md-6 form-group" >
                                            <input type="submit" value="Pending Order" name="btnPendingOrder" class="button-2 btn-block btn-primary rounded-0 py-2 px-4">
                                        </div>
                                        <div class="col-md-6 form-group" >
                                            <input type="submit" value="Complete Order" name="btnCompleteOrder" class="button-2 btn-block btn-primary rounded-0 py-2 px-4">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <table id="example">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>        
                                    <%
                                        ResultSet rs = (ResultSet) request.getAttribute("rs");
                                        while (rs.next()) {
                                    %>
                                    <tr>
                                        <td><%=rs.getInt("OrderID")%></td>
                                        <td>
                                            <h4>Customer:</h4> <p><%=rs.getString("fn")%></p>
                                            <br>
                                            <h4>Email:</h4> <p><%=rs.getString("Email")%></p>
                                        </td>
                                        <td> 
                                            <h4>Contact:</h4> <p><%=rs.getString("PhoneNumber")%></p> 
                                            <br>
                                            <h4>Address:</h4> <p><%=rs.getString("OrderAddressID")%></p>
                                        </td>
                                        <td> 
                                            <%
                                                if (!rs.getDate("Delivery_Time").equals(Date.valueOf("2000-01-01"))) {
                                            %>
                                            <h4>Date:</h4> <p><%=rs.getDate("Delivery_Time")%></p>
                                            <%
                                            } else {
                                            %>
                                            <h4>Date:</h4> <p>Currently Setting A Delivery Time</p>
                                            <%    }
                                            %>
                                        </td>
                                        <td> 
                                            <h4>Total:</h4> <p><%=rs.getInt("TotalPrice")%>$</p>
                                        </td>
                                        <td>
                                            <h4>Status:</h4> <p><%=rs.getString("StatusID")%></p>
                                            <h4>Payment Method:</h4> <p><%=rs.getString("PaymentMethodID")%></p>
                                        </td>
                                        <td>
                                            <a href="/Order/Detail/<%=rs.getInt("OrderID")%>">Show Order</a>
                                        </td>
                                    </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>


                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="../JavaScript/script.js"></script>
    </body>
</html>

