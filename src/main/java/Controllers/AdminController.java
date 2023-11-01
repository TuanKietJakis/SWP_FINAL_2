/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.OrderDAO;
import Models.tblUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kiet CHUA XONG NHAAAAAAAAA
 */
public class AdminController extends HttpServlet {

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
            out.println("<title>Servlet AdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/Admin")) {
            request.getRequestDispatcher("/Admin_Dashboard.jsp").forward(request, response);
        } else {
            if (path.startsWith("/Admin/View/")) {
                try {
                    try {
                        String[] s = path.split("/");
                        int AccountID = Integer.parseInt(s[s.length - 1]);
                        if (AccountID == 0) {
                            response.sendRedirect("/Admin");
                        } else {
                            HttpSession session = request.getSession();
                            session.setAttribute("AdminID", AccountID);
                            request.getRequestDispatcher("/JSP/AdminPage/AdminInfo.jsp").forward(request, response);
                        }
                    } catch (Exception ex) {
                        Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                if (path.startsWith("/Admin/DeleteAdmin/")) {
                    try {
                        try {
                            String[] s = path.split("/");
                            int AccountID = Integer.parseInt(s[s.length - 1]);
                            AccountDAO dao = new AccountDAO();
                            int result = dao.RemoveAdmin(AccountID);
                            if (result != 0) {
                                response.sendRedirect("/Account");
                            } else {
                                response.sendRedirect("/Admin");
                            }
                        } catch (Exception ex) {
                            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    } catch (Exception ex) {
                        Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        }

        if (path.startsWith("/Admin/Detail/")) {
            try {
                String[] s = path.split("/");
                int UserID = Integer.parseInt(s[s.length - 2]);
                int RoleID = Integer.parseInt(s[s.length - 1]);
                AccountDAO dao = new AccountDAO();
                tblUser us = new tblUser();

                us = dao.GetAccountByID(UserID);
                HttpSession session = request.getSession();
                session.setAttribute("user", us);
                if (RoleID == 1) {
                    request.getRequestDispatcher("/Admin_User_Info.jsp").forward(request, response);
                } else if (RoleID == 2) {
                    request.getRequestDispatcher("/Admin_Account_Info.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }

        }
          if (path.endsWith("/Admin/FAQ")) {
            request.getRequestDispatcher("/Admin_FAQ.jsp").forward(request, response);
        }
          else {
            if (path.startsWith("/Admin/Setting/")) {
                try {
                    String[] s = path.split("/");
                    int UserID = Integer.parseInt(s[s.length - 1]);
                    AccountDAO dao = new AccountDAO();
                    tblUser us = new tblUser();
                    us = dao.GetAccountByID(UserID);
                    HttpSession session = request.getSession();
                    session.setAttribute("user", us);
                    request.getRequestDispatcher("/Admin_Account_Setting.jsp").forward(request, response);
                } catch (Exception e) {

                }
            }else if(path.startsWith("/Admin/OrderManage")){
                 request.getRequestDispatcher("/AdminOrder.jsp").forward(request, response);
            }else if(path.startsWith("/Admin/OrderDetail/")){
                try {
                    String[] s = path.split("/");
                    int OrderID = Integer.parseInt(s[s.length - 2]);
                    int UserID = Integer.parseInt(s[s.length - 1]);
                    OrderDAO dao = new OrderDAO();
                    AccountDAO dao1 = new AccountDAO();
                    ResultSet or = dao.GetOrderInfoByID(OrderID);
                    tblUser us = new tblUser();
                     us = dao1.GetAccountByID(UserID);
                     HttpSession session = request.getSession();
                     session.setAttribute("user", us);
                     session.setAttribute("order", or);
                     request.setAttribute("orderID", OrderID);
                     request.getRequestDispatcher("/AdminOrderDetail.jsp").forward(request, response);
                } catch (Exception e) {
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
        try {
            String action = request.getParameter("action");
            if ("update to admin".equals(action)) {
//                int roleID = Integer.parseInt(request.getParameter("role"));
                int userID = Integer.parseInt(request.getParameter("user"));
                AccountDAO dao = new AccountDAO();
                int kq = dao.AddAdmin(userID);
                if (kq != 0) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print("{\"message\": \"success\",\"roleID\": \"" + 2 + "\"}");
                    out.flush();
                }
            }
        } catch (Exception e) {

        }
        if (request.getParameter("btn_admin") != null) {
            try {
                String day = request.getParameter("day");
                String month = request.getParameter("month");
                String year = request.getParameter("year");
                String gender = request.getParameter("genderSelect");
                String email = request.getParameter("email");
                String phone = request.getParameter("phonenumber");
                String address = request.getParameter("address");
                int userId = Integer.parseInt(request.getParameter("userId"));
                String birthday = year + "-" + month + "-" + day;
                AccountDAO dao = new AccountDAO();
                int kq = dao.UpdateAdminAccount(birthday, gender, phone, email, address, userId);
                if (kq != 0) {
                    response.sendRedirect("/Admin");
                } else {

                }
            } catch (Exception e) {
            }
        }

        try {
            String action = request.getParameter("action");
            if ("remove account".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("user"));
                AccountDAO dao = new AccountDAO();
                int kq = dao.RemoveAdmin(userId);
                if (kq != 0) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print("{\"message\": \"success\"}");
                    out.flush();
                }
            }

        } catch (Exception e) {
        }
        
        if (request.getParameter("btn_setting") != null) {
            try {
                String day = request.getParameter("day");
                String month = request.getParameter("month");
                String year = request.getParameter("year");
                String gender = request.getParameter("genderSelect");
                String email = request.getParameter("email");
                String phone = request.getParameter("phonenumber");
                String address = request.getParameter("address");
                int userId = Integer.parseInt(request.getParameter("userId"));
                String birthday = year + "-" + month + "-" + day;             
                AccountDAO dao = new AccountDAO();
                int kq = dao.UpdateAdminAccount(birthday, gender, phone, email, address, userId);
                tblUser user = dao.GetAccountByID(userId);
                if (kq != 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    request.setAttribute("success", "Account update successfully");
                    request.getRequestDispatcher("/Admin_Account_Setting.jsp").forward(request, response);
//                      response.sendRedirect("/Admin/Setting/" + userId);
                } else {

                }
            } catch (Exception e) {
            }
        }
                try {
            String action = request.getParameter("action");
            if("reject order".equals(action)){
                int orderID = Integer.parseInt(request.getParameter("order"));
                OrderDAO dao = new OrderDAO();
                int kq = dao.RejectOrder(orderID);
                if(kq!=0){
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print("{\"message\": \"success\"}");
                    out.flush();
                }
            }
        } catch (Exception e) {
        }
        try {
            String action = request.getParameter("action");
            if("accept order".equals(action)){
                int orderID = Integer.parseInt(request.getParameter("order"));
                OrderDAO dao = new OrderDAO();
                int kq = dao.AcceptOrder(orderID);
                if(kq!=0){
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print("{\"message\": \"success\"}");
                    out.flush();
                }
            }
        } catch (Exception e) {
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
