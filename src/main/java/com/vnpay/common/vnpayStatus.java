/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vnpay.common;

import DAOs.vnpayDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
        String vnp_Amount = request.getParameter("vnp_Amount");
        String vnp_BankCode = request.getParameter("vnp_BankCode");
        String vnp_PayDate = request.getParameter("vnp_PayDate");
        String vnp_TmnCode = request.getParameter("vnp_TmnCode");
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");

        if (vnp_Amount != null && vnp_BankCode != null && vnp_PayDate != null
                && vnp_TmnCode != null && vnp_TxnRef != null && vnp_SecureHash != null) {
            // Các tham số đều có giá trị, bạn có thể tiếp tục xử lý.

            // Tiến hành lưu vào CSDL
            vnpayDAO dao = null;
            try {
                dao = new vnpayDAO();
            } catch (Exception ex) {
                Logger.getLogger(vnpayStatus.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
//                dao.insertPaymentInfo(vnp_Amount, vnp_BankCode, vnp_PayDate, vnp_TmnCode, vnp_TxnRef, vnp_SecureHash);
                // Insert với các trường còn lại tương ứng.
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Gửi kết quả về frontend (nếu cần)
            response.getWriter().write("Success");
        } else {
            // Một hoặc nhiều tham số thiếu giá trị, xử lý tùy ý (ví dụ: trả về thông báo lỗi).
            response.getWriter().write("Invalid Parameters");
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
