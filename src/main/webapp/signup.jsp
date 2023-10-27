<%-- 
    Document   : signup
    Created on : Sep 18, 2023, 5:23:42 PM
    Author     : Truc Vy CE171243
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign up</title>
        <link rel="stylesheet" href="/CSS/VyStyle/signupStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.min.css">
    </head>
    <body>
        <div class="Signup_Container">

            <div class="Signup_c_right">

                <div id="Signup_error" class="error">
                    <p id="error_msg"></p>
                    <span id="close"><i class="fa-regular fa-circle-xmark"></i></span>
                </div>
                <div class="Sign_up">
                    <form action="/SignUp" method="POST" id="form_sign_up" class="Sign_up_form">
                        <div class="Signup_quote">
                            <h1>Sign up</h1>
                            <p>Sign up to experience shopping<br>features for you</p>
                        </div>
                        <div class="input_box">
                            <input type="text" name="txtUsername" id="username" placeholder="Username"><i class="bi bi-envelope"></i>
                            <i class='bx bx-user'></i>
                        </div>

                        <div class="input_box">
                            <input type="email" name="txtEmail" id="email" placeholder="Email">
                            <i class='bx bx-envelope'></i>
                        </div>
                        <div class="input_box">
                            <input type="password" name="txtPassWord" id="password" placeholder="Password">
                            <i class='bx bx-lock-alt'></i>
                        </div>
                        <div class="Signup_common">
                            <div class="Signup_rem">
                                <!-- <input type="checkbox" name="" id="">
                            <span>I agree all statement in</span> <span>Terms & conditions</span> -->
                                <input type="checkbox" name="agree" id="agree-checkbox">
                                <label for="agree-checkbox" class="agree-checkbox-label">I agree all statement in <a
                                        href="./term.html">Terms &amp;
                                        conditions</a></label>
                            </div>

                        </div>
                        <div class="Signup_button">
                            <input type="submit" value="Sign up" id="Signup_btn" disabled>
                            <div class="Acess_to_login">
                                Already have an account? <a href="/Login">Login</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="Signup_c_left">
                <div class="Signup_banner">
                    <img src="/img/Pic2.png" alt="" class="Signup_banner_one">
                    <img src="/img/Pic3.png" alt="" class="Signup_banner_two">
                </div>
            </div>
            <script src="/js/MyScript/signup.js"></script>
            <script>
                <%
                    String check = (String) request.getAttribute("Wrong");
                %>
                const check = "<%=check%>";
                console.log(check);
                if (check != "null") {
                    document.querySelector('#Signup_error').classList.add("error_show");
                    document.querySelector('#error_msg').innerHTML = "<%=check%>";
                } else {
                    document.querySelector('#Signup_error').classList.remove("error_show");
                    document.querySelector('#error_msg').innerHTML = "";
                }
            </script>    
    </body>
</html>
