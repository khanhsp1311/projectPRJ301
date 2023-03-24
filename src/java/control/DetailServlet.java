/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Galery;
import model.Product;

/**
 *
 * @author DELL
 */
public class DetailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // trang chi tiết sản phẩm 
        // đầu tiên mình sẽ lấy được id của sản phẩm nhờ id sản phẩm mình sẽ có thể lấy tất cả các ảnh theo id của sản phẩm đấy
        // viết lệnh lấy tất cả ảnh nhỏ của id sản phẩm đấy
        HttpSession session = request.getSession();
//        String s =(String) session.getAttribute("productId2");
        String p_raw = null;
        p_raw = request.getParameter("productId");
        DAO d = new DAO();
        try {
            int productId = Integer.parseInt(p_raw);

            List<Galery> list = d.getElementByGalery(productId);
            Product p = d.getProductById(productId);
            // từ mã id của product mình lấy ra category trong đấy rồi mới lắp vào được
            List<Product> listC = d.getElementByCId(p.getSmallImage().getCategoryId(), 0);

            List<Product> list2 = d.getElementByCId(0, productId);
//         request.setAttribute("dataC",listC);
//         request.setAttribute("dataP", list2);
//         request.setAttribute("dataG", list);

            HttpSession ses = request.getSession(true);
            ses.setAttribute("dataC", listC);
            ses.setAttribute("dataP", list2);
            ses.setAttribute("dataG", list);

        } catch (Exception e) {
        }

        request.getRequestDispatcher("single-page.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
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
