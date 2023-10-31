/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ProductDAO;
import Models.tblProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kiet CHUA XONG NHAAAAAAAAA
 */
public class ProductController extends HttpServlet {

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
            out.println("<title>Servlet ProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductController at " + request.getContextPath() + "</h1>");
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
    int bruh = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getRequestURI();
        if (path.endsWith("/Product")) {
            // /Product
            request.getRequestDispatcher("JSP/ProductPage/ProductList.jsp").forward(request, response);
        } else {
            if (path.startsWith("/Product/View/")) {
                // /Product/View
                try {
                    try {
                        String[] s = path.split("/");
                        int ProductID = Integer.parseInt(s[s.length - 1]);
                        if (ProductID == 0) {
                            response.sendRedirect("/Product");
                        } else {
                            HttpSession session = request.getSession();
                            session.setAttribute("CategoryID", ProductID);
                            request.getRequestDispatcher("/JSP/ProductPage/ProductInfo.jsp").forward(request, response);
                        }
                    } catch (Exception ex) {
                        Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                if (path.startsWith("/Product/Delete/")) {
                    try {
                        String[] s = path.split("/");
                        String masv = s[s.length - 1];
                        ProductDAO dao = new ProductDAO();
                        dao.Delete(Integer.parseInt(masv));
                        response.sendRedirect("/Product");
                    } catch (Exception ex) {

                    }
                } else {
                    if (path.startsWith("/Product/Update/")) {
                        // Product/Update
                        try {
                            try {
                                String[] s = path.split("/");
                                int ProductID = Integer.parseInt(s[s.length - 1]);
                                ProductDAO dao = new ProductDAO();
                                tblProduct pro = dao.getInfoForUpdating(ProductID);
                                String ImgURL = dao.GetImageURL(ProductID);
                                if (pro == null) {
                                    response.sendRedirect("/Product");
                                } else {
                                    HttpSession session = request.getSession();
                                    session.setAttribute("ProductIDToUpdate", pro);
                                    session.setAttribute("ImgURL", ImgURL);
                                    request.getRequestDispatcher("/JSP/ProductPage/UpdateProduct.jsp").forward(request, response);
                                }
                            } catch (Exception ex) {
                                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        } catch (Exception ex) {
                            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    } else {
                        if (path.endsWith("/Product/Create")) {
                            try {
                                request.getRequestDispatcher("/JSP/ProductPage/CreateProduct.jsp").forward(request, response);
                            } catch (Exception ex) {
                                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
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

        if (request.getParameter("btnUpdatePro") != null) {
            try {
                int ProductID = Integer.parseInt(request.getParameter("txtProductID"));
                int CategoryID = Integer.parseInt(request.getParameter("selectCategoryID"));
                String ProductName = request.getParameter("txtProductName");
                int Price = Integer.parseInt(request.getParameter("txtPrice"));
                int BrandID = Integer.parseInt(request.getParameter("selectBrand"));
                int RatingID = Integer.parseInt(request.getParameter("selectRatingID"));
                String ProductDes = request.getParameter("txtProductDes");
                int Quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                byte Active = (byte) Integer.parseInt(request.getParameter("txtActive"));
                String ProductImageURL = request.getParameter("txtProductImageURL");
                int Size = Integer.parseInt(request.getParameter("txtSize"));
                tblProduct newPro = new tblProduct();
                ProductDAO dao = new ProductDAO();
                int result = dao.UpdateProduct(newPro);
                if (result != 0) {
                    response.sendRedirect("/Product/View/" + CategoryID);
                } else {
                    response.sendRedirect("/Product/Update/" + bruh);
                }
            } catch (Exception e) {
            }
        }

        if (request.getParameter("btnInsertPro") != null) {
            try {
                ProductDAO dao = new ProductDAO();
                int ProductID = Integer.parseInt(request.getParameter("txtProductID"));
                String ProductName = request.getParameter("txtProductName");
                int Price = Integer.parseInt(request.getParameter("txtPrice"));
                int BrandID = Integer.parseInt(request.getParameter("selectBrand"));
                int CategoryID = Integer.parseInt(request.getParameter("selectCategoryID"));
                int RatingID = Integer.parseInt(request.getParameter("selectRatingID"));
                String ProductDes = request.getParameter("txtProductDes");
                int Quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                byte Active = (byte) Integer.parseInt(request.getParameter("txtActive"));
                String Image_URL = "Image\\" + (String) request.getAttribute("fileProImg");
                int Size = Integer.parseInt(request.getParameter("txtSize"));
                tblProduct newPro = new tblProduct(ProductID, ProductName, Price, BrandID, CategoryID, ProductDes, Quantity, Active ,Image_URL , Size );//EDIT TUANKIET
                int result1 = dao.AddNew(newPro);
                if (result1 != 0 ) {
                    response.sendRedirect("/Product/View/" + CategoryID);
                } else {
                    response.sendRedirect("/Product/Create");
                }
            } catch (Exception ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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
