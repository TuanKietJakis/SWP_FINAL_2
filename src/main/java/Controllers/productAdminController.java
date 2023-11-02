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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
/**
 *
 * @author ADMIN
 */
public class productAdminController extends HttpServlet {

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
            out.println("<title>Servlet productAdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productAdminController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/Admin/Product/List") || path.endsWith("/Admin/Product/List/")) {
            request.getRequestDispatcher("/listProductAdmin.jsp").forward(request, response);
        } else {
            if (path.startsWith("/Admin/Product/addNewProduct")) {
                request.getRequestDispatcher("/ImportProduct.jsp").forward(request, response);
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
    private static final String UPLOAD_DIR = "img";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("btnImportProduct") != null) {

            try {
                String imgFolderPath = "img";
                String appPath = getServletContext().getRealPath("/");
                String uploadPath = appPath + File.separator + imgFolderPath;

                
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                
                Part filePart = request.getPart("txtProductImageURL");
                String fileName = filePart.getSubmittedFileName();
                String fileUrl = "";
                if (fileName == "") {
                    fileUrl = request.getParameter("imgTmp");
                } else {
                    String filePath = uploadPath + File.separator + fileName;
                    filePart.write(filePath);

                    
                    fileUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;
                }
                String pro_pic = fileUrl;
                System.out.println(pro_pic);
                String ProductBrand = request.getParameter("BrandSelect");
                String ProductCategory = request.getParameter("CateSelect");
                String ProductName = request.getParameter("ProName");
                int ProductQuantity = Integer.parseInt(request.getParameter("ProQuan"));
                int ProductPrice = Integer.parseInt(request.getParameter("ProPrice"));
                int ProductSize = Integer.parseInt(request.getParameter("ProSize"));
                int ProductOriginalPrice = Integer.parseInt(request.getParameter("ProOrPrice"));
                String ProductDescription = request.getParameter("ProDes");
                String BrandInput = request.getParameter("brandinput");
                String CategoryInput = request.getParameter("cateinput");
                byte Active = 1;
                ProductDAO dao = new ProductDAO();
                ProductDAO dao1 = new ProductDAO();
                ProductDAO dao2 = new ProductDAO();
                //------Check if BrandName or CategoryName exist
                boolean checkBrandName = dao.CheckBrandName(ProductBrand);
                boolean checkCategoryName = dao1.CheckCategoryName(ProductCategory);
                //------Check case
                if (checkBrandName == false && checkCategoryName == false) {
                    tblProduct pr = new tblProduct(BrandInput, CategoryInput);
                    int kq = dao2.AddNewBrandNameCatName(pr);
                    if (kq != 0) {
                        int BrandID = dao.GetBrandIDByBrandName(BrandInput);
                        int CategoryID = dao1.GetCategoryIDByCategoryName(CategoryInput);
                        tblProduct p = new tblProduct(ProductName, ProductPrice, BrandID, CategoryID, ProductDescription, ProductQuantity, Active, pro_pic, ProductSize, ProductOriginalPrice);
                        int final_kq = dao2.ImportProduct(p);
                        if (final_kq != 0) {
                            response.sendRedirect("/Admin/Product/List");
                        } else {
                            response.sendRedirect("/Admin");
                        }
                    }

                } else if (checkBrandName == true && checkCategoryName == true) {
                    int BrandID = dao.GetBrandIDByBrandName(ProductBrand);
                    int CategoryID = dao1.GetCategoryIDByCategoryName(ProductCategory);
                    tblProduct p = new tblProduct(ProductName, ProductPrice, BrandID, CategoryID, ProductDescription, ProductQuantity, Active, pro_pic, ProductSize, ProductOriginalPrice);
                    int final_kq1 = dao2.ImportProduct(p);
                    if (final_kq1 != 0) {
                        response.sendRedirect("/Admin/Product/List");
                    } else {
                        response.sendRedirect("/Admin");
                    }
                } else if (checkBrandName == false && checkCategoryName) {
                    tblProduct pro = new tblProduct(BrandInput, ProductCategory);
                    int kq1 = dao2.AddNewBrandName(pro);
                    if (kq1 != 0) {
                        int BrandID = dao.GetBrandIDByBrandName(BrandInput);
                        int CategoryID = dao1.GetCategoryIDByCategoryName(ProductCategory);
                        tblProduct p = new tblProduct(ProductName, ProductPrice, BrandID, CategoryID, ProductDescription, ProductQuantity, Active, pro_pic, ProductSize);
                        int final_kq2 = dao2.ImportProduct(p);
                        if (final_kq2 != 0) {
                            response.sendRedirect("/Admin/Product/List");
                        } else {
                            response.sendRedirect("/Admin");
                        }
                    }
                } else if (checkBrandName && checkCategoryName == false) {
                    tblProduct pro = new tblProduct(ProductBrand, CategoryInput);
                    int kq2 = dao.AddNewCategoryName(pro);
                    if (kq2 != 0) {
                        int BrandID = dao.GetBrandIDByBrandName(ProductBrand);
                        int CategoryID = dao1.GetCategoryIDByCategoryName(CategoryInput);
                        tblProduct p = new tblProduct(ProductName, ProductPrice, BrandID, CategoryID, ProductDescription, ProductQuantity, Active, pro_pic, ProductSize);
                        int final_kq3 = dao2.ImportProduct(p);
                        if (final_kq3 != 0) {
                            response.sendRedirect("/Admin/Product/List");
                        } else {
                            response.sendRedirect("/Admin");
                        }
                    }
                }
            } catch (Exception e) {
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
    
     public void uploadFile(String picture, HttpServletRequest request) {
        String relativePath = "img\\"; //ten folder chua anh
        String realPath = request.getServletContext().getRealPath("");
        String[] data = realPath.split(File.separator + "\\");
        int position = 0;//vi tri cua target
        for (int i = 0; i < data.length; i++) {
            if (data[i].equals("target")) {
                position = i;
                break;
            }
        }
        String finalPath = "";
        for (int i = 0; i < position; i++) {
            finalPath += data[i] + File.separator;
        }
        finalPath += "src\\main\\webapp\\" + relativePath + picture;

//        String RootDestination = "D:\\FPT_SE1702\\Summer2023\\PRJ301\\LAB03\\lab03_model2\\src\\main\\webapp\\";
//        String finalDestiation = RootDestination + relativePath + picture;
        try ( InputStream inS = request.getPart("txtProductImageURL").getInputStream()) {
            OutputStream outS, outSTarget;
            outS = new FileOutputStream(finalPath);
            byte[] buffer = new byte[1024];
            int bytes;
            while ((bytes = inS.read(buffer)) != -1) {
                outS.write(buffer, 0, bytes);
            }
            outS.close();
        } catch (IOException | ServletException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
