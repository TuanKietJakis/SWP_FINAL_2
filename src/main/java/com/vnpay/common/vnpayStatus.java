/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vnpay.common;

import DAOs.CartDAO;
import DAOs.OrderDetailDAO;
import DAOs.vnpayDAO;
import Models.tblCart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kiet
 */
public class vnpayStatus extends HttpServlet {

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
            out.println("<title>Servlet vnpayStatus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet vnpayStatus at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getRequestURI();
        if (path.startsWith("/vnpayStatus")) {
            HttpSession session = request.getSession();
            int vnp_UserID = (int) session.getAttribute("pay_UserID");
            String vnp_FullName = (String) session.getAttribute("pay_fullName");
            String vnp_PayDate = request.getParameter("vnp_PayDate");
// Chuyển đổi chuỗi thành đối tượng Date
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            Date date = null;
            try {
                date = inputFormat.parse(vnp_PayDate);
            } catch (ParseException ex) {
                Logger.getLogger(vnpayStatus.class.getName()).log(Level.SEVERE, null, ex);
            }
// Định dạng lại thành chuỗi theo định dạng mới
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
            //sau khi format
            String formattedDate = outputFormat.format(date);
            int vnp_Amount = (int) session.getAttribute("pay_orderPrice");
            String vnp_PhoneNumber = (String) session.getAttribute("pay_phone");
            String vnp_Address = (String) session.getAttribute("pay_address");

            vnpayDAO dao = null;
            CartDAO cdao = null;
            OrderDetailDAO odao = null;
            try {
                dao = new vnpayDAO();
                cdao = new CartDAO();
                odao = new OrderDetailDAO();
            } catch (Exception ex) {
                Logger.getLogger(vnpayStatus.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                dao.AddOrderFromCart(vnp_UserID, vnp_FullName, formattedDate,
                        vnp_Amount, vnp_PhoneNumber, vnp_Address); // add order in tblorder

                int orderID = dao.GetOrderID(formattedDate, vnp_UserID); //lay orderID
                int result = 0;

                String[] CartID = (String[]) session.getAttribute("pay_CartID");
                for (int i = 0; i < CartID.length; i++) {
                    tblCart item = cdao.getItemforAdd(Integer.parseInt(CartID[i]));
                    tblCart cart = cdao.CompareAmount(Integer.parseInt(CartID[i]));
                    cdao.UpdateProductQuantity(cart.getProductAmount(), cart.getQuantity(), cart.getProductID());
                    result += odao.AddOrderDetail(item, orderID);
                }
                if (result == CartID.length) {
                    cdao.DeleteAllIteminCart(vnp_UserID);
                    request.getRequestDispatcher("/thanksForPayMent.jsp").forward(request, response);
                }

            } catch (Exception e) {
                e.printStackTrace();
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
        processRequest(request, response);
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
