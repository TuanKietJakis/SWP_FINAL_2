<%-- 
    Document   : ContactUs
    Created on : Oct 16, 2023, 7:59:54 PM
    Author     : khoic
--%>

<%@page import="Models.tblUser"%>
<%@page import="DAOs.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/CSS/ContactUs.css">
        <title>Contact Page</title>
    </head>
    <%
        System.out.println(session.getAttribute("CustomerID"));
            int ID = 0;
            if (session.getAttribute("CustomerID") != null) {
                ID = (int) session.getAttribute("CustomerID");}
    %>
    <body>
       <jsp:include page="header.jsp">
            <jsp:param name="ID" value="<%=ID%>"/>
        </jsp:include>
        <main class="main">
            <div class="banner">
                Contact
            </div>
            <section>
                <div class="Contact_cotainer container">
                    <div class="contact_content grid">
                        <div class="form_container">
                            <form action="/Contact" method="post" id="contact_form" class="Contactform">
                                <h2 class="contact_title">Sent Us A Message</h2>
                                <div class="input_box">
                                    <i class="fa-regular fa-envelope"></i>
                                    <input type="text" id="contact_email" name="email" placeholder="Your email address">

                                </div>
                                <div id="error1"></div>
                                <textarea name="message" id="helparea" cols="30" rows="8" placeholder="How can we help?"></textarea>
                                <div id="error2"></div>
                                <input type="submit" id="btnContact" value="SUBMIT" name="btnContact" class="contact_btn button">
                            </form>
                        </div>
                        <div class="list_container">
                            <div class="contact_address">
                                <div class="Address_title">
                                    <i class="fa-solid fa-location-dot"></i>
                                    <h2>Address</h2>
                                </div>

                                <p>Coza Store Center 8th floor, 379 Hudson St, New York, NY 10018 US</p>
                            </div>
                            <div class="contact_address">
                                <div class="Address_title">
                                    <i class="fa-solid fa-phone"></i>
                                    <h2>Lets Talk</h2>
                                </div>

                                <p>+84 842888249</p>
                            </div>
                            <div class="contact_address">
                                <div class="Address_title">
                                    <i class="fa-regular fa-envelope"></i>
                                    <h2>Sale Support</h2>
                                </div>

                                <p>danghaingo.work@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
        </main>
         <jsp:include page="Footer.jsp"></jsp:include>
        <script src="/js/ContactUs.js"></script>
    </body>
</html>
