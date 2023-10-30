<%@page import="DAOs.AccountDAO"%>
<%@page import="Models.tblUser"%>

<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="../../CSS/UpdateProfile/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        
        <%
            AccountDAO accDAO = new AccountDAO();
            //ResultSet rs = accDAO.GetAll(1);
            int id = (int)request.getAttribute("rs");
            ResultSet rs = accDAO.GetAll(id);
            if (rs.next()) {
        %>
        <header class="header">
            <nav class="nav container">
                <a href="index.html" class="nav_logo"><img src="../../CSS/UpdateProfile/image/logo.png" alt=""></a>
                <div class="nav_menu">
                    <ul class="nav_list">
                        <li class="nav_item"><a href="#" class="nav_item_link">Home</a></li>
                        <li class="nav_item"><a href="#" class="nav_item_link">Shop online</a></li>
                        <li class="nav_item"><a href="#" class="nav_item_link">What's new</a></li>
                        <li class="nav_item"><a href="#" class="nav_item_link">Contact</a></li>
                        <li class="nav_item"><a href="#" class="nav_item_link">About us</a></li>
                    </ul>
                    <div class="nav_acc">
                        <i class="fa-solid fa-magnifying-glass nav_acc_glass"></i>
                        <input type="text" class="nav_acc_glass_input" placeholder="Search name of product">
                        <i class="fa-solid fa-cart-shopping fa-lg"></i>
                        <div class="nav_profile">
                            <h3 class="nav_name">
                               <%= rs.getString("Fullname")%>
                            </h3>
                            <i class="fa-solid fa-user nav_acc_user"></i>
                        </div>
                        <div class="nav_profile_select nav_profile_show">
                            <a href="#" class="nav_profile_opt">Your profile</a>
                            <a href="#" class="nav_profile_opt">Order History</a>
                            <a href="#" class="nav_profile_opt">Logout</a>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
        <!-- <div style="height: 29.5px;"></div> -->

        <div class="body-content">
            <div class="content">
                <div class="Profile">
                    <h1>PROFILE</h1>
                </div>
                <%
//            ResultSet rs = (ResultSet) request.getAttribute("rs");
                    
                %>
                <form method="post" action="/Account" >
                    <div class="title">
<div class="item">
                            <div class="item-label">
                                <label for="">Full name</label>
                            </div>
                            <div class="item-text">
                                <input type="text" class="content-text" name="Fullname" value="<%= rs.getString("Fullname")%>" required  >

                            </div>
                        </div>
                        <div class="item">
                            <div class="item-label">
                                <Label>User name</Label>
                            </div>
                            <div class="item-text">
                                <input type="text" class="content-text" name="Username" value="<%= rs.getString("Username")%>" required  >
                            </div>
                        </div>
                    </div>
                    <div class="title">
                        <div class="item">
                            <div class="item-label">
                                <label for="">Birthday</label>
                            </div>
                            <div class="item-text">
                                <input type="date" class="content-text" name="DoB" id="DoB"value="<%= rs.getDate("DOB")%>" required>
                            </div>
                        </div>
                        <div class="item">
                            <div class="item-label">
                                <Label>Gender</Label>
                            </div>
                            <div class="item-text">
                                <!--<input name="slctGender" type="text" class="content-text" value="<%= rs.getString("Gender")%>">-->
                                <select name="Gender" class="content-text" id="id" style="appearance: none">
                                    <option  value="Male" <%= rs.getString("Gender").equals("Male") ? "selected" : "" %> >Male</option>
                                    <option  value="Female" <%= rs.getString("Gender").equals("Female") ? "selected" : "" %> >Female</option>
                                </select>

                                <i class="fa-solid fa-mars-and-venus"></i>
                            </div>
                        </div>
                    </div>
                    <div class="title">
                        <div class="item">
                            <div class="item-label">
                                <label for="">Phone number</label>
                            </div>
                            <div class="item-text">
                                <input type="text" class="content-text" name="Mobile_Number" id="MN" value="<%= rs.getString("PhoneNumber")%>" required>
                            </div>
                        </div>
                        <div class="item">
                            <div class="item-label">
                                <Label>Email</Label>
</div>
                            <div class="item-text">
                                <input type="text" class="content-text" name="Email" value="<%= rs.getString("Email")%>" required>
                            </div>
                        </div>
                    </div>
                    <div class="title">
                        <div class="item">
                            <div class="item-label">
                                <label for="">Address</label>
                            </div>
                            <div class="item-text">
                                <input type="text" class="content-text1" name="Address" id="Address" value="<%= rs.getString("Address")%>" required>
                            </div>
                        </div>
                    </div>
                    <div class="title">
                        <div class="item">
                            <input type="hidden" name="hiddenID" value="<%= rs.getInt("UserID")%>">
                            <button class="update" type="submit" name="btnUpdate" value="Update">                            
                                Update
                            </button>
                        </div>
                    </div>
                </form>
                <%
                    }
                %>
            </div>

            <div class="overlay"></div>
        </div>


        <script>
            function scrollHeader() {
                const nav = document.getElementById('header');
                if (this.scrollY >= 200)
                    nav.classList.add('scroll-header');
                else
                    nav.classList.remove('scroll-header')
            }
            window.addEventListener('scroll', scrollHeader);

            const opt_pro = document.querySelector('.nav_profile_select');
            const acc_pro = document.querySelector('.nav_profile');
            acc_pro.onclick = function () {
                opt_pro.classList.toggle("nav_profile_show");
            };

            const acc_glass_btn = document.querySelector('.nav_acc_glass');
            const acc_glass_input = document.querySelector('.nav_acc_glass_input');
            acc_glass_btn.onclick = function () {
                acc_glass_input.focus();
                acc_glass_input.classList.add("nav_acc_glass_show");
                acc_glass_input.onblur = function () {
                    acc_glass_input.classList.remove("nav_acc_glass_show");
                }
            };
        </script>

    </body>
</html>