/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOPost;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 *
 * @author admin
 */
public class Status extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");



    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int postID = -1;
        int status = -1;
        int featured = -1;
        String service = request.getParameter("service");
        if (service.equals("status")) {
             try{
           postID = Integer.parseInt(request.getParameter("postID"));
           status = Integer.parseInt(request.getParameter("status"));
       }
       catch(Exception e){
           response.sendRedirect("PostController");
       }
         DAOPost db = new DAOPost();
         db.hideShow(postID, status);
         response.sendRedirect("PostController");
        }else if(service.equals("featured")){
            try{
           postID = Integer.parseInt(request.getParameter("postID"));
           featured = Integer.parseInt(request.getParameter("featured"));
       }
       catch(Exception e){
           response.sendRedirect("PostDetail?service=viewDetail&postID="+postID);
       }
         DAOPost db = new DAOPost();
         db.On_OffFeature(postID, featured);
           response.sendRedirect("PostDetail?service=viewDetail&postID="+postID);
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
