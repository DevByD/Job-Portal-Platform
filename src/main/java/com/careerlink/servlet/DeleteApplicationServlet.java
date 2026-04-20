package com.careerlink.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deleteApplication")
public class DeleteApplicationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get ID from URL
            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect Database
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/careerlink_db",
                    "root",
                    "tiger"
            );

            // Delete Query
            String sql =
                    "DELETE FROM applications WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            // Execute Delete
            ps.executeUpdate();

            ps.close();
            con.close();

            // Redirect correctly (IMPORTANT FIX)
            response.sendRedirect(
                    request.getContextPath()
                    + "/viewApplications.jsp"
            );

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
}