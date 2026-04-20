<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Application</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-dark text-white">

<div class="container mt-5">

<h2 class="text-center text-warning mb-4">
✏️ Edit Application
</h2>

<%

int id = Integer.parseInt(request.getParameter("id"));

String email = "";
String job = "";
String qualification = "";

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/careerlink_db",
        "root",
        "tiger"
    );

    String sql = "SELECT * FROM applications WHERE id=?";

    PreparedStatement ps = con.prepareStatement(sql);

    ps.setInt(1, id);

    ResultSet rs = ps.executeQuery();

    if(rs.next()) {

        email = rs.getString("user_email");
        job = rs.getString("job_title");
        qualification = rs.getString("qualification");

    }

    rs.close();
    ps.close();
    con.close();

} catch(Exception e) {

    out.println(e);

}

%>

<form action="updateApplication" method="post">

<input type="hidden" name="id" value="<%= id %>">

<div class="mb-3">

<label>Email</label>

<input type="text"
       name="email"
       value="<%= email %>"
       class="form-control"
       required>

</div>

<div class="mb-3">

<label>Job Title</label>

<input type="text"
       name="job"
       value="<%= job %>"
       class="form-control"
       required>

</div>

<div class="mb-3">

<label>Qualification</label>

<input type="text"
       name="qualification"
       value="<%= qualification %>"
       class="form-control"
       required>

</div>

<button type="submit"
        class="btn btn-warning">

Update

</button>

<a href="viewApplications.jsp"
   class="btn btn-info">

Back

</a>

</form>

</div>

</body>
</html>