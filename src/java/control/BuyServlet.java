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
import jakarta.servlet.http.Cookie;
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
public class BuyServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //Lưu cart vào session
        HttpSession ses = request.getSession(true);
        Cart cart = null;
        //lấy thuộc tính cart ở bên jsp và trả vào object o
        Object o = ses.getAttribute("cart");
        //nếu object đã tồn tại, sản phẩm đã được mua trước đó
        if(o != null){ // có rồi
            cart = (Cart)o; 
        }
        else{
            cart = new Cart();
        }
        
        //lấy số lượng ng dùng muốn mua và id của sản phầm đó từ bên jsp
        String tnum = request.getParameter("num");
        String tid = request.getParameter("productId");
        int num, id = 0;
        try{ 
            num = Integer.parseInt(tnum);
            id = Integer.parseInt(tid);
            //tìm sản phẩm bởi id đã lấy ở trên
            DAO d = new DAO();
            Product p = d.getProductById(id);
            double price = p.getPrice(); // tăng lên 1.2: discount
            //tạo item từ sản phẩm để add vào cart
            Item t = new Item(p, num, price); // giỏ hàng có sản phẩm số lượng và giá
         
            cart.addItem(t);
        }catch(NumberFormatException e){
            num=1;
        }
        //danh sách các item ở trong cart
        List<Item> list = cart.getItems();
        //set thuộc tính cart, size để sử dụng bên jsp
        ses.setAttribute("cart", cart); // trong cart có bao nhiêu sản phẩm gửi sang
        //size là độ dài của danh sách các item
        ses.setAttribute("size", list.size());
//        ses.setAttribute("productId2", tid);
        //sang trang jsp để tiếp tục xử lý
        request.getRequestDispatcher("detail").forward(request, response);
        
        
        // khi mà mua thì nó vẫn ở trang đấy
        /*
        index chạy sang paging (load dữ liệu)
        paging chạy sang index.jsp (và phân trang luôn)
        khi ấn vào sản phẩm mình cũng có thể hiện ra được detail
        ấn vào khung -> detail.
        
        ở list servlet tạo session khi nó bấm vào products.jsp - > product - > list(session)
        
        tại sao khi bấm vào add to cart nó không gọi được lại ghi ra các sản phẩm như vậy
        // nguồn link nó lấy từ detail nó lấy được id khi bấm vào sản phẩm nào đó rồi lại hiển
        thị trong phần single.jsp.
        vấn đề là mình không lấy được để truyền sang cho nó hiển thị
        
        
        */
  
   
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
