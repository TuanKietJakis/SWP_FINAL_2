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
</head>
<body>
    <div class="section section_2">
        <div class="banner">
            <div class="banner_image">
                <img src="/img/sì.jpg" alt="">
            </div>
            <div class="banner_image2">
                <img src="/img/rose.jpg" alt="">
            </div>
        </div>
    </div>
    <div class="section section_1">
        <div id="Signup_error" class="error">
            <p id="error_msg"></p>
            <span id="close"><ion-icon  name="close-circle-outline"></ion-icon></span>
        </div>
        <div class="Sign up">
            <form action="/SignUp" id="form_sign up" method="POST">
                <h1>Sign up</h1>
            <div class="Signup_quote"><text>Sign up to experience shopping features for you</text></div>
            <div class="input_box">
                <input type="text" name="txtUsername" id="txtUsername" placeholder="Username">
                <ion-icon name="person-outline"></ion-icon>
            </div>
            <div class="input_box">
                <input type="email" name="txtEmail" id="txtEmail" placeholder="Email">
                <ion-icon name="lock-closed-outline"></ion-icon>
            </div>
            <div class="input_box">
                <input type="password" name="txtPassWord" id="txtPassWord" placeholder="Password">
                <ion-icon name="lock-closed-outline"></ion-icon>
            </div>
            
            <div class="Login_common">
                <div class="Login_rem">
                    <input type="checkbox" name="" id="">
                    <span>I agree all statement in</span> <span>Terms & conditions</span>
                </div>
                       
            </div>
            <div class="Login">
                <div class="Login_button">
                    <input type="submit" value="Sign up" id="Login_btn">
                </div>
                <p class="Login_account">Already have an account?</p>
                <a class="create_account" href="/Login">Login</a>
                <ion-icon name="arrow-forward-outline"></ion-icon>
            </div>
            </form>
        </div>
    </div>   
    </div>
       
        </div>
    </form>
    
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
