/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ForgotPassword;

import DAOs.AccountDAO;
import EncodeMD5.MD5;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author khoic
 */
public class ResetPassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ResetPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession check = request.getSession();
       Boolean check_exist = (Boolean) check.getAttribute("ExistReset");
        if (check_exist!= null && check_exist) {
            response.sendRedirect("/Login");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
            if (request.getParameter("btnReset") != null) {
                try {
                    String new_password = request.getParameter("newpassword");
                    String confirm_password = request.getParameter("comfirmpassword");
                    HttpSession mySession = request.getSession();
                    HttpSession newSession = request.getSession();
                    String email = (String) mySession.getAttribute("email");
                    AccountDAO dao = new AccountDAO();
                    new_password = MD5.encode(new_password);
                    confirm_password = MD5.encode(confirm_password);
                    if (new_password != null && confirm_password != null && new_password.equals(confirm_password)) {
                        dao.forgetpass(new_password, email);
                        request.setAttribute("success_msg", "ForgetPassWord Successfully");
                        newSession.setAttribute("ExistReset", true);
                        response.sendRedirect("/Login");

                    } else {
                        request.setAttribute("mess_error", "Password and Confirm Password must be the same");
                        response.sendRedirect("/Login/Reset");
                    }
                } catch (Exception e) {
                    
                }
            }
        
                   
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
