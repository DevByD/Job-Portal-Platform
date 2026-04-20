package com.careerlink.servlet;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/apply")
@MultipartConfig
public class ApplyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.html");
            return;
        }

        String email = (String) session.getAttribute("email");

        String job = request.getParameter("job");
        String qualification = request.getParameter("qualification");

        Part filePart = request.getPart("resume");
        String fileName = filePart.getSubmittedFileName();

        // Upload folder
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        filePart.write(uploadPath + File.separator + fileName);

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/careerlink_db",
                "root",
                "tiger"
            );

            String sql =
                "INSERT INTO applications(user_email, job_title, qualification, resume) VALUES (?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, job);
            ps.setString(3, qualification);
            ps.setString(4, fileName);

            ps.executeUpdate();

            ps.close();
            con.close();

            // IMPORTANT: Redirect after POST
            response.sendRedirect("index.jsp?applied=success");

        } catch (Exception e) {
            e.printStackTrace();

            // If error, redirect with fail
            response.sendRedirect("index.jsp?applied=fail");
        }
    }
}