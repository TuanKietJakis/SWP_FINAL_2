<%-- 
    Document   : OTP
    Created on : Oct 4, 2023, 4:25:53 PM
    Author     : khoic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/CSS/OTP.css" />
    </head>
    <body>
        <div class="section section_1">
            <div class="OTP">
                <form action="/OTP" method="post" class="OTP_form">
                    <h1 class="OTP_tittle">Email Address</h1>
                    <text>The OTP code has been sent to your Email:</text>
                    <div><!---Chứa email của user---></div>
                    <text>Please check your email</text>

                    <div class="input_box">
                        <input class="otp" name="opt1" type="text" oninput='digitValidate(this)' onkeyup='tabChange(1)' maxlength=1>
                        <input class="otp" name="opt2" type="text" oninput='digitValidate(this)' onkeyup='tabChange(2)' maxlength=1>
                        <input class="otp" name="opt3" type="text" oninput='digitValidate(this)' onkeyup='tabChange(3)' maxlength=1>
                        <input class="otp" name="opt4" type="text" oninput='digitValidate(this)' onkeyup='tabChange(4)' maxlength=1>
                        <input class="otp" name="opt5" type="text" oninput='digitValidate(this)' onkeyup='tabChange(5)' maxlength=1>
                        <input class="otp" name="opt6" type="text" oninput='digitValidate(this)' onkeyup='tabChange(6)' maxlength=1>
                    </div>
                    <div class="OTP_btn">
                        <input type="submit" value="Continue" name="btnOTP"/>
                        <%
                            session.setAttribute("passwordResetSuccessful", true);
                        %>
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
        <script>
            let digitValidate = function (ele) {
                console.log(ele.value);
                ele.value = ele.value.replace(/[^0-9]/g, '');
            }

            let tabChange = function (val) {
                let ele = document.querySelectorAll('.otp');
                if (ele[val - 1].value != '') {
                    ele[val].focus()
                } else if (ele[val - 1].value == '') {
                    ele[val - 2].focus()
                }
            }
        </script>
    </body>
</html>
