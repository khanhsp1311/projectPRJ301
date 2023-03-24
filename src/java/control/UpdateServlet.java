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
import java.sql.Date;
import model.Category;
import model.Product;

/**
 *
 * @author DELL
 */
public class UpdateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    int id_update = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        int id;
        DAO cdb = new DAO();
        try {
            id = Integer.parseInt(id_raw);
            id_update = id;
            // khi có id nó trả về category
            Product p = cdb.getProductById(id);
            request.setAttribute("product", p);
            request.getRequestDispatcher("update.jsp").forward(request, response);
        } catch (Exception e) {
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

      
        String title = request.getParameter("title");
        String price_raw = request.getParameter("price");
        String discount_raw = request.getParameter("discount");
        String thumbnail = request.getParameter("thumbnail");
        String description = request.getParameter("description");
        String created_raw = request.getParameter("created_at");
        String updated_raw = request.getParameter("updated_at");
        double price, discount;
        int id;
        Date created_at, updated_at;
        DAO d = new DAO();
        try {
            id = id_update;
            price = Double.parseDouble(price_raw);
            discount = Double.parseDouble(discount_raw);
            created_at = Date.valueOf(created_raw);
            updated_at = Date.valueOf(updated_raw);
            Product pNew = new Product(id, title, price, discount, description, created_at, updated_at, thumbnail);
            d.update(pNew);
            response.sendRedirect("product");
        } catch (Exception e) {
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
