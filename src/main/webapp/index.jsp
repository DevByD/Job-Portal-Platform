<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CareerLink | Professional Job Portal</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<!-- Animations -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* GLOBAL */

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
background:#0f172a;
color:white;
}

/* NAVBAR */

.navbar{
background:#020617;
padding:15px 60px;
display:flex;
justify-content:space-between;
align-items:center;
position:sticky;
top:0;
z-index:999;
}

.logo{
font-size:26px;
font-weight:600;
color:#38bdf8;
}

.menu a{
margin-left:25px;
color:white;
text-decoration:none;
font-weight:500;
}

.menu a:hover{
color:#38bdf8;
}

/* HERO */

.hero{
height:85vh;

background:
linear-gradient(
rgba(2,6,23,0.85),
rgba(2,6,23,0.95)
),

url("https://images.unsplash.com/photo-1521791136064-7986c2920216");

background-size:cover;
background-position:center;

display:flex;
justify-content:center;
align-items:center;
text-align:center;
}

.hero h1{
font-size:60px;
font-weight:700;
}

.glow-text{
color:#38bdf8;

text-shadow:
0 0 10px #38bdf8,
0 0 20px #38bdf8;
}

.hero p{
margin:20px;
color:#cbd5e1;
}

/* SEARCH */

.search-box{
background:rgba(255,255,255,0.05);
backdrop-filter:blur(10px);

padding:20px;
border-radius:12px;

box-shadow:
0 0 20px rgba(56,189,248,0.3);
}

.search-box input{
padding:12px;
margin:6px;
width:200px;
border:none;
border-radius:6px;
}

.search-box button{
padding:12px 25px;
background:#38bdf8;
border:none;
border-radius:6px;
font-weight:600;
cursor:pointer;
}

/* ABOUT */

.about{
padding:80px;
background:
linear-gradient(
to right,
#020617,
#0f172a
);
}

.about-wrapper{
display:flex;
gap:50px;
align-items:center;
flex-wrap:wrap;
justify-content:center;
}

.about img{
width:420px;
border-radius:12px;

box-shadow:
0 0 25px rgba(56,189,248,0.4);
}

.about-details{
max-width:550px;
}

.about h2{
text-align:center;
color:#38bdf8;
margin-bottom:40px;
}

/* FEATURE */

.features{
display:grid;
grid-template-columns:repeat(2,1fr);
gap:12px;
margin-top:15px;
}

.feature-box{
background:#020617;
padding:12px;
border-radius:8px;
}

/* JOBS */

.jobs{
padding:60px;
}

.job-list{
display:grid;
grid-template-columns:repeat(3,1fr);
gap:25px;
}

.job{
background:#020617;
padding:20px;
border-radius:10px;

transition:0.3s;

box-shadow:
0 0 10px rgba(56,189,248,0.15);
}

.job:hover{
transform:scale(1.05);

box-shadow:
0 0 20px rgba(56,189,248,0.4);
}

.job h3{
color:#38bdf8;
}

/* SERVICES */

.services{
padding:60px;
background:#020617;
text-align:center;
}

.service-box{
background:#0f172a;
padding:25px;
border-radius:10px;
margin:10px;
display:inline-block;
width:250px;

transition:0.3s;
}

.service-box:hover{
transform:translateY(-8px);

box-shadow:
0 0 20px rgba(56,189,248,0.4);
}

/* CONTACT */

.contact{
padding:60px;
text-align:center;
}

.contact input,
.contact textarea{
width:300px;
padding:10px;
margin:8px;
border-radius:5px;
border:none;
}

/* POPUP */

.popup{
position:fixed;
top:0;
left:0;
width:100%;
height:100%;

background:rgba(0,0,0,0.7);

display:none;
justify-content:center;
align-items:center;
}

.popup-content{
background:#020617;
padding:25px;
border-radius:10px;
width:350px;
text-align:center;
}

/* FOOTER */

.footer{
background:black;
padding:40px;
}

.footer-grid{
display:grid;
grid-template-columns:repeat(4,1fr);
gap:30px;
}

.footer h4{
color:#38bdf8;
}

.footer a{
color:#94a3b8;
text-decoration:none;
}

.footer a:hover{
color:#38bdf8;
}

</style>

</head>

<body>

<%
String name=(String)session.getAttribute("name");
%>

<!-- NAVBAR -->

<div class="navbar">

<div class="logo">💼 CareerLink</div>

<div class="menu">

<a href="#">Home</a>
<a href="#about">About</a>
<a href="#jobs">Jobs</a>
<a href="#contact">Contact</a>

<a href="viewApplications.jsp">
📋 Applications
</a>

<%
if(name==null){
%>

<a href="login.html">Login</a>
<a href="registration.html">Register</a>

<%
}else{
%>

<a href="profile.jsp">
👤 <%= name %>
</a>

<%
}
%>

</div>

</div>

<!-- HERO -->

<div class="hero">

<div data-aos="fade-up">

<h1>

Find Your <span class="glow-text">

