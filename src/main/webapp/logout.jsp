<%-- 
    Document   : logout
    Created on : Jul 3, 2023, 9:37:13 PM
    Author     : ddand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%


   if (session != null) {
       session.invalidate(); // Xóa session
   }
    // Clear the authentication cookie
    
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("admin") || cookie.getName().equals("adminID")) {
                cookie.setValue("");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user") || cookie.getName().equals("userID")) {
                cookie.setValue("");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
    }

    // Redirect the user to the login page or any other desired page
    response.sendRedirect("/Home");
%>
