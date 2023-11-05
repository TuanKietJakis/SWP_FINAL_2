/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ProductDAO;
import Models.tblProduct;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ddand
 */
public class ShopController extends HttpServlet {

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
            out.println("<title>Servlet ShopController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/Shop")) {
            request.getRequestDispatcher("/listProuct.jsp").forward(request, response);
        } else {
            if (path.startsWith("/Shop/Detail")) {
                String[] s = path.split("/");
                int ProductID = Integer.parseInt(s[s.length - 1]);
                if (ProductID == 0) {
                    response.sendRedirect("/Shop");
                } else {
                    ProductDAO dao = null;
                    try {
                        dao = new ProductDAO();
                    } catch (Exception ex) {
                        Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    tblProduct pro = dao.getProductbyID(ProductID);
                    if(pro.getProductName() == null){
                        response.sendRedirect("/404NotFound");
                    }else{             
                    request.setAttribute("Product", pro);
                    request.getRequestDispatcher("/productDetail.jsp").forward(request, response);
                    }
                }
            } else {
                if (path.startsWith("/Shop/Search")) {
                    String[] s = path.split("=");
                    String inputValue = s[s.length - 1];
                    request.setAttribute("inputValue", inputValue);
                    request.getRequestDispatcher("/SearchProduct.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        if ("loadmore".equals(action)) {
            int limit = Integer.parseInt(request.getParameter("limit"));
            int start = Integer.parseInt(request.getParameter("start"));
            ProductDAO dao = null;
            try {
                dao = new ProductDAO();
            } catch (Exception ex) {
                Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
            }
            ResultSet rs = dao.getAllProductLimit(start, limit);
            List<tblProduct> list = new ArrayList<>();
            try {
                while (rs.next()) {
                    int ProductID = rs.getInt("ProductID");
                    String ProductName = rs.getString("ProductName");
                    int ProductPrice = rs.getInt("Price");
                    String ProductImageURL = rs.getString("ProductImageURL");
                    list.add(new tblProduct(ProductID, ProductName, ProductPrice, ProductImageURL));
                }
            } catch (SQLException ex) {
                Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
            }
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(list);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if ("fetch_data".equals(action)) {
            String sql = "Select * from tblProduct where Active = 1 ";
            String Brand = (String) request.getParameter("brand");
            if (Brand != "") {
//                String brandFilter = String.join("','", Brand);
                sql += " AND BrandID IN(" + Brand + ") ";
            }
            String Category = (String) request.getParameter("category");
            if (Category != "") {
//                String categoryFilter = String.join("','", Category);
                sql += " AND CategoryID IN(" + Category + ") ";
            }
            String Size = (String) request.getParameter("size");
            if (Size != "") {
//                String categoryFilter = String.join("','", Category);
                sql += " AND Size IN(" + Size + ") ";
            }
            if (request.getParameter("search") != null) {
                String regex = (String) request.getParameter("search");
                sql += "AND ProductName like '%" + regex + "%'";
            }
            int price = Integer.parseInt(request.getParameter("price"));
            if (price == 1) {
                sql += " ORDER BY price ASC ";
            } else if (price == 2) {
                sql += " ORDER BY price DESC ";
            }
            ProductDAO dao = null;
            try {
                dao = new ProductDAO();
            } catch (Exception ex) {
                Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
            }
            ResultSet rs = dao.getFilterProduct(sql);
            List<tblProduct> list = new ArrayList<>();
            try {
                while (rs.next()) {
                    list.add(new tblProduct(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"), rs.getString("ProductImageURL")));
                }
            } catch (SQLException ex) {
                Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
            }
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(list);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
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
