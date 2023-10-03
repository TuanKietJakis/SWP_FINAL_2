<%-- 
    Document   : Analytics
    Created on : Jun 2, 2023, 8:34:48 AM
    Author     : User
--%>

<%@page import="DAOs.CategoryDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.BrandDAO"%>
<%@page import="DAOs.ProductDAO"%>
<%@page import="Models.tblProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Product</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/bootstrap.min.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/fonts/icomoon/style.css">
        <!--  -->

        <!-- Style -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/StyleInputForm.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/button5.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/CSS/StyleAdminPanel.css">
        <!--  -->
        <style>
            .table-data{
                text-align: center;
            }
            .error {
                color: red;
                border-style: none;
            }
        </style>
        <script src="<%=request.getContextPath()%>/js/ValidateProduct.js"></script>
    </head>
    <body>
        <
        <!-- SIDEBAR -->
        <%@include file="/JSP/SectionList.jsp" %>  
        <!-- SIDEBAR -->



        <!-- CONTENT -->
        <section id="content">
            
            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Create Product</h1>
                        <ul class="breadcrumb">
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="/Product">Return to My Store</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content">    
                    <div class="container">
                        <div class="table-data">
                            <div class="col-md-12">
                                <div class="box">
                                    <form class="mb-5" method="post" onsubmit="return ValidAllProductCreate()" action="ProductController" enctype="multipart/form-data">
                                        <div class="row">  
                                            <div class="col-md-6 form-group">
                                                <label for="email" class="col-form-label">Product ID</label>
                                                <input type="number" class="form-control" name="txtProID"  id="ID" >
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label for="name" class="col-form-label">Category</label>
                                                <select name="slctCatID" id="brand" class="form-control"> 
                                                    <%
                                                        CategoryDAO Dao = new CategoryDAO();
                                                        ResultSet rs1 = Dao.GetAll();
                                                        while (rs1.next()) {
                                                    %>
                                                    <option value="<%=rs1.getInt("Category_ID")%>"><%=rs1.getString("Cat_Name")%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row">                                   
                                            <div class="col-md-6 form-group">
                                                <label for="name" class="col-form-label">Name</label>
                                                <input type="text" class="form-control" name="txtProName" id="name">
                                                <div class="error" id="ErrorProName"></div>
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label for="name" class="col-form-label">Brand</label>
                                                <select name="slctBrand" id="brand" class="form-control"> 
                                                    <%
                                                        BrandDAO DaoB = new BrandDAO();
                                                        ResultSet rs = DaoB.GetAll();
                                                        while (rs.next()) {
                                                    %>
                                                    <option value="<%=rs.getInt("Brand_ID")%>"><%=rs.getString("Brand_Name")%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-12 form-group">
                                                <label for="email" class="col-form-label">Price</label>
                                                <input type="text" class="form-control" name="txtProPrice" id="price" >
                                                <div class="error" id="ErrorProPrice"></div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 form-group">
                                                <label for="email" class="col-form-label">Size</label>
                                                <input type="text" class="form-control" name="txtProSize" id="sizePro" >
                                                <div class="error" id="ErrorProSize"></div>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <label for="email" class="col-form-label">Country</label>
                                                <input type="text" class="form-control" name="txtProCountry" id="country" >
                                                <div class="error" id="ErrorProCountry"></div>
                                            </div>
                                        </div>                               


                                        <div class="row">
                                            <div class="col-md-12 form-group">
                                                <label for="name" class="col-form-label">Status</label>
                                                <select name="slctStatus" id="brand" class="form-control">
                                                    <option value="Available" >Available</option>
                                                    <option value="Pending" >Pending</option>
                                                    <option value="Not_Available">Not_Available</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 form-group">
                                                <label for="name" class="col-form-label">Product Image</label>
                                                <input type="file"  id="ProImg" name="fileProImg" accept="image/png, image/jpeg" required />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="submit" value="Submit" name="btnInsertPro" class="button-5 btn-block btn-primary rounded-0 py-2 px-4">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->

        <script src="<%=request.getContextPath()%>/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/bootstrap.min.js"></script>
    </body>
</html>
