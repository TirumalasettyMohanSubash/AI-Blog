package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import db.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sendNotification")
public class SendNotificationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String message = request.getParameter("message");

        try {

            Connection con = DBConnection.getConnection();

            String query =
            "INSERT INTO notifications(message) VALUES(?)";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, message);

            int row = ps.executeUpdate();

            if(row > 0){

                response.sendRedirect(
                "adminDashboard.jsp?success=1");

            }else{

                response.sendRedirect(
                "adminDashboard.jsp?error=1");
            }

        }catch(Exception e){

            e.printStackTrace();
        }
    }
}