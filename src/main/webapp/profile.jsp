<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>My Profile</title>

<style>
body{
    background:#0f172a;
    color:white;
    font-family:Arial;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.card{
    background:#020617;
    padding:30px;
    width:350px;
    border-radius:12px;
    text-align:center;
    box-shadow:0 0 15px #38bdf8;
}

h2{
    color:#38bdf8;
}

p{
    margin:8px 0;
}

.btn{
    display:inline-block;
    margin:10px;
    padding:8px 18px;
    background:#38bdf8;
    color:black;
    text-decoration:none;
    border-radius:6px;
    font-weight:bold;
}

.logout{
    background:#ff4d4d;
    color:white;
}
</style>

</head>

<body>

<%
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String mobile = (String) session.getAttribute("mobile");
    String role = (String) session.getAttribute("role");

    if(name == null){
        response.sendRedirect("login.html");
        return;
    }
%>

<div class="card">

<h2>👤 My Profile</h2>

<p><b>Name:</b> <%= name %></p>
<p><b>Email:</b> <%= email %></p>
<p><b>Mobile:</b> <%= mobile %></p>
<p><b>Role:</b> <%= role %></p>

<br>

<a href="index.jsp" class="btn">Home</a>
<a href="logout" class="btn logout">Logout</a>

</div>

</body>
</html>