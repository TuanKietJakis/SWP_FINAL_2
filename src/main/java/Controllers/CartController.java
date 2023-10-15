/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CartDAO;
import Models.tblCart;
import Models.tblUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.JsonObject;

/**
 *
 * @author ddand
 */
public class CartController extends HttpServlet {

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
            out.println("<title>Servlet CartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
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
        if (path.startsWith("/Cart/Info")) {
            String[] s = path.split("/");
            int ID = Integer.parseInt(s[s.length - 1]);
            AccountDAO dao = null;
            try {
                dao = new AccountDAO();
            } catch (Exception ex) {
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }
            tblUser acc = dao.GetCartByUserID(ID);
            HttpSession session = request.getSession();
            if (acc.getUserName() != null) {
                session.setAttribute("UserInfo", acc);
                request.getRequestDispatcher("/Cart.jsp").forward(request, response);
            } else {
                session.setAttribute("trigger", "asdf");
                response.sendRedirect("/");
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
        String action = request.getParameter("action");
        if ("delete-product".equals(action)) {
            int ProductID = Integer.parseInt(request.getParameter("ProductID"));
            CartDAO deleteDAO = null;
            try {
                deleteDAO = new CartDAO();
            } catch (Exception ex) {
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (deleteDAO.Delete(ProductID) != 0) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"message\": \"Xoá thành công.\"}");
                out.flush();
            }
        }
        if ("update-quan".equals(request.getParameter("action"))) {
            int ProductPrice = Integer.parseInt(request.getParameter("ProductPrice"));
            int ProductAmount = Integer.parseInt(request.getParameter("ProductAmount"));
            int CartID = Integer.parseInt(request.getParameter("CartID"));

            CartDAO updateDAO = null;

            try {
                updateDAO = new CartDAO();
            } catch (Exception ex) {
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (ProductAmount < 0) {
                updateDAO.Delete(CartID);
            } else {
                tblCart cart = updateDAO.CompareAmount(CartID);
                int oldAmount = cart.getProductAmount();
                if (cart.getQuantity() > ProductAmount) {
                    updateDAO.UpdateCartAmount(ProductAmount, CartID);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print("{\"oldAmount\":" + oldAmount + ",\"ProductPrice\":" + ProductPrice + ",\"ProductAmount\":" + ProductAmount + "}");
                    out.flush();
                }
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
