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
import java.util.List;
import model.Product;

/**
 *
 * @author DELL
 */
public class PagingServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      DAO pdb = new DAO();
        List<Product> list1 = pdb.getElementByCId(0, 0);
        // nó thuộc trang nào
        int page;
        int size = list1.size();
       int num = (size%9== 0 ? (size/9) :(size/9)+1); // số trang
        // có bao nhiêu phần tử trên một trang
        int numperpage=9;
        String xpage=request.getParameter("page");
        if(xpage == null){
            page = 1;
        }else{
            page = Integer.parseInt(xpage); 
        }
        int start , end;
        start = (page-1)*numperpage;
        /*
        start = 12;
        giả sử có 14 phần tử
        thì có trang thứ 3: 3*6 = (18,14)
        lấy từ 12 đến 14 (14-1: vì vị trí start từ 0)
        */
        end = Math.min(page*numperpage,size); 
        List<Product> list = pdb.getListByPage(list1, start, end);
        
        request.setAttribute("data", list);
        request.setAttribute("page", page);
        request.setAttribute("num", num); // để nó biết được bao nhiêu trang
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
