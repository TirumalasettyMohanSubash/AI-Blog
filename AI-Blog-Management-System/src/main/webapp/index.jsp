<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BlogSphere</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

html{
    scroll-behavior:smooth;
}

body{
    background:#0f172a;
    overflow-x:hidden;
    color:white;
}

/* NAVBAR */

.navbar{
    background:#020617;
    padding:15px 0;
}

.navbar-brand{
    font-size:40px;
    font-weight:700;
    color:white !important;
}

.logo-img{
    border-radius:50%;
    object-fit:cover;
    border:2px solid #38bdf8;
    transition:0.4s;
    box-shadow:0 0 20px rgba(56,189,248,0.5);
}

.logo-img:hover{
    transform:rotate(10deg) scale(1.08);
}

.nav-link{
    color:white !important;
    margin-right:20px;
    font-size:18px;
    transition:0.3s;
}

.nav-link:hover{
    color:#38bdf8 !important;
}

/* HERO SECTION */

.hero{
    min-height:100vh;
    background:linear-gradient(to right,#020617,#1e293b);
    display:flex;
    align-items:center;
    overflow:hidden;
    position:relative;
}

.hero::before{
    content:'';
    position:absolute;
    width:500px;
    height:500px;
    background:#38bdf8;
    filter:blur(180px);
    opacity:0.15;
    top:-100px;
    right:-100px;
}

.hero-left h1{
    font-size:78px;
    font-weight:800;
    line-height:1.2;
    animation:slideLeft 1s ease;
}

.hero-left span{
    color:#38bdf8;
}

.hero-left p{
    margin-top:25px;
    font-size:22px;
    color:#cbd5e1;
    line-height:1.8;
    animation:fadeIn 2s ease;
}

.btn-custom{
    padding:14px 35px;
    border-radius:40px;
    font-size:18px;
    font-weight:600;
    transition:0.3s;
}

.btn-custom:hover{
    transform:scale(1.05);
}

.hero-img{
    height:700px;
    width:100%;
    max-width:600px;
    animation:floatImage 4s ease-in-out infinite;
}

/* ABOUT */

.about{
    padding:100px 0;
    background:#0f172a;
}

.about h2{
    font-size:55px;
    font-weight:700;
}

.about p{
    margin-top:25px;
    font-size:20px;
    line-height:1.9;
    color:#d1d5db;
}

/* FEATURES */

.features{
    padding:100px 0;
    background:#111827;
}

.feature-card{
    background:#1e293b;
    border-radius:25px;
    padding:40px;
    transition:0.3s;
    height:100%;
}

.feature-card:hover{
    transform:translateY(-10px);
}

.feature-card h3{
    margin-top:20px;
    font-weight:700;
}

.feature-card p{
    color:#cbd5e1;
    margin-top:15px;
}

/* CONTACT */

.contact{
    padding:100px 0;
    background:#1e293b;
}

.contact-card{
    background:white;
    color:black;
    border-radius:25px;
    padding:40px;
    transition:0.3s;
    height:100%;
}

.contact-card:hover{
    transform:translateY(-10px);
}

.icon-box{
    width:80px;
    height:80px;
    background:#38bdf8;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    margin:auto;
    font-size:35px;
    color:white;
}

/* FOOTER */

.footer{
    background:#020617;
    padding:60px 0 20px;
    color:white;
}

.footer-link{
    text-decoration:none;
    color:#cbd5e1;
    transition:0.3s;
}

.footer-link:hover{
    color:#38bdf8;
}

.social-icon{
    font-size:30px;
    margin-right:15px;
    text-decoration:none;
}

/* ANIMATIONS */

@keyframes floatImage{

    0%{
        transform:translateY(0px);
    }

    50%{
        transform:translateY(-20px);
    }

    100%{
        transform:translateY(0px);
    }
}

@keyframes slideLeft{

    from{
        opacity:0;
        transform:translateX(-80px);
    }

    to{
        opacity:1;
        transform:translateX(0px);
    }
}

@keyframes fadeIn{

    from{
        opacity:0;
    }

    to{
        opacity:1;
    }
}

/* RESPONSIVE */

@media(max-width:768px){

.hero{
    text-align:center;
    padding:80px 0;
}

.hero-left h1{
    font-size:48px;
}

.hero-left p{
    font-size:18px;
}

.hero-img{
    margin-top:50px;
}

.about h2{
    font-size:40px;
}

}

</style>

</head>
<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark sticky-top shadow">

<div class="container">

<a class="navbar-brand d-flex align-items-center" href="#home">

<img src="images/Ai.jpg"
alt="Logo"
width="60"
height="60"
class="logo-img me-3">

<span>
BlogSphere
</span>

</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse" id="navbarNav">

<ul class="navbar-nav ms-auto align-items-center">

<li class="nav-item">
<a class="nav-link" href="#home">Home</a>
</li>

<li class="nav-item">
<a class="nav-link" href="#about">About</a>
</li>

<li class="nav-item">
<a class="nav-link" href="#features">Features</a>
</li>

<li class="nav-item">
<a class="nav-link" href="#contact">Contact</a>
</li>

<li class="nav-item">

<a href="login.jsp"
class="btn btn-outline-light me-2">

User Login

</a>

</li>

<li class="nav-item">

<a href="register.jsp"
class="btn btn-info text-dark fw-bold me-2">

Register

</a>

</li>

<li class="nav-item">

<a href="adminLogin.jsp"
class="btn btn-danger fw-bold">

Admin

</a>

</li>

</ul>

</div>

</div>

</nav>

<!-- HERO -->

<section class="hero" id="home">

<div class="container">

<div class="row align-items-center">

<div class="col-md-6 hero-left">

<h1>

Share Your <span>Ideas</span> <br>
With The World

</h1>

<p>

Create professional blogs and inspire millions of readers worldwide.
Build your personal brand with BlogSphere.

</p>

<a href="register.jsp"
class="btn btn-info text-dark btn-custom mt-4">

Get Started

</a>

</div>

<div class="col-md-6 text-center">

<img src="images/robot.png"
class="hero-img"
alt="Robot Image">

</div>

</div>

</div>

</section>

<!-- ABOUT -->

<section class="about" id="about">

<div class="container text-center">

<h2>About BlogSphere</h2>

<p>

BlogSphere is a modern blogging platform developed using
Java, JSP, Servlets, JDBC, Bootstrap, and MySQL.

Users can publish blogs, share knowledge, and explore articles,
while admins manage the platform professionally.

</p>

</div>

</section>

<!-- FEATURES -->

<section class="features" id="features">

<div class="container">

<div class="text-center mb-5">

<h2 class="fw-bold display-5">
Platform Features
</h2>

</div>

<div class="row g-4">

<div class="col-md-4">

<div class="feature-card shadow-lg text-center">

<h3>Create Blogs</h3>

<p>
Users can create and publish professional blog posts easily.
</p>

</div>

</div>

<div class="col-md-4">

<div class="feature-card shadow-lg text-center">

<h3>Admin Management</h3>

<p>
Admin can manage blogs and monitor the complete platform.
</p>

</div>

</div>

<div class="col-md-4">

<div class="feature-card shadow-lg text-center">

<h3>Secure Login</h3>

<p>
Protected authentication with session handling.
</p>

</div>

</div>

</div>

</div>

</section>

<!-- CONTACT -->

<section class="contact" id="contact">

<div class="container">

<div class="text-center mb-5">

<h2 class="fw-bold display-4">
Contact Us
</h2>

<p class="text-light fs-5 mt-3">
We would love to hear from you.
Feel free to connect with BlogSphere anytime.
</p>

</div>

<div class="row g-4">

<div class="col-md-4">

<div class="contact-card shadow-lg text-center">

<div class="icon-box mb-4">
📧
</div>

<h3>Email</h3>

<p class="mt-3">
blogsphere@gmail.com
</p>

</div>

</div>

<div class="col-md-4">

<div class="contact-card shadow-lg text-center">

<div class="icon-box mb-4">
📞
</div>

<h3>Phone</h3>

<p class="mt-3">
+91 9876543210
</p>

</div>

</div>

<div class="col-md-4">

<div class="contact-card shadow-lg text-center">

<div class="icon-box mb-4">
📍
</div>

<h3>Location</h3>

<p class="mt-3">
Hyderabad, India
</p>

</div>

</div>

</div>

</div>

</section>

<!-- FOOTER -->

<footer class="footer">

<div class="container">

<div class="row">

<div class="col-md-4 mb-4">

<h2 class="fw-bold text-info">
BlogSphere
</h2>

<p class="mt-3 text-light">

A modern blogging platform developed using
Java Full Stack Technologies.

</p>

</div>

<div class="col-md-4 mb-4">

<h4 class="fw-bold">
Quick Links
</h4>

<ul class="list-unstyled mt-3">

<li class="mb-2">
<a href="#home" class="footer-link">
Home
</a>
</li>

<li class="mb-2">
<a href="#about" class="footer-link">
About
</a>
</li>

<li class="mb-2">
<a href="#features" class="footer-link">
Features
</a>
</li>

<li class="mb-2">
<a href="#contact" class="footer-link">
Contact
</a>
</li>

</ul>

</div>

<div class="col-md-4 mb-4">

<h4 class="fw-bold">
Follow Us
</h4>

<div class="mt-3">

<a href="#" class="social-icon">
🌐
</a>

<a href="#" class="social-icon">
📘
</a>

<a href="#" class="social-icon">
📸
</a>

<a href="#" class="social-icon">
💼
</a>

</div>

</div>

</div>

<hr class="border-secondary">

<p class="text-center mt-4 mb-0">

© 2026 BlogSphere | All Rights Reserved

</p>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<%@page import="java.sql.*"%>
<%@page import="db.DBConnection"%>

<%

try{

Connection con = DBConnection.getConnection();

String query =
"SELECT * FROM notifications ORDER BY id DESC LIMIT 1";

PreparedStatement ps =
con.prepareStatement(query);

ResultSet rs = ps.executeQuery();

if(rs.next()){

String msg = rs.getString("message");

%>

<script>

alert("Admin Notification: <%= msg %>");

</script>

<%
}

}catch(Exception e){

e.printStackTrace();
}
%>
</body>
</html>