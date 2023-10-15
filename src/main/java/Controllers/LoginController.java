/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;
import DAOs.AccountDAO;
import Models.tblUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Khoi
 */
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
        String path = request.getRequestURI();
        if (path.endsWith("/Login")) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }else if(path.endsWith("/Login/OTP")){
            request.getRequestDispatcher("/OTP.jsp").forward(request, response);
        }else if(path.endsWith("/Login/Reset")){
             request.getRequestDispatcher("/ResetPassword.jsp").forward(request, response);
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
       if(request.getParameter("btnLogin") != null){
           try {
               String us = request.getParameter("username");
               String ps = request.getParameter("password");
               tblUser acc = new tblUser(us, ps);
               AccountDAO dao = new AccountDAO();
               boolean result = dao.Login(acc);
               boolean isAdmin = dao.IsAdmin(us);
               if(result){
                   HttpSession session = request.getSession();
                   if(request.getParameter("checkRem") != null){
                       if(isAdmin){
                           Cookie admin = new Cookie("admin", us);
                           admin.setMaxAge(3 * 24 * 60 * 60);
                           response.addCookie(admin);
                       }else{
                           Cookie user = new Cookie("user",us);
                           user.setMaxAge(3 * 24 * 60 * 60);
                           response.addCookie(user);
                       }
                   }
                   
                   String fullname = dao.GetFullName(us);
                    int ID = dao.GetIDFromFullname(fullname);
                    if (isAdmin) { // Kiểm tra nếu là quản trị viên
                        session.setAttribute("Adminstrator", fullname);
                        session.setAttribute("AdminstratorID", ID);
                        response.sendRedirect("/Admin"); // Chuyển hướng đến trang "admin.jsp" P/S: thay doi
                    } else {
                        session.setAttribute("Customer", fullname);
                        session.setAttribute("CustomerID", ID);
                        response.sendRedirect("/Home"); // Chuyển hướng đến trang "Home.jsp" cho người dùng thông thường
                    }
               }else{
                   request.setAttribute("error", "Wrong username or password");
                   request.getRequestDispatcher("/Login.jsp").forward(request, response);
               }
               
           }  catch (Exception e) {
               
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
