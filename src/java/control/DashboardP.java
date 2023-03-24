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
import java.util.List;
import model.Product;

/**
 *
 * @author DELL
 */
public class DashboardP extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DashboardP</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashboardP at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        
        
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("Dashboard.jsp");
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
      PrintWriter out = response.getWriter();
        out.println("oke oke");
         DAO d = new DAO();
        String date1_raw = request.getParameter("date1");
        String date2_raw = request.getParameter("date2");
        Date date1, date2;
        try {
             date1=((date1_raw == null) || (date1_raw.equals(""))) ? null : Date.valueOf(date1_raw);
            date2=((date2_raw == null) || (date2_raw.equals(""))) ? null : Date.valueOf(date2_raw);
              List<Product> list = d.Statistic2(date1, date2);
              request.setAttribute("list", list);
              request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            
        }
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
