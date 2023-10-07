/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAOs.OrderDAO;
import DAOs.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kiet CHUA XONG NHAAAAAAAAA
 */
public class OrderController extends HttpServlet {
   
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
            out.println("<title>Servlet OrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/Order")) {
            try {
                // /Order
                OrderDAO ordDAO = new OrderDAO();
                ResultSet rs = ordDAO.GetOrderInfo(1);
                request.setAttribute("rs", rs);
                request.getRequestDispatcher("JSP/OrderPage/OrderTypeSelect.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            if (path.startsWith("/Order/Detail/")) {
                String[] s = path.split("/");
                int OrderID = Integer.parseInt(s[s.length - 1]);
                if (OrderID == 0) {
                    response.sendRedirect("/Order");
                } else {
                    try {
                        OrderDAO ordDAO = new OrderDAO();
                        OrderDetailDAO orddDAO = new OrderDetailDAO();
                        ResultSet rs = ordDAO.GetSpecificOrderInfo(OrderID);
                        ResultSet rsOD = orddDAO.getOrderDetailFromOrderID(OrderID);
                        request.setAttribute("rs", rs);
                        request.setAttribute("rsOD", rsOD);
                        request.getRequestDispatcher("/JSP/OrderPage/OrderInfo_1.jsp").forward(request, response);
                    } catch (Exception ex) {
                        Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
        if (request.getParameter("btnPendingOrder") != null && request.getParameter("btnPendingOrder").equals("Pending Order")) {
            try {
                OrderDAO ordDAO = new OrderDAO();
                ResultSet rs = ordDAO.GetOrderInfo(3);
                request.setAttribute("rs", rs);
                request.getRequestDispatcher("JSP/OrderPage/OrderTypeSelect.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("btnCompleteOrder") != null && request.getParameter("btnCompleteOrder").equals("Complete Order")) {
            try {
                OrderDAO ordDAO = new OrderDAO();
                ResultSet rs = ordDAO.GetOrderInfo(1);
                request.setAttribute("rs", rs);
                request.getRequestDispatcher("JSP/OrderPage/OrderTypeSelect.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
         if (request.getParameter("SubmitCart") != null && request.getParameter("SubmitCart").equals("Complete Order")) {
            try {
                int ID = Integer.parseInt(request.getParameter("hiddenID"));
                Date time = Date.valueOf(request.getParameter("txtDate"));
                OrderDAO dao = new OrderDAO();
                int result = dao.CompleteOrder(ID, time);
                if(result != 0){
                    response.sendRedirect("/Order");
                }
            } catch (Exception ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
