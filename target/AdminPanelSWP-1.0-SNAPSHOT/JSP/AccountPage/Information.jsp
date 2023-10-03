<%@page import="Models.tblUser"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Information</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }

            .card {
                border-radius: 4px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                margin-bottom: 20px;
                overflow: hidden;
            }

            .card-title {
                background-color: #2196F3;
                color: #fff;
                padding: 15px;
                margin: 0;
                font-size: 24px;
            }

            .info-row {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 15px;
                border-bottom: 1px solid #ccc;
            }

            .info-label {
                font-weight: bold;
            }

            .btn {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 10px 5px;
                cursor: pointer;
                border-radius: 4px;
            }

            .btn-primary {
                background-color: #2196F3;
            }

            .btn-primary:hover {
                background-color: #0b7dda;
            }
        </style>
    </head>
    <body>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("rs");
            if (rs.next()) {
        %>
        <div class="container">
            <div class="card">
                <div class="card-title">Information</div>

                <div class="info-row">
                    <div class="info-label">Full Name:</div>
                    <div><%= rs.getString("Fullname")%></div>
                </div>
                <div class="info-row">
                    <div class="info-label">User Name:</div>
                    <div><%= rs.getString("Username")%></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Mobile Number:</div>
                    <div><%= rs.getString("Mobile_Number")%></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Email:</div>
                    <div><%= rs.getString("Email")%></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Gender:</div>
                    <div><%= rs.getString("Gender")%></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Date of Birth:</div>
                    <div><%= rs.getString("DOB")%></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Address:</div>
                    <div><%= rs.getString("AddressID")%></div>
                </div>
                <div class="info-row">
                    <div></div>
                    <div>
                        <a href="/Account/Update/<%= rs.getString("UserID")%>" class="btn btn-primary">Update</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </body>
</html>
