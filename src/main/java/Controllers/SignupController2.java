/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import Models.tblAddress;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kiet
 */
public class SignupController2 extends HttpServlet {

    private AccountDAO accountDAO;

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
            out.println("<title>Servlet SignupController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/SignUp")) {
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
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
    public void init() throws jakarta.servlet.ServletException {
        super.init();
        try {
            // Khởi tạo AccountDAO trong phương thức init()
            accountDAO = new AccountDAO(); // Đảm bảo đã khởi tạo đối tượng AccountDAO trước khi sử dụng
        } catch (Exception ex) {
            Logger.getLogger(SignupController2.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String username = request.getParameter("txtUsername").trim();
            String email = request.getParameter("txtEmail").trim();
            String password = request.getParameter("txtPassWord").trim();
            AccountDAO dao = new AccountDAO();

            if (dao.checkUserNameIsExist(username)) {
                request.setAttribute("Wrong", "Error! Username Already Exists!");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);

            } else {

                //"16","Kiet2","user6","123","0797119869","onie.mann@hotmail.com ","abc","0","Female","1992-07-06"
                LocalDate today = LocalDate.now();

                // Format the date into a string
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String formattedDate = today.format(formatter);
                dao.signup(username, password, email, "", "", formattedDate, "", 1, 1);
                int UserID = dao.getUserID(username);
                tblAddress address = new tblAddress(UserID, "", "", "", Byte.parseByte("2"));
                dao.addAddress(address);
                response.sendRedirect("/Login");
            }

        } catch (Exception ex) {
            Logger.getLogger(SignupController2.class.getName()).log(Level.SEVERE, null, ex);
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
