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
import java.sql.Date;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author DELL
 */
public class ListProduct extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProduct at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    int x = 0;
// chạy từ product để lấy các mã id của sản phẩm
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAO d = new DAO();
        String id_raw = request.getParameter("cid");
        HttpSession session = request.getSession();
                
        int id;
        try {
         id = (id_raw == null) ? 0 : Integer.parseInt(id_raw);
         x = id;
         session.setAttribute("cid", id);
            List<Product> list = d.getElementByCId(id,0);
            request.setAttribute("data", list);
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("list").forward(request, response);
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
        DAO d = new DAO();
        String des_raw = request.getParameter("title");
        String price1_raw = request.getParameter("price1");
        String price2_raw = request.getParameter("price2");
        String ar_raw = request.getParameter("opt");
        int id;
        int ar;
        try {
        id = x;
        ar = (ar_raw == null) ? 0 : Integer.parseInt(ar_raw);
        String describe = (des_raw == null || des_raw.equals("")) ? null : des_raw;
        double price1 = (price1_raw == null || price1_raw.equals("")) ? 0 : Double.parseDouble(price1_raw);
        double price2 = (price2_raw == null || price2_raw.equals("")) ? 0 : Double.parseDouble(price2_raw);
   
        List<Product> products = d.search(describe, price1, price2, id, ar);
        request.setAttribute("data", products);
        request.getRequestDispatcher("list").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
