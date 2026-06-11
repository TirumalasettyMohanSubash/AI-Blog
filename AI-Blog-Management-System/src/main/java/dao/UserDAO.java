package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;
import model.User;

public class UserDAO {

    Connection con = DBConnection.getConnection();

    // REGISTER USER

    public boolean registerUser(User u) {

        boolean status = false;

        try {

            String sql = "INSERT INTO users(name,email,password) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());

            int row = ps.executeUpdate();

            if(row > 0) {
                status = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // LOGIN USER

    public User loginUser(String email, String password) {

        User user = null;

        try {

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                user = new User();

                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));

            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}