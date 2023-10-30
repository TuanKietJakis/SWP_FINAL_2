/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.BrandDAO;
import Models.tblBrand;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static java.lang.System.out;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kiet
 */
public class BrandController extends HttpServlet {

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
            out.println("<title>Servlet BrandController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BrandController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/addNewBrand")) {
            request.getRequestDispatcher("/addNewBrand.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brandName = request.getParameter("txtBrandName");

        BrandDAO dao = null;
        try {
            dao = new BrandDAO();
        } catch (Exception ex) {
            Logger.getLogger(BrandController.class.getName()).log(Level.SEVERE, null, ex);
        }
        tblBrand brand = new tblBrand(brandName, 1);
        if (dao.isBrandExists(brandName)) {
            request.setAttribute("message", "Brand already exists");
            request.getRequestDispatcher("/addNewBrand.jsp").forward(request, response);
        } else {
            int result = dao.AddNewBrand(brand);

            // Nếu thêm mới brand thành công
            if (result > 0) {
                request.setAttribute("message", "Add new brand success ");
                request.getRequestDispatcher("/addNewBrand.jsp").forward(request, response);

            } else {
                request.setAttribute("message", "Failed to add new brand");
                request.getRequestDispatcher("/addNewBrand.jsp").forward(request, response);
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
