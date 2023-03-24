/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.DAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.User;

/**
 *
 * @author DELL
 */
public class LoginServlet extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String u = request.getParameter("email");
        String p = request.getParameter("pass");
        String r = request.getParameter("rem");
        DAO d = new DAO();
         User a = d.login(u, p);
        
       if(a == null){ // nếu chưa có
           String err = "Password or Email is not correct";
           request.setAttribute("err", err);
           request.getRequestDispatcher("login.jsp").forward(request, response);
       }else{ // khi có rồi tạo session
           User a1 = d.getUserById(u); // a1 là thằng user khi lấy được email
           HttpSession session = request.getSession(); // tạo session
           session.setAttribute("DataEmail", u);
           session.setAttribute("user", a1);
          
           
           // sau đó làm một cái tủ đựng đồ
           Cookie cu = new Cookie("email", u);
           Cookie cp = new Cookie("pass", p);
           Cookie cr = new Cookie("rem",r);
           // bước 2 tạo thời gian sống
           // khi người dùng ấn remember thì bắt đầu tạo cookie
           if(r == null){
               cu.setMaxAge(0);
               cp.setMaxAge(0);
               cr.setMaxAge(0);
           }else{
               cu.setMaxAge(24*24*60);
               cp.setMaxAge(24*24*60);
               cr.setMaxAge(24*24*60);
           }
           // bước 3: cho nào vào response để add vào brower
           response.addCookie(cu);
           response.addCookie(cp);
           response.addCookie(cr);
        
           
           response.sendRedirect("index");
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
        processRequest(request, response);
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
