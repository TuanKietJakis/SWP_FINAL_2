<%-- 
    Document   : Forgotpass
    Created on : Oct 4, 2023, 4:25:44 PM
    Author     : khoic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password Page</title>
        <link rel="stylesheet" href="CSS/Forgotpassword.css">
    </head>
    <body>
        <div class="section section_1"> 
            <div id="Forgotpassword_error" class="error">
                <p id="error_msg"></p>
                <span id="close"><ion-icon  name="close-circle-outline"></ion-icon></span>
            </div>    
            <div class="Forgotpassword">
                <form action="/ForgotPassword" method="post" id="form_forgot" class="Forgotpassword_form">
                    <h1 class="Forgotpassword_tittle">Email Address</h1>
                    <div class="question_password">
                        <img src="img/exept-vector 1.png" alt="question_password">               
                    </div>
                    <text>Please tell us your email address</text>
                    <div class="input_box">
                        <input type="text" name="email" id="Email" placeholder="Enter your email">
                    </div>
                    <div class="Forgotpassword_btn">
                        <input type="submit" value="Continue" name="btnForgot">
                    </div>
                </form>
            </div>        
        </div>
        <div class="section section_2">
            <div class="banner">
                <div class="banner_image">
                    <img src="img/Rectangle 188.png" alt="">
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
            
            <%String alertMess = (String) request.getAttribute("mess");
                if (alertMess != null && !alertMess.isEmpty()) {%>
            let errorr = document.getElementById("Forgotpassword_error");
            let errormsg = document.getElementById("error_msg");
            errormsg.innerHTML = "<%=alertMess%>";
            errorr.classList.add("error_show");
            <%                 
                }
            %>
        </script>
    </body>
</html>
