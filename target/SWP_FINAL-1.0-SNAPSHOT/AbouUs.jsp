<%-- 
    Document   : AbouUs.jsp
    Created on : Oct 18, 2023, 2:30:35 PM
    Author     : ddand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" href="/CSS/VyStyle/AboutUs.css">
</head>

<body>
     <%
            int ID = 0;
            if (session.getAttribute("CustomerID") != null) {
                ID = (int) session.getAttribute("CustomerID");
            }
        %>
        <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=ID%>"/>
        </jsp:include>


    <div class="image-container">
        <!-- <div class="banner">
            <img src="/img/Back7.jpg" alt="">
        </div> -->
        <h1 class="text-overlay">About</h1>
    </div>
    <section class="about_section section">
        <div class="container about_container">
            <div class="about_data1">
                <div class="about_content">

                    <h1 class="about_content_title"> Our Story</h1>

                    <p class="about_content_des1">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris consequat consequat enim, non
                        auctor
                        massa ultrices non. Morbi sed odio massa. Quisque at vehicula tellus, sed tincidunt augue. Orci
                        varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas
                        varius
                        egestas diam, eu sodales metus scelerisque congue. Pellentesque habitant morbi tristique
                        senectus et
                        netus et malesuada fames ac turpis egestas. Maecenas gravida justo eu arcu egestas convallis.
                        Nullam
                        eu erat bibendum, tempus ipsum eget, dictum enim. Donec non neque ut enim dapibus tincidunt
                        vitae
                        nec augue. Suspendisse potenti. Proin ut est diam. Donec condimentum euismod tortor, eget
                        facilisis
                        diam faucibus et. Morbi a tempor elit.
                    </p>

                    <p class="about_content_des2">
                        Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us
                        on
                        (+1) 96 716 6879
                    </p>

                </div>

                <div class="about_img about_img1">
                    <img src="/img/Pic3.png" alt="">
                </div>
            </div>
            <div class="about_data2">
                <div class="about_img about_img2">
                    <img src="/img/7_Virtues_Summer_Vibes_mb.jpg" alt="">
                </div>

                <div class="about_content">

                    <h1 class="about_content_title"> Our Mission</h1>

                    <p class="about_content_des1">
                        Mauris non lacinia magna. Sed nec lobortis dolor. Vestibulum rhoncus dignissim risus, sed
                        consectetur erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac
                        turpis egestas. Nullam maximus mauris sit amet odio convallis, in pharetra magna gravida.
                        Praesent
                        sed nunc fermentum mi molestie tempor. Morbi vitae viverra odio. Pellentesque ac velit egestas,
                        luctus arcu non, laoreet mauris. Sed in ipsum tempor, consequat odio in, porttitor ante. Ut
                        mauris
                        ligula, volutpat in sodales in, porta non odio. Pellentesque tempor urna vitae mi vestibulum,
                        nec
                        venenatis nulla lobortis. Proin at gravida ante. Mauris auctor purus at lacus maximus euismod.
                        Pellentesque vulputate massa ut nisl hendrerit, eget elementum libero iaculis.
                    </p>

                    <p class="about_content_des2">
                        Creativity is just connecting things. When you ask creative people how they did something, they
                        feel
                        a little guilty because they didn't really do it, they just saw something. It seemed obvious to
                        them
                        after a while.

                        <span>
                            - Steve Job’s
                        </span>
                    </p>

                </div>

            </div>
        </div>
    </section>



     <jsp:include page="Footer.jsp"></jsp:include>
     <script src="js/code.jquery.com_jquery-3.5.1.slim.min.js"></script>
    <script src="OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
    <script src="js/DangScript/Header.js"></script>
    <!--<script src="Home.js"></script>-->
</body>

</html>
