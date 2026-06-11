package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BlogDAO;
import model.Blog;

@WebServlet("/addBlog")
public class AddBlogServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String author = request.getParameter("author");

        Blog b = new Blog(title, content, author);

        BlogDAO dao = new BlogDAO();

        boolean status = dao.addBlog(b);

        if(status) {
            response.sendRedirect("viewBlogs.jsp");
        } else {
            response.sendRedirect("addBlog.jsp");
        }
    }
}