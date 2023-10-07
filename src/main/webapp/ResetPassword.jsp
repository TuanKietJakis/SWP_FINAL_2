<%-- 
    Document   : ResetPassword
    Created on : Oct 4, 2023, 4:26:12 PM
    Author     : khoic
--%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Page</title>
        <link rel="stylesheet" href="/CSS/Reset.css">
    </head>
    <body>
        <div class="section section_1">
            <div id="Reset_error" class="error">
                <p id="error_msg"></p>
                <span id="close"><ion-icon  name="close-circle-outline"></ion-icon></span>
            </div>    
            <div class="Reset">
                <form action="/ResetPassword" method="post" id="" class="Reset_form">
                    <h1 class="Rest_tittle">RE-SET PASSWORD</h1>
                    <text>Create your new password and confirm it</text>

                    <div class="input_box">
                        <input class="otp" type="text" name="newpassword" id="new"  placeholder="New password">
                        <input class="otp" type="password" name="comfirmpassword" id="reset"  placeholder="Confirm Password">
                    </div>
                    <div class="Reset_btn">
                        <input type="submit" value="Save Password" name="btnReset"/>

                    </div>
                </form>
            </div>
        </div>
        <div class="section section_2">
            <div class="banner">
                <div class="banner_image">
                    <img src="img/Rectangle 188.png" alt="" />
                </div>
                <div class="banner_text">
                    <text>Fragrance can create better opportunities</text>
                </div>
            </div>
        </div>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js" ></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="js/ForgotPassword.js"></script>
        <script>

            <%String alertMess = (String) request.getAttribute("mess_error");
                if (alertMess != null && !alertMess.isEmpty()) {%>
            let errorr = document.getElementById("Reset_error");
            let errormsg = document.getElementById("error_msg");
            errormsg.innerHTML = "<%=alertMess%>";
            errorr.classList.add("error_show");
            <%
                }
            %>      

        </script>

    </body>
</html>
