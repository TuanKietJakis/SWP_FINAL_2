<%-- 
        Document   : Login
        Created on : Sep 18, 2023, 3:29:52 PM
        Author     : khoic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="Login_styles.css">
    </head>
    <body>
        <div class="section section_1">
            <div id="Login_error" class="error">
                <p id="error_msg"></p>
                <span id="close"><ion-icon  name="close-circle-outline"></ion-icon></span>
            </div>
            <div class="Login">
                <form action="LoginController" id="form_login" method="post">
                    <h1>Login</h1>
                    <div class="Login_quote"><text>How can I be more confident?</text></div>
                    <div class="input_box">
                        <input type="text" name="username" id="username" placeholder="Username">
                        <ion-icon name="person-outline"></ion-icon>
                    </div>
                    <div class="input_box">
                        <input type="password" name="password" id="password" placeholder="Password">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                    </div>
                    <div class="Login_button">
                       
                        <input type="submit" value="Login" name="btnLogin" id="Login_btn">
                    </div>
                    <div class="Login_common">
                        <div class="Login_rem">
                            <input type="checkbox" name="checkRem" id="">
                            <label for="">Remember me</label>
                        </div>
                        <a class="Forget_pass" href="#">Forgot password?</a>
                    </div>
                    <div class="Create">
                        <a class="create_account" href="#">Create an account</a>
                        <ion-icon name="arrow-forward-outline"></ion-icon>
                    </div>
                </form>
            </div>

        </div>
        <div class="section section_2">
            <div class="banner">
                <div class="banner_image">
                    <img src="Rectangle 188.png" alt="">
                </div>
                <div class="banner_text">
                    <text>Fragrance can create better opportunities</text>
                </div>
            </div>
        </div>

        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js" ></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="Login.js"></script>
        <script>
            
            <%String alertMess = (String) request.getAttribute("error");
                if (alertMess != null && !alertMess.isEmpty()) {%>
            let errorr = document.getElementById("Login_error");
            let errormsg = document.getElementById("error_msg");
            errormsg.innerHTML = "<%=alertMess%>";
            errorr.classList.add("error_show");
            <%                 
                }
            %>
        </script>
    </body>
</html>