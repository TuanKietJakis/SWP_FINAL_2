/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Kiet
 */
public class ExportFileControllerMonth extends HttpServlet {

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
            out.println("<title>Servlet ExportFileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportFileController at " + request.getContextPath() + "</h1>");
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
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        OrderDAO oDAO = null;
        try {
            oDAO = new OrderDAO();
        } catch (Exception ex) {
            Logger.getLogger(ExportFileController.class.getName()).log(Level.SEVERE, null, ex);
        }
        ResultSet resultSet2 = oDAO.GetBillOnMonth(start, end);
        System.out.println(resultSet2);
        try ( XSSFWorkbook workbook = new XSSFWorkbook()) {
            XSSFSheet sheet = workbook.createSheet("Data");
            int rowIdx = 0;
            int colIdx = 0;
            XSSFRow headerRow = sheet.createRow(rowIdx++);
            XSSFFont boldFont = workbook.createFont();
            boldFont.setBold(true);

            XSSFCellStyle boldStyle = workbook.createCellStyle();
            boldStyle.setFont(boldFont);
            headerRow.createCell(colIdx++).setCellValue("Order ID");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx++).setCellValue("Order Date");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx++).setCellValue("Product Name");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx++).setCellValue("Product Price");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx++).setCellValue("Product Cost");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx++).setCellValue("Quantity");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx++).setCellValue("Total Price");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx++).setCellValue("Product ID");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx++).setCellValue("Active");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx++).setCellValue("Full Name");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx++).setCellValue("Email");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            headerRow.createCell(colIdx).setCellValue("Phone Number");
            headerRow.getCell(colIdx - 1).setCellStyle(boldStyle);
            while (resultSet2.next()) {
                XSSFRow row = sheet.createRow(rowIdx++);
                colIdx = 0;

                row.createCell(colIdx++).setCellValue(resultSet2.getInt("OrderID"));
                row.createCell(colIdx++).setCellValue(resultSet2.getString("OrderDate"));
                row.createCell(colIdx++).setCellValue(resultSet2.getString("ProductName"));
                row.createCell(colIdx++).setCellValue(resultSet2.getInt("ProductPrice"));
                row.createCell(colIdx++).setCellValue(resultSet2.getInt("ProductCost"));
                row.createCell(colIdx++).setCellValue(resultSet2.getInt("Quantity"));
                row.createCell(colIdx++).setCellValue(resultSet2.getInt("TotalPrice"));
                row.createCell(colIdx++).setCellValue(resultSet2.getInt("ProductID"));
                row.createCell(colIdx++).setCellValue(resultSet2.getInt("Active"));
                row.createCell(colIdx++).setCellValue(resultSet2.getString("FullName"));
                row.createCell(colIdx++).setCellValue(resultSet2.getString("Email"));
                row.createCell(colIdx++).setCellValue(resultSet2.getString("PhoneNumber"));
            }

            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=data.xlsx");
            OutputStream outputStream = response.getOutputStream();
            workbook.write(outputStream);
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("error");
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
