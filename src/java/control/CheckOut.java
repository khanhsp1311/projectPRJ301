/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.CustomerDAO;
import dal.DAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Product;
import model.User;

@WebServlet(urlPatterns={"/checkout"})
public class CheckOut extends HttpServlet {
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOut</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOut at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession ses = request.getSession();
        DAO d = new DAO();
        String sEmail = (String) ses.getAttribute("DataEmail");
        if(sEmail != null){
            String s = "Login Successfull";
           HttpSession session = request.getSession();
           User u = d.getUserById(sEmail);
            // gán cái đối tượng a là customer cho account
           // đăng nhập thành công thì mình sẽ add nó vào order rồi add vào orderDAO khi có id
           OrderDAO o = new OrderDAO();
           Cart c = new Cart();
           c =(Cart) session.getAttribute("cart");
           o.addOrder(u, c);
           ses.removeAttribute("cart");
           ses.removeAttribute("size");
           
           request.getRequestDispatcher("index").forward(request, response);
        }else{
        request.getRequestDispatcher("LoginCheckOut.jsp").forward(request, response);
        }
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String u = request.getParameter("email");
        String p = request.getParameter("pass");
        DAO d = new DAO();
         User a = d.login3(u, p);
             HttpSession ses = request.getSession();
       if(a == null){
           String err = "Login failed";
           request.setAttribute("error", err);
           request.getRequestDispatcher("LoginCheckOut.jsp").forward(request, response);
       }else{
           
         String sCheckOut = "Cảm ơn bạn đã mua hàng của chúng tôi";
           HttpSession session = request.getSession();
           User u1 = d.getUserById(u);
            // gán cái đối tượng a là customer cho account
           // đăng nhập thành công thì mình sẽ add nó vào order rồi add vào orderDAO khi có id
           session.setAttribute("DataEmail", u);
           session.setAttribute("checkout", sCheckOut);
           OrderDAO o = new OrderDAO();
           Cart c = new Cart();
           c =(Cart) session.getAttribute("cart");
           o.addOrder(u1, c);
           ses.removeAttribute("cart");
           ses.removeAttribute("size");
         
           request.getRequestDispatcher("index").forward(request, response);
       }
       // khi login rồi thì chạy từ doget về myeshop luôn
       // nếu chưa login thì chạy về trang login rồi chay sang phương thức post của checkout để nó lấy dược tài khoản các thứ
       
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
