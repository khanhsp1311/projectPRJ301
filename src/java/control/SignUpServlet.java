/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import model.Category;
import model.User;
import java.time.LocalDate;

/**
 *
 * @author DELL
 */
public class SignUpServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("number");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        int roleID = 2;
        DAO d = new DAO();
        String id_raw = phone_number;
        if (!password.equals(re_password)) {
            String err = "Password is not the same repassword";
            request.setAttribute("err", err);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            try {
                // sau khi parse int id ta sẽ kiểm tra thông tin trong bảng của database tên là categoryDao
                User u = d.login2(email, phone_number);
                if (u == null) { // không tìm thấy tức muốn cho cái này gia nhập
                    User cNew = new User(name, email, phone_number, address, password,roleID);
                    d.insert(cNew);
                    // khi thêm thành công nó sẽ quay về cái danh sách
                    // tao cookie
                    HttpSession session = request.getSession(); // tạo session
                    session.setAttribute("DataEmail", email);
                    session.setAttribute("user", roleID);
                    Cookie cu = new Cookie("EmailUser", email);
                    cu.setMaxAge(60 * 60 * 24);
                    response.addCookie(cu);
                    response.sendRedirect("index");
                } else {
                    // tài khoản đấy đã tồn tại rồi
                    request.setAttribute("error", "Phone Number: " + phone_number + " or Email: " + email + " is existed");
                    // trả về trang mà người dùng đăng nhập
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                System.out.println(e);
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