Dream Job

</span>

</h1>

<p>

Trusted Career Platform For Professionals

</p>

<div class="search-box">

<input type="text"
id="job"
placeholder="🔎 Job Title">

<input type="text"
id="loc"
placeholder="📍 Location">

<button onclick="searchJob()">

Search Jobs

</button>

</div>

</div>

</div>

<!-- ABOUT -->

<div class="about" id="about">

<h2 data-aos="fade-up">

About CareerLink

</h2>

<div class="about-wrapper">

<img src="https://images.unsplash.com/photo-1521737604893-d14cc237f11d"
data-aos="fade-right">

<div class="about-details"
data-aos="fade-left">

<h3>

We Build Careers

</h3>

<p>

CareerLink connects professionals
with top companies and helps
build successful careers.

</p>

<div class="features">

<div class="feature-box">
✔ Verified Companies
</div>

<div class="feature-box">
✔ Fast Apply Process
</div>

<div class="feature-box">
✔ Resume Upload
</div>

<div class="feature-box">
✔ Career Support
</div>

</div>

</div>

</div>

</div>

<!-- JOBS -->

<div class="jobs" id="jobs">

<h2 data-aos="fade-up">

🔥 Available Jobs

</h2>

<div class="job-list">

<div class="job" data-aos="fade-up">
<h3>Java Developer</h3>
<p>Bangalore</p>
<button onclick="applyJob('Java Developer')">Apply</button>
</div>

<div class="job" data-aos="fade-up">
<h3>Frontend Developer</h3>
<p>Hyderabad</p>
<button onclick="applyJob('Frontend Developer')">Apply</button>
</div>

<div class="job" data-aos="fade-up">
<h3>Backend Developer</h3>
<p>Chennai</p>
<button onclick="applyJob('Backend Developer')">Apply</button>
</div>

<div class="job" data-aos="fade-up">
<h3>Data Analyst</h3>
<p>Pune</p>
<button onclick="applyJob('Data Analyst')">Apply</button>
</div>

<div class="job" data-aos="fade-up">
<h3>UI/UX Designer</h3>
<p>Remote</p>
<button onclick="applyJob('UI/UX Designer')">Apply</button>
</div>

<div class="job" data-aos="fade-up">
<h3>Android Developer</h3>
<p>Noida</p>
<button onclick="applyJob('Android Developer')">Apply</button>
</div>

</div>

</div>

<!-- SERVICES -->

<div class="services">

<h2 data-aos="zoom-in">

Our Services

</h2>

<div class="service-box" data-aos="zoom-in">
<i class="fas fa-briefcase fa-2x"></i>
<h4>Job Search</h4>
</div>

<div class="service-box" data-aos="zoom-in">
<i class="fas fa-file fa-2x"></i>
<h4>Resume Builder</h4>
</div>

<div class="service-box" data-aos="zoom-in">
<i class="fas fa-user fa-2x"></i>
<h4>Career Support</h4>
</div>

<div class="service-box" data-aos="zoom-in">
<i class="fas fa-building fa-2x"></i>
<h4>Company Hiring</h4>
</div>

</div>

<!-- CONTACT -->

<div class="contact" id="contact">

<h2>Contact Us</h2>

<input type="text" placeholder="Name"><br>

<input type="email" placeholder="Email"><br>

<textarea placeholder="Message"></textarea><br>

<button>Send</button>

</div>

<!-- APPLY POPUP -->

<div class="popup" id="popup">

<div class="popup-content">

<form action="apply"
method="post"
enctype="multipart/form-data">

<h3 id="jobTitle">Apply</h3>

<input type="hidden"
name="job"
id="jobHidden">

<input type="text"
name="qualification"
placeholder="Qualification"
required>

<p>Upload Resume</p>

<input type="file"
name="resume"
required>

<br><br>

<button type="submit">

Submit Application

</button>

<br><br>

<button type="button"
onclick="closePop()">

Cancel

</button>

</form>

</div>

</div>

<!-- FOOTER -->

<div class="footer">

<div class="footer-grid">

<div>

<h4>CareerLink</h4>

<p>

India's trusted job portal.

</p>

</div>

<div>

<h4>Company</h4>

<a href="#">About</a><br>
<a href="#">Careers</a>

</div>

<div>

<h4>Services</h4>

<a href="#">Jobs</a><br>
<a href="#">Support</a>

</div>

<div>

<h4>Follow</h4>

<i class="fab fa-facebook"></i>
<i class="fab fa-linkedin"></i>

</div>

</div>

<p style="margin-top:20px;text-align:center;">

© 2026 CareerLink

</p>

</div>

<!-- Scripts -->

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>

AOS.init({
duration:1000
});

function applyJob(job){

document.getElementById("jobTitle").innerText=
"Apply For "+job;

document.getElementById("jobHidden").value=
job;

document.getElementById("popup").style.display="flex";

}

function closePop(){

document.getElementById("popup").style.display="none";

}

</script>

</body>
</html>