/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CartDAO;
import DAOs.OrderDAO;
import DAOs.OrderDetailDAO;
import Models.tblAddress;
import Models.tblCart;
import Models.tblOrder;
import Models.tblUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
            tblUser acc = dao.GetUserID(ID);
            HttpSession session = request.getSession();
            if (acc.getUserName() != null) {
                session.setAttribute("UserInfo", acc);
                request.getRequestDispatcher("/Cart.jsp").forward(request, response);
            } else {
                session.setAttribute("trigger", "asdf");
                response.sendRedirect("/");
            }
        }

        if ("chooseAddress".equals(request.getParameter("action"))) {
            int AddressID = Integer.parseInt(request.getParameter("ID"));
            CartDAO dao = null;
            try {
                dao = new CartDAO();
            } catch (Exception ex) {
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }
            tblAddress Address = dao.getAddress(AddressID);
            if (Address != null) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"FullName\":" + "\"" + Address.getFullName()
                        + "\"" + ",\"PhoneNumber\":" + "\"" + Address.getPhoneNumber()
                        + "\"" + ",\"PaymentMethod\":" + Address.getPaymentMethod()
                        + ",\"Address\":" + "\"" + Address.getAddress() + "\""
                        + "}");
                out.flush();
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
            if (ProductAmount <= 0) {
                updateDAO.Delete(CartID);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"delete\":\"delete\"}");
                out.flush();
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
        if (request.getParameter("checkout") != null) {
            String[] CartID = request.getParameter("listProduct").split(",");
            int UserID = Integer.parseInt(request.getParameter("UserID"));
            int Total = Integer.parseInt(request.getParameter("total"));
            String receivePhone = request.getParameter("receivePhone");
            String receiveName = request.getParameter("receiveName");
            byte receivePayment = Byte.parseByte(request.getParameter("receivePayment"));
            String receiveAddress = request.getParameter("receiveAddress");

            LocalDateTime currentDateTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

            String orderDate = currentDateTime.format(formatter);
            OrderDAO dao = null;
            CartDAO cdao = null;
            OrderDetailDAO odao = null;
            try {
                dao = new OrderDAO();
                cdao = new CartDAO();
                odao = new OrderDetailDAO();
            } catch (Exception ex) {
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (receivePayment == 2) {
                /* On Cash */
                tblOrder order = new tblOrder(UserID, receiveName, orderDate, Total, receivePhone, receiveAddress, Byte.parseByte("1"), receivePayment, Byte.parseByte("1"));
                int kq = dao.AddOrderFromCart(order);
                if (kq != 0) {
                    int OrderID = dao.GetOrderID(orderDate, UserID);
                    int result = 0;
                    for (int i = 0; i < CartID.length; i++) {
                        tblCart item = cdao.getItemforAdd(Integer.parseInt(CartID[i]));
                        tblCart cart = cdao.CompareAmount(Integer.parseInt(CartID[i]));
                        cdao.UpdateProductQuantity(cart.getProductAmount(), cart.getQuantity(), cart.getProductID());
                        result += odao.AddOrderDetail(item, OrderID);
                    }
                    if(result == CartID.length){
                        cdao.DeleteAllIteminCart(UserID);
                        response.sendRedirect("/OrderHistory");
                    }
                } else {
                    response.sendRedirect("/Cart/Info/" + order.getUserID());
                }
            } else {
                /*On VNPay*/

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
