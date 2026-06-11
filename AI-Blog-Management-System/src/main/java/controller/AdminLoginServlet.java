package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // ADMIN CREDENTIALS

        String adminEmail = "admin@gmail.com";
        String adminPassword = "admin123";

        if(email.equals(adminEmail) && password.equals(adminPassword)) {

            HttpSession session = request.getSession();

            session.setAttribute("admin", email);

            response.sendRedirect("adminDashboard.jsp");

        } else {

            response.sendRedirect("adminLogin.jsp");
        }
    }
}