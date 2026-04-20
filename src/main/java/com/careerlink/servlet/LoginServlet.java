package com.careerlink.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // DB Connection
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/careerlink_db",
                    "root",
                    "tiger"
            );

            // SQL Query
            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // Get user data
                String name = rs.getString("name");
                String emailDB = rs.getString("email");
                String mobile = rs.getString("mobile");
                String role = rs.getString("role");

                // Create session
                HttpSession session = request.getSession();

                session.setAttribute("name", name);
                session.setAttribute("email", emailDB);
                session.setAttribute("mobile", mobile);
                session.setAttribute("role", role);

                // Redirect to home
                response.sendRedirect("index.jsp");

            } else {

                response.getWriter().println("Invalid Login!");

            }

            // Close resources
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}