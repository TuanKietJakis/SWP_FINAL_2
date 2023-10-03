<%-- 
    Document   : Analytics
    Created on : Jun 2, 2023, 8:34:48 AM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Info</title>
        <script src="https://code.jquery.com/jquery-3.5.1.js">
        </script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/StyleAdminPanel.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/button5.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/listStyle.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/StyleInputForm.css">
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js">
        </script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <style>
            .table-data{
                text-align: center;
            }
            .error {
                color: red;
                border-style: none;
            }
        </style>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <script src="<%=request.getContextPath()%>/js/ValidateOrder.js"></script>
    </head>
    <body>
        <!-- SIDEBAR -->
        <%@include file="/JSP/SectionList.jsp" %>  
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
            <!-- MAIN -->

            <main>

                <div class="table-data">
                    <div class="order">

                        <div class="head">
                            <h3>Categories Management</h3>
                        </div>
                        <%
                            ResultSet rs = (ResultSet) request.getAttribute("rs");
                            while (rs.next()) {
                        %>
                        <form class="mb-5" method="post"  action="Order" onsubmit="return ValidationDoB()">
                            <div class="row">  
                                <div class="col-md-6 form-group">
                                    <label for="email" class="col-form-label">Order ID</label>
                                    <input type="text" class="form-control" value="<%=rs.getString("OrderID")%>" readonly="">
                                </div>
                            </div>

                            <div class="row">                                   
                                <div class="col-md-12 form-group">
                                    <label for="name" class="col-form-label">Full name</label>
                                    <input type="text" class="form-control" value="<%=rs.getString("fn")%>" readonly="">
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12 form-group">
                                    <label for="email" class="col-form-label">Email</label>
                                    <input type="text" class="form-control" value="<%=rs.getString("Email")%>" readonly="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 form-group">
                                    <label for="email" class="col-form-label">Order Detail</label>
                                    <table id="example">
                                        <thead>
                                            <tr>

                                                <th>Product Name</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
                                            <%
                                                ResultSet rsOD = (ResultSet) request.getAttribute("rsOD");
                                                while (rsOD.next()) {
                                            %>
                                            <tr>
                                                <td><%=rsOD.getString("ProductName")%></td>
                                                <td><%=rsOD.getInt("Quantity")%></td>
                                                <td><%=rsOD.getInt("Price")%>$</td>
                                            </tr>
                                            <%
                                                }
                                            %>   
                                        </tbody> 
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label for="email" class="col-form-label">Total Price</label>
                                    <input type="text" class="form-control" value="<%=rs.getInt("Price")%>$" readonly="">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="email" class="col-form-label">Phone Number</label>
                                    <input type="text" class="form-control" value="<%=rs.getString("PhoneNumber")%>" readonly="">
                                </div>
                            </div>                               


                            <div class="row">
                                <div class="col-md-12 form-group">
                                    <label for="email" class="col-form-label">Delivery date</label>
                                    <%
                                        if (!rs.getString("Status").equals("Arrived")) {
                                    %>
                                    <input type="date" class="form-control" name="txtDate" id="DateInput">
                                    <%
                                    } else {
                                    %>
                                    <input type="text" class="form-control" value="<%=rs.getString("Delivery_Time")%>" readonly="">
                                    <%
                                        }
                                    %>
                                    <div class="error" id="ErrorDate"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 form-group">
                                    <label for="email" class="col-form-label">Delivery note</label>
                                    <input type="text" class="form-control" value="<%=rs.getString("Delivery_Instruction")%>" readonly="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 form-group">
                                    <label for="email" class="col-form-label">Delivery Address</label>
                                    <input type="text" class="form-control" value="<%=rs.getString("OrderAddressID")%>" readonly="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label for="email" class="col-form-label">Payment Method</label>
                                    <input type="text" class="form-control" value="<%=rs.getString("PaymentMethodID")%>" readonly="">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="email" class="col-form-label">Status</label>
                                    <input type="text" class="form-control" value="<%=rs.getString("Status")%>" readonly="">
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-md-12">
                                    <%
                                        if (!rs.getString("Status").equals("Arrived")) {
                                    %>
                                    <input type="submit" value="Complete Order" name="SubmitCart" class="button-1 btn-block btn-primary rounded-0 py-2 px-4">
                                    <%
                                        }
                                    %>
                                    <input type="hidden" name="hiddenID" value="<%=rs.getInt("OrderID")%>">
                                </div>
                            </div>
                        </form>
                        <%
                            }
                        %>

                    </div>				
                </div> 
            </main>

            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="../JavaScript/script.js"></script>
        <script src="<%=request.getContextPath()%>/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/bootstrap.min.js"></script>
    </body>
</html>
