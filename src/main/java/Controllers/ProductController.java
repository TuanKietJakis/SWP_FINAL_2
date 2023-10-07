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
                int Product_ID = Integer.parseInt(request.getParameter("txtProID"));
                int Category_ID = Integer.parseInt(request.getParameter("slctCatID"));
                String P_name = request.getParameter("txtProName");
                int Brand_ID = Integer.parseInt(request.getParameter("slctBrand"));
                String P_price = request.getParameter("txtProPrice");
                String P_size = request.getParameter("txtProSize");
                String P_Status = request.getParameter("slctStatus");
                String P_country = request.getParameter("txtProCountry");
                tblProduct newPro = new tblProduct(); //EDIT TUANKIET
                ProductDAO dao = new ProductDAO();
                int result = dao.UpdateProduct(newPro);
                if (result != 0) {
                    response.sendRedirect("/Product/View/" + Category_ID);
                } else {
                    response.sendRedirect("/Product/Update/" + bruh);
                }
            } catch (Exception e) {
            }
        }

        if (request.getParameter("btnInsertPro") != null) {
            try {
                ProductDAO dao = new ProductDAO();
                int Product_ID = Integer.parseInt(request.getParameter("txtProID"));
                int Category_ID = Integer.parseInt(request.getParameter("slctCatID"));
                String P_name = request.getParameter("txtProName");
                int Brand_ID = Integer.parseInt(request.getParameter("slctBrand"));
                String P_price = request.getParameter("txtProPrice");
                String P_size = request.getParameter("txtProSize");
                String P_Status = request.getParameter("slctStatus");
                String P_country = request.getParameter("txtProCountry");
                String Image_URL = "Image\\" + (String) request.getAttribute("fileProImg");
                tblProduct newPro = new tblProduct();//EDIT TUANKIET
                int ImageID = dao.GetLastImageID();
//                ProductImage newProImg = new ProductImage(ImageID, Product_ID, Image_URL);
                int result1 = dao.AddNew(newPro);
//                int result2 = dao.AddImage(newProImg);
//                if (result1 != 0 && result2 != 0) {
//                    response.sendRedirect("/Product/View/" + Category_ID);
//                } else
                {
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
