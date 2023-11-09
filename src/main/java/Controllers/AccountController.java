/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kiet CHUA XONG NHAAAAAAAAA
 */
public class AccountController extends HttpServlet {

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
            out.println("<title>Servlet AccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountController at " + request.getContextPath() + "</h1>");
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
        // /Account
        // /Account/Info
        if (path.endsWith("/Account")) {
            /**
             * Redirect to Main Page if the URL is /Account
             *
             * @param
             */
            request.getRequestDispatcher("JSP/AccountPage/MainPage.jsp").forward(request, response);
        } else if (path.endsWith("/Account/UpdateProfileUser")) {
            request.getRequestDispatcher("/Update.jsp").forward(request, response);
        } else {
            if (path.startsWith("/Account/View/")) {
                /**
                 * View all of the Information of a specific Account if the
                 * accounte exist, go to Account Info If not go back to Main
                 * Page
                 *
                 * @param
                 */
                try {
                    try {
                        String[] s = path.split("/");
                        int UserID = Integer.parseInt(s[s.length - 1]);
                        if (UserID == 0) {
                            response.sendRedirect("/Account");
                        } else {
                            HttpSession session = request.getSession();
                            session.setAttribute("UserID", UserID);
                            request.getRequestDispatcher("/JSP/AccountPage/AccountInfo.jsp").forward(request, response);
                        }
                    } catch (Exception ex) {
                        Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                if (path.startsWith("/Account/MakeAdmin/")) {
                    /**
                     * Make an Account an admin by changing it IsAdmin from 0 to
                     * 1
                     *
                     * @param
                     */
                    try {
                        try {
                            String[] s = path.split("/");
                            int UserID = Integer.parseInt(s[s.length - 1]);
                            AccountDAO dao = new AccountDAO();
                            int result = dao.AddAdmin(UserID);
                            if (result != 0) {
                                response.sendRedirect("/Admin");
                            } else {
                                response.sendRedirect("/Account");
                            }
                        } catch (Exception ex) {
                            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    } catch (Exception ex) {
                        Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    if (path.endsWith("/Account/Logout")) {
                        Cookie[] cookies = request.getCookies();
                        for (Cookie cookie : cookies) {
                            cookie.setMaxAge(0);
                            cookie.setPath("/");
                            response.addCookie(cookie);
                        }
                        response.sendRedirect("/");
                    } else {
                        if (path.startsWith("/Account/Delete/")) {
                            try {
                                String[] s = path.split("/");
                                int AccountID = Integer.parseInt(s[s.length - 1]);
                                AccountDAO dao = new AccountDAO();
                                dao.DeleteAccount(AccountID);
                                request.getRequestDispatcher("/JSP/AccountPage/Information.jsp").forward(request, response);
                            } catch (Exception ex) {
                                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        } else {
                            if (path.startsWith("/Account/Info/")) {
                                try {
                                    String[] s = path.split("/");
                                    int AccountID = Integer.parseInt(s[s.length - 1]);
                                    AccountDAO dao = new AccountDAO();
                                    ResultSet rs = dao.GetAll(AccountID);
                                    request.setAttribute("rs", rs);
                                    request.getRequestDispatcher("/JSP/AccountPage/Information.jsp").forward(request, response);
                                } catch (Exception ex) {
                                    Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            } else {
                                if (path.startsWith("/Account/Update/")) {
                                    try {
                                        AccountDAO accDAO = new AccountDAO();
                                        String[] s = path.split("/");
                                        int ID = Integer.parseInt(s[s.length - 1]);
                                        ResultSet rs = accDAO.GetAll(ID);
                                        request.setAttribute("rs", rs);
                                        request.setAttribute("ID", ID);
                                        request.getRequestDispatcher("/JSP/AccountPage/Update.jsp").forward(request, response);
                                    } catch (Exception ex) {
                                        //homecontroller
                                    }
                                }
                            }
                        }
                    }
                }
            }
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
        String btnUpdateProfileUser = request.getParameter("btnUpdateProfileUser");
        if (request.getParameter("btnUpdate") != null && request.getParameter("btnUpdate").equals("Update")) {

            try {
                String fullname = request.getParameter("Fullname").trim();
                String username = request.getParameter("Username").trim();
                String phone = request.getParameter("Mobile_Number").trim();
                String email = request.getParameter("Email").trim();
                String address = request.getParameter("Address");
                String gender = request.getParameter("slctGender");
                Date DoB = Date.valueOf(request.getParameter("DoB"));
                int ID = Integer.parseInt(request.getParameter("hiddenID"));
                AccountDAO dao = new AccountDAO();
                int kq = dao.UpdateAccount(fullname, username, phone, email, address, gender, DoB, ID);
                if (kq != 0) {
                    response.sendRedirect("/Account");
                }
            } catch (Exception ex) {

            }
        }
        if (btnUpdateProfileUser != null && btnUpdateProfileUser.equals("Update")) {

            try {
                String fullname = request.getParameter("Fullname").trim();
                String username = request.getParameter("Username").trim();
                String phone = request.getParameter("Mobile_Number").trim();
                String email = request.getParameter("Email").trim();
                String address = request.getParameter("Address");
                String gender = request.getParameter("slctGender");
                String DoB = request.getParameter("DoB");
                int ID = Integer.parseInt(request.getParameter("hiddenID"));
                AccountDAO dao = new AccountDAO();
                int kq = dao.UpdateAccount(fullname, username, DoB, gender, phone, email, address, ID);
                if (kq != 0) {
                    response.sendRedirect("/Account/UpdateProfileUser");
                }
            } catch (Exception ex) {

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
