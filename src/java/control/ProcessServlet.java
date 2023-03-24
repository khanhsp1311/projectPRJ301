/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;


import dal.DAO;
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
import model.Item;
import model.Product;

/**
 *
 * @author DELL
 */
@WebServlet(urlPatterns={"/process"})
public class ProcessServlet extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // xử lý cộng trừ
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //========================
        // chức năng là + - số lượng sản phẩm
        //============================
        HttpSession session = request.getSession();
       Cart cart = null;
       Object o = session.getAttribute("cart"); //laaysy giỏ
        if(o != null){
            cart = (Cart)o;
        }else{
            cart = new Cart();
        }
        String tnum = request.getParameter("num").trim(); // lấy số lượng
        String tid = request.getParameter("id"); // lấy mã sản phẩm
        int id, num;
        try {
            id = Integer.parseInt(tid);
            num=Integer.parseInt(tnum);
            // nếu không có sản phẩm
            // = 1 là có một sản phẩm
            // số lượng trừ đi 1 thì xóa đi
            if((num==-1) && (cart.getQuantityById(id) <=1)){ // nếu số lượng = -1 và giỏ hàng là 
                cart.removeItem(id);
            }else{
               DAO d = new DAO();
              Product p = d.getProductById(id);
            double price = p.getPrice()*1.2;
            Item t = new Item(p, num, price);
            cart.addItem(t);
            }
        } catch (Exception e) {
        }
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("MyEcart.jsp").forward(request, response);
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //========================
        // chức năng là xóa: hàm này
        //============================
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if(o != null){
            cart = (Cart)o;
        }else{
            cart = new Cart();
        }
        int id = Integer.parseInt(request.getParameter("id"));
        cart.removeItem(id);
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("MyEcart.jsp").forward(request, response);
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
