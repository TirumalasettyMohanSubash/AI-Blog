<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("user")==null){

    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>User Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:linear-gradient(135deg,#111827,#0f172a,#1e293b);
    min-height:100vh;
    overflow-x:hidden;
    color:white;
}

/* NAVBAR */

.navbar{
    background:rgba(15,23,42,0.95);
    backdrop-filter:blur(10px);
    padding:15px 0;
    border-bottom:1px solid rgba(255,255,255,0.08);
}

.navbar-brand{
    font-size:32px;
    font-weight:bold;
    color:white !important;
}

.nav-btn{
    border:none;
    padding:10px 22px;
    border-radius:30px;
    font-weight:600;
    transition:0.3s;
}

.blog-btn{
    background:linear-gradient(to right,#22c55e,#16a34a);
    color:white;
}

.blog-btn:hover{
    transform:translateY(-2px);
    background:linear-gradient(to right,#4ade80,#15803d);
}

.logout-btn{
    background:linear-gradient(to right,#ef4444,#dc2626);
    color:white;
}

.logout-btn:hover{
    transform:translateY(-2px);
    background:linear-gradient(to right,#f87171,#b91c1c);
}

/* HERO SECTION */

.hero-section{
    padding:80px 20px 50px;
    text-align:center;
    position:relative;
    overflow:hidden;
}

.hero-section::before{
    content:'';
    position:absolute;
    width:500px;
    height:500px;
    background:rgba(255,255,255,0.04);
    border-radius:50%;
    top:-200px;
    left:-150px;
    animation:float1 6s ease-in-out infinite;
}

.hero-section::after{
    content:'';
    position:absolute;
    width:400px;
    height:400px;
    background:rgba(255,255,255,0.03);
    border-radius:50%;
    bottom:-150px;
    right:-100px;
    animation:float2 7s ease-in-out infinite;
}

.hero-content{
    position:relative;
    z-index:2;
    animation:fadeUp 1s ease;
}

.hero-title{
    font-size:56px;
    font-weight:bold;
    margin-bottom:20px;
}

.hero-subtitle{
    font-size:20px;
    color:#cbd5e1;
    max-width:750px;
    margin:auto;
    line-height:1.8;
}

/* STATS */

.stats-section{
    margin-top:30px;
}

.stats-card{
    background:rgba(255,255,255,0.08);
    border:1px solid rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:25px;
    padding:30px;
    text-align:center;
    transition:0.4s;
    animation:fadeUp 1s ease;
}

.stats-card:hover{
    transform:translateY(-10px);
    box-shadow:0 15px 30px rgba(0,0,0,0.3);
}

.stats-icon{
    width:80px;
    height:80px;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    margin:auto auto 20px;
    font-size:32px;
    color:white;
}

.bg-green{
    background:linear-gradient(to right,#22c55e,#16a34a);
}

.bg-blue{
    background:linear-gradient(to right,#3b82f6,#2563eb);
}

.bg-purple{
    background:linear-gradient(to right,#8b5cf6,#7c3aed);
}

.stats-card h2{
    font-size:40px;
    font-weight:bold;
}

.stats-card p{
    color:#cbd5e1;
    margin-top:8px;
}

/* ACTION CARDS */

.action-section{
    margin-top:60px;
    margin-bottom:60px;
}

.action-card{
    background:rgba(255,255,255,0.08);
    border:1px solid rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:28px;
    padding:45px;
    text-align:center;
    transition:0.4s;
    animation:fadeUp 1s ease;
    height:100%;
}

.action-card:hover{
    transform:translateY(-10px);
    box-shadow:0 15px 35px rgba(0,0,0,0.35);
}

.action-icon{
    width:90px;
    height:90px;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    margin:auto auto 25px;
    font-size:36px;
    color:white;
}

.action-card h2{
    font-size:34px;
    font-weight:bold;
    margin-bottom:15px;
}

.action-card p{
    color:#cbd5e1;
    line-height:1.7;
}

.action-btn{
    margin-top:25px;
    border:none;
    border-radius:35px;
    padding:13px 30px;
    color:white;
    font-weight:bold;
    transition:0.3s;
}

.action-btn:hover{
    transform:scale(1.05);
}

/* FOOTER */

.footer{
    text-align:center;
    color:#94a3b8;
    padding:20px;
    border-top:1px solid rgba(255,255,255,0.08);
}

/* ANIMATIONS */

@keyframes fadeUp{

    from{
        opacity:0;
        transform:translateY(40px);
    }

    to{
        opacity:1;
        transform:translateY(0);
    }
}

@keyframes float1{

    0%{
        transform:translateY(0px);
    }

    50%{
        transform:translateY(20px);
    }

    100%{
        transform:translateY(0px);
    }
}

@keyframes float2{

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

/* MOBILE */

@media(max-width:768px){

    .hero-title{
        font-size:38px;
    }

    .hero-subtitle{
        font-size:17px;
    }

    .action-card{
        padding:35px 25px;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark shadow">

<div class="container">

<a class="navbar-brand" href="#">
BlogSphere
</a>

<div class="d-flex gap-3">

<a href="viewBlogs.jsp"
class="btn nav-btn blog-btn">

<i class="fa-solid fa-book-open"></i>

 View Blogs

</a>

<a href="logout"
class="btn nav-btn logout-btn">

<i class="fa-solid fa-right-from-bracket"></i>

 Logout

</a>

</div>

</div>

</nav>

<!-- HERO SECTION -->

<section class="hero-section">

<div class="hero-content container">

<h1 class="hero-title">
Welcome to Your Dashboard
</h1>

<p class="hero-subtitle">

Create engaging blogs, manage your content professionally,
and share your ideas with the world through a modern blogging platform.

</p>

</div>

</section>

<!-- STATS -->

<div class="container stats-section">

<div class="row g-4">

<div class="col-md-4">

<div class="stats-card">

<div class="stats-icon bg-green">

<i class="fa-solid fa-blog"></i>

</div>

<h2>3</h2>

<p>Total Blogs Published</p>

</div>

</div>

<div class="col-md-4">

<div class="stats-card">

<div class="stats-icon bg-blue">

<i class="fa-solid fa-eye"></i>

</div>

<h2>1.0K</h2>

<p>Total Blog Views</p>

</div>

</div>

<div class="col-md-4">

<div class="stats-card">

<div class="stats-icon bg-purple">

<i class="fa-solid fa-users"></i>

</div>

<h2>50</h2>

<p>Community Members</p>

</div>

</div>

</div>

</div>

<!-- ACTION CARDS -->

<div class="container action-section">

<div class="row g-4">

<div class="col-md-6">

<div class="action-card">

<div class="action-icon bg-blue">

<i class="fa-solid fa-pen-nib"></i>

</div>

<h2>Create Blogs</h2>

<p>

Write and publish professional blogs easily using
our modern content publishing system.

</p>

<a href="addBlog.jsp"
class="btn action-btn bg-blue">

Add New Blog

</a>

</div>

</div>

<div class="col-md-6">

<div class="action-card">

<div class="action-icon bg-green">

<i class="fa-solid fa-layer-group"></i>

</div>

<h2>Manage Blogs</h2>

<p>

View, update, and manage all your published blogs
professionally from one place.

</p>

<a href="viewBlogs.jsp"
class="btn action-btn bg-green">

View Blogs

</a>

</div>

</div>

</div>

</div>

<!-- FOOTER -->

<div class="footer">

© 2026 BlogSphere | Professional Blogging Platform

</div>

</body>
</html>