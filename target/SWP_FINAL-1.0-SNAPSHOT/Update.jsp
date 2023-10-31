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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/CSS/DangStyles/HomeStyle.css">
        <link rel="stylesheet" href="/CSS/MyStyle/UpdateProfileUser.css">
    </head>
    <body>

        <%
            AccountDAO accDAO = new AccountDAO();
//            ResultSet rs = accDAO.GetAll(8);
            int ID = (int) session.getAttribute("CustomerID");
            tblUser user = accDAO.GetAccountByID(ID);

        %>
        <jsp:include page="/header.jsp">
            <jsp:param name="ID" value="<%=ID%>"/>
        </jsp:include>

        <div class="body-content" style="margin-top: 77px; position: relative">
            <div id="Update_error" class="error">
                <p id="error_msg"></p>
                <span id="close"><ion-icon name="close-circle-outline"></ion-icon></span>
            </div>
            <div class="content">

                <div class="Profile">
                    <h1>USER PROFILE</h1>
                </div>
                <%
//            ResultSet rs = (ResultSet) request.getAttribute("rs");

                %>
                <form method="post" action="/Account" id="form_up_date">
                    <div class="title">
                        <div class="item">
                            <div class="item-label">
                                <label for="">Full name</label>
                            </div>
                            <div class="item-text">
                                <input type="text" class="content-text" name="Fullname" value="<%= user.getFullName()%>"  >

                            </div>
                        </div>
                        <div class="item">
                            <div class="item-label">
                                <Label>User name (Can't Change)</Label>
                            </div>
                            <div class="item-text">
                                <input type="text" class="content-text" name="Username" value="<%= user.getUserName()%>" readonly=""  >
                            </div>
                        </div>
                    </div>
                    <div class="title">
                        <div class="item">
                            <div class="item-label">
                                <label for="">Birthday</label>
                            </div>
                            <div class="item-text">
                                <input type="date" class="content-text" name="DoB" id="DoB" value="<%= user.getDOB()%>" >
                            </div>
                        </div>
                        <div class="item">
                            <div class="item-label">
                                <Label>Gender</Label>
                            </div>
                            <div class="item-text">

                                <select name="slctGender" class="content-text" id="id" style="appearance: none">
                                    <option  value="Male" <%= user.getGender().equals("Male") ? "selected" : ""%> >Male</option>
                                    <option  value="Female" <%= user.getGender().equals("Female") ? "selected" : ""%> >Female</option>
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
                                <input type="text" class="content-text" name="Mobile_Number" id="MN" value="<%= user.getPhoneNumber()%>" >
                            </div>
                        </div>
                        <div class="item">
                            <div class="item-label">
                                <Label>Email</Label>
                            </div>
                            <div class="item-text">
                                <input type="text" class="content-text" name="Email" id="email" value="<%= user.getEmail()%>" >
                            </div>
                        </div>
                    </div>
                    <div class="title">
                        <div class="item">
                            <div class="item-label">
                                <label for="">Address</label>
                            </div>
                            <div class="item-text">
                                <input type="text" class="content-text1" name="Address" id="Address" value="<%= user.getAddress()%>" >
                            </div>
                        </div>
                    </div>
                    <div class="title">
                        <div class="item">
                            <input type="hidden" name="hiddenID" value="<%= user.getUserID()%>">
                            <button class="update" type="submit" name="btnUpdateProfileUser" value="Update">                            
                                Update
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="overlay">
        </div>


        <!--        <script>
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
                </script>-->
        <script src="/js/DangScript/jquery.min.js"></script>
        <!--        <script src="/CSS/DangStyles/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>-->
        <!--        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>-->
        <!--        <script>
                                AOS.init();
                </script>-->
        <script src="/js/DangScript/Home.js"></script>
        <script src="/js/MyScript/UpdateProfileUser.js"></script>
        
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>