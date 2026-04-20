<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>View Applications</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>

<body class="bg-dark text-white">

<div class="container mt-5">

<h2 class="text-center text-info mb-4">

📋 Job Applications List

</h2>

<!-- SEARCH FORM -->

<form method="get"
      action="viewApplications.jsp"
      class="mb-4 text-center">

<input type="text"
       name="search"
       placeholder="Search by Email or Job Title"
       class="form-control w-50 d-inline">

<button type="submit"
        class="btn btn-info ms-2">

Search

</button>

<a href="viewApplications.jsp"
   class="btn btn-secondary ms-2">

Reset

</a>

</form>

<table class="table table-dark table-bordered table-hover">

<thead class="table-info text-dark">

<tr>

<th>ID</th>
<th>Email</th>
<th>Job</th>
<th>Qualification</th>
<th>Resume</th>
<th>Applied Date</th>
<th>Action</th>

</tr>

</thead>

<tbody>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con =
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/careerlink_db",
"root",
"tiger"
);

String search =
request.getParameter("search");

String sql;

PreparedStatement ps;

if(search != null && !search.trim().equals("")){

sql =
"SELECT * FROM applications WHERE user_email LIKE ? OR job_title LIKE ?";

ps = con.prepareStatement(sql);

ps.setString(1,"%"+search+"%");
ps.setString(2,"%"+search+"%");

}
else{

sql = "SELECT * FROM applications";

ps = con.prepareStatement(sql);

}

ResultSet rs =
ps.executeQuery();

while(rs.next()){

%>

<tr>

<td><%= rs.getInt("id") %></td>

<td><%= rs.getString("user_email") %></td>

<td><%= rs.getString("job_title") %></td>

<td><%= rs.getString("qualification") %></td>

<td>

<a href="uploads/<%= rs.getString("resume") %>"
target="_blank"
class="btn btn-success btn-sm">

View Resume

</a>

</td>

<td>

<%= rs.getTimestamp("applied_at") %>

</td>

<td>

<a href="<%= request.getContextPath() %>/editApplication.jsp?id=<%= rs.getInt("id") %>"
class="btn btn-warning btn-sm">

Edit

</a>

<a href="<%= request.getContextPath() %>/deleteApplication?id=<%= rs.getInt("id") %>"
class="btn btn-danger btn-sm">

Delete

</a>

</td>

</tr>

<%

}

rs.close();
ps.close();
con.close();

}
catch(Exception e){

out.println(e);

}

%>

</tbody>

</table>

</div>

</body>

</html>