/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOCategoryProduct;
import DAL.DAOPost;
import Entity.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class BlogController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlogController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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

        DAOCategoryProduct daoCP = new DAOCategoryProduct();
        DAOPost daoP = new DAOPost();
        HttpSession session = request.getSession();
        String service = request.getParameter("service");
        Vector<Post> list_post = new Vector<>();
        String cid_raw = request.getParameter("cid");
        int cid = 0;
        try {
            if (cid_raw != null) {
                cid = Integer.parseInt(cid_raw);
            }
        } catch (Exception e) {
            request.getRequestDispatcher("HomePage").forward(request, response);
        }
        if (service == null) {
            list_post = daoP.getBlog();
            request.setAttribute("blog", list_post);
            request.setAttribute("category_product", daoCP.getCategoryProductProduct());
        } else if (service.equals("viewDetail")) {
            int postID = Integer.parseInt(request.getParameter("postID"));
            String name = request.getParameter("name");
            request.setAttribute("blog", daoP.getPostByCPname(name));
            request.setAttribute("category_product", daoCP.getCategoryProductProduct());
            request.setAttribute("blog", daoP.getPostById(postID));

        } else if (service.equals("search")) {
            String title = request.getParameter("title");
            list_post = daoP.search(title);
            request.setAttribute("blog", daoP.search(title));
            request.setAttribute("category_product", daoCP.getCategoryProductProduct());
        } else if (service.equals("getBlogByCP")) {

            String name = request.getParameter("name");
            list_post = daoP.getPostByCPname(name);
            request.setAttribute("cid", cid);
            request.setAttribute("blog", daoP.getPostByCPname(name));
            request.setAttribute("category_product", daoCP.getCategoryProductProduct());
        }
        int page = 0;
        int numberOfPage = 6;
        String xpage = request.getParameter("page");
        int size = list_post.size();
        int num = (size % numberOfPage == 0 ? (size / numberOfPage) : ((size / numberOfPage) + 1));
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numberOfPage;
        end = Math.min(page * numberOfPage, list_post.size());
        Vector<Post> list = daoP.getListByPage(list_post, start, end);
        request.setAttribute("lastPost", daoP.getLastBlog());
        request.setAttribute("numpage", num);
        request.setAttribute("page", page);
        request.setAttribute("numberOfPage", numberOfPage);
        request.setAttribute("blog", list);

        request.getRequestDispatcher("Views/listBlog.jsp").forward(request, response);

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
        String service = request.getParameter("service");
        DAOPost daoP = new DAOPost();
        DAOCategoryProduct daoCP = new DAOCategoryProduct();

        if (service.equals("search")) {
            String title = request.getParameter("title");
            request.setAttribute("blog", daoP.search(title));
            request.setAttribute("category_product", daoCP.getCategoryProductProduct());
            request.getRequestDispatcher("Views/listBlog.jsp").forward(request, response);
        } else if (service.equals("viewDetail")) {
            int postID = Integer.parseInt(request.getParameter("postID"));
            request.setAttribute("blog", daoP.getPostById(postID));
            request.getRequestDispatcher("Views/blogDetail.jsp").forward(request, response);

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
