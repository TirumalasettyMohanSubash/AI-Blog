package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBConnection;
import model.Blog;

public class BlogDAO {

    Connection con = DBConnection.getConnection();

    // ADD BLOG

    public boolean addBlog(Blog b) {

        boolean status = false;

        try {

            String sql = "INSERT INTO blogs(title,content,author) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, b.getTitle());
            ps.setString(2, b.getContent());
            ps.setString(3, b.getAuthor());

            int row = ps.executeUpdate();

            if(row > 0) {
                status = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // VIEW BLOGS

    public ArrayList<Blog> getAllBlogs() {

        ArrayList<Blog> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM blogs ORDER BY id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Blog b = new Blog();

                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("content"));
                b.setAuthor(rs.getString("author"));

                list.add(b);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // DELETE BLOG

    public boolean deleteBlog(int id) {

        boolean status = false;

        try {

            String sql = "DELETE FROM blogs WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int row = ps.executeUpdate();

            if(row > 0) {
                status = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}