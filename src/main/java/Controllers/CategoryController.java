/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAOs.BrandDAO;
import DAOs.CategoryDAO;
import Models.tblBrand;
import Models.tblCategory;
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
public class CategoryController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CategoryController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
           String path = request.getRequestURI();
        if (path.endsWith("/addNewCategory")) {
            request.getRequestDispatcher("/addNewCategory.jsp").forward(request, response);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
           String CatName = request.getParameter("txtCategoryName");

        CategoryDAO dao = null;
        try {
            dao = new CategoryDAO();
        } catch (Exception ex) {
            Logger.getLogger(BrandController.class.getName()).log(Level.SEVERE, null, ex);
        }
        tblCategory cat = new tblCategory(CatName, 1);
        if (dao.isCategoryExists(CatName)) {
            request.setAttribute("message", "Category already exists");
            request.getRequestDispatcher("/addNewCategory.jsp").forward(request, response);
        } else {
            int result = dao.AddNewCategory(cat);

            // Nếu thêm mới brand thành công
            if (result > 0) {
                request.setAttribute("message", "Add new category success ");
                request.getRequestDispatcher("/addNewCategory.jsp").forward(request, response);

            } else {
                request.setAttribute("message", "Failed to add new category");
                request.getRequestDispatcher("/addNewCategory.jsp").forward(request, response);
            }

        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
