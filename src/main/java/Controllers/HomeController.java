/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CartDAO;
import DAOs.FaQDAO;
import Models.tblFAQ;
import Models.tblProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ddand
 */
public class HomeController extends HttpServlet {

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
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/Home") || path.endsWith("/Home/")) {
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        }else{
            if (path.endsWith("/AboutUs") || path.endsWith("/AboutUs/")) {
                        request.getRequestDispatcher("/AbouUs.jsp").forward(request, response);
            }else if (path.endsWith("/Contact")) {
            request.getRequestDispatcher("/ContactUs.jsp").forward(request, response);
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
        if ("addtoCart".equals(action)) {
            int UserID = Integer.parseInt(request.getParameter("UserID"));
            if (UserID != 0) {
                int ProductID = Integer.parseInt(request.getParameter("ProductID"));
                CartDAO addDAO = null;
                tblProduct pro = new tblProduct();
                try {
                    addDAO = new CartDAO();
                } catch (Exception ex) {
                    Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
                }
                pro = addDAO.getProductforAdd(ProductID);
                int kq = addDAO.AddNewCart(UserID, pro);
                if (kq != 0) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print("{\"message\": \"success\"}");
                    out.flush();
                } else {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print("{\"message\": \"fail\"}");
                    out.flush();
                }
            }else{
                response.sendRedirect("/Login");
            }
        }
         if (request.getParameter("btnContact") != null) {
            try {
                String email = request.getParameter("email");
                String helpmessage = request.getParameter("message");
                AccountDAO dao = new AccountDAO();

                boolean checkEmail = dao.checkEmail(email);
                HttpSession mySession = request.getSession();
                if (checkEmail == false) {
                    request.setAttribute("mess", "Email not exist");
                    request.getRequestDispatcher("/ContactUs.jsp").forward(request, response);
                } else {
                    if (email != null || !email.equals("")) {
                        FaQDAO Fdao = new FaQDAO();
                        tblFAQ fa = new tblFAQ(helpmessage, email);
                        int kq = Fdao.AddNewQuest(fa);
                        if (kq != 0) {
                            String to = email;// change accordingly
                            //Dòng đầu tiên khởi tạo một đối tượng Properties để cấu hình các thuộc tính cho kết nối.
                            Properties props = new Properties();
// Dòng tiếp theo sử dụng phương thức put() của đối tượng Properties để thiết lập thông tin máy chủ SMTP của Gmail là "smtp.gmail.com".
                            props.put("mail.smtp.host", "smtp.gmail.com");
                            //Dòng đầu tiên khởi tạo một đối tượng Properties để cấu hình các thuộc tính cho kết nối.
                            props.put("mail.smtp.socketFactory.port", "465");
                            //Dòng đầu tiên khởi tạo một đối tượng Properties để cấu hình các thuộc tính cho kết nối.
                            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                            //Dòng thứ năm đánh dấu yêu cầu xác thực (authentication) của người dùng khi gửi email.
                            props.put("mail.smtp.auth", "true");
                            //Và dòng cuối cùng thiết lập cổng SMTP là 465 để sử dụng kết nối SSL an toàn.
                            props.put("mail.smtp.port", "465");
                            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                                protected PasswordAuthentication getPasswordAuthentication() {
                                    return new PasswordAuthentication("tuankietjks@gmail.com", "yhdtpueqzckjyrkl");// Put your email pass:y h d t p u e q z c k j y r k l
                                    // id and
                                    // password here
                                }
                            });//Vì vậy, đoạn mã này thiết lập phiên gửi email để xác thực người dùng và thiết lập thông tin tài khoản Gmail cho việc gửi email.
                            String subject = "Thank you for contacting us!";
                            String greeting = "<h2>Dear User,</h2>";
                            String messageContent = "Dear valued customer,\n\n"
                                    + "We would like to express our heartfelt gratitude for reaching out to our store. We are delighted to receive your message and sincerely appreciate your interest in our products and services.\n\n"
                                    + "Your message has been acknowledged, and we will promptly review and respond to it. We are committed to providing you with the best support and addressing any questions to ensure you have the best shopping experience at our store.\n\n"
                                    + "Thank you and have a great day!\n\n"
                                    + "Sincerely,\n";
                            String closing = "<br><p>Best regards,</p><p>Floral Fantasy</p><p>Email: tuankietjks@gmail.com</p><p>Mobile: 01123456789</p>";

// Build the email content using HTML tags
                            StringBuilder sb = new StringBuilder();
                            sb.append("<div style='background-color:#f7f7f7;padding:20px;font-family:Arial,sans-serif;'>");
                            sb.append("<div style='background-color:#fff;padding:20px;border-radius: 10px;'>");
                            sb.append("<div style='background-image:url(assets1/images/login.jpg); width=200px;font-family:Arial,sans-serif;'>");
                            sb.append(greeting);
                            sb.append("<p>Thank you for choosing our store.</p>");
                            sb.append(messageContent);
                            sb.append("<br>");
                            sb.append(closing);
                            sb.append("</div></div>");

                            try {
                                MimeMessage message = new MimeMessage(session);
                                message.setFrom(new InternetAddress(email));
                                message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
                                message.setSubject(subject);

                                // Set the email content type to HTML
                                message.setContent(sb.toString(), "text/html");

                                // Send message
                                Transport.send(message);
                            } catch (MessagingException e) {
                                throw new RuntimeException(e);
                            }
                            mySession.setAttribute("email", email);
                            request.setAttribute("Ps", "Your message have been sent");
                            request.getRequestDispatcher("/home_redirect.jsp").forward(request, response);
                        } else {
                            response.sendRedirect("/Contact");
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

}
