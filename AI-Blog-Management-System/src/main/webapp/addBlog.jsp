<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

String dashboardLink = "login.jsp";

if(session.getAttribute("admin") != null){

    dashboardLink = "adminDashboard.jsp";

}
else if(session.getAttribute("user") != null){

    dashboardLink = "dashboard.jsp";

}
else{

    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add Blog</title>

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
    font-weight:bold;
    transition:0.3s;
}

.dashboard-btn{
    background:linear-gradient(to right,#14b8a6,#0f766e);
    color:white;
}

.dashboard-btn:hover{
    transform:translateY(-2px);
    background:linear-gradient(to right,#2dd4bf,#115e59);
}

.logout-btn{
    background:linear-gradient(to right,#ef4444,#dc2626);
    color:white;
}

.logout-btn:hover{
    transform:translateY(-2px);
    background:linear-gradient(to right,#f87171,#b91c1c);
}

/* HERO */

.hero{
    text-align:center;
    padding:60px 20px 20px;
    position:relative;
    overflow:hidden;
}

.hero::before{
    content:'';
    position:absolute;
    width:450px;
    height:450px;
    background:rgba(255,255,255,0.04);
    border-radius:50%;
    top:-220px;
    left:-150px;
    animation:float1 6s ease-in-out infinite;
}

.hero::after{
    content:'';
    position:absolute;
    width:350px;
    height:350px;
    background:rgba(255,255,255,0.03);
    border-radius:50%;
    bottom:-180px;
    right:-120px;
    animation:float2 7s ease-in-out infinite;
}

.hero-content{
    position:relative;
    z-index:2;
    animation:fadeUp 1s ease;
}

.hero-title{
    font-size:55px;
    font-weight:bold;
}

.hero-subtitle{
    margin-top:15px;
    color:#cbd5e1;
    font-size:20px;
}

/* FORM CARD */

.blog-card{
    background:rgba(17,24,39,0.88);
    backdrop-filter:blur(14px);
    border:1px solid rgba(255,255,255,0.08);
    border-radius:30px;
    padding:45px;
    box-shadow:0 15px 35px rgba(0,0,0,0.35);
    animation:fadeUp 1s ease;
}

/* TITLE */

.form-title{
    text-align:center;
    font-size:38px;
    font-weight:bold;
    margin-bottom:35px;
    color:white;
}

/* LABEL */

.form-label{
    color:white;
    font-weight:600;
    margin-bottom:10px;
}

/* INPUT GROUP */

.input-group{
    background:rgba(255,255,255,0.05);
    border-radius:15px;
    overflow:hidden;
    border:1px solid rgba(255,255,255,0.08);
    margin-bottom:25px;
    transition:0.3s;
}

.input-group:hover{
    border-color:#14b8a6;
    box-shadow:0 0 15px rgba(20,184,166,0.18);
}

.input-group-text{
    background:transparent;
    border:none;
    color:#cbd5e1;
    padding-left:18px;
}

.form-control{
    background:transparent;
    border:none;
    color:white;
    padding:14px;
}

.form-control:focus{
    background:transparent;
    color:white;
    box-shadow:none;
}

.form-control::placeholder{
    color:#94a3b8;
}

textarea{
    resize:none;
}

/* BUTTON */

.publish-btn{
    width:100%;
    border:none;
    border-radius:40px;
    padding:14px;
    font-size:18px;
    font-weight:bold;
    color:white;
    background:linear-gradient(to right,#14b8a6,#0f766e);
    transition:0.4s;
    box-shadow:0 10px 20px rgba(20,184,166,0.25);
}

.publish-btn:hover{
    transform:translateY(-3px) scale(1.02);
    background:linear-gradient(to right,#2dd4bf,#115e59);
}

/* FOOTER */

.footer{
    text-align:center;
    color:#94a3b8;
    padding:25px;
    margin-top:40px;
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
        font-size:40px;
    }

    .hero-subtitle{
        font-size:17px;
    }

    .blog-card{
        padding:30px 25px;
    }

    .form-title{
        font-size:30px;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark shadow">

<div class="container">

<a class="navbar-brand">
<i class="fa-solid fa-blog"></i>

 BlogSphere
</a>

<div class="d-flex gap-3">

<a href="<%= dashboardLink %>"
class="btn nav-btn dashboard-btn">

<i class="fa-solid fa-chart-line"></i>

 Dashboard

</a>

<a href="logout"
class="btn nav-btn logout-btn">

<i class="fa-solid fa-right-from-bracket"></i>

 Logout

</a>

</div>

</div>

</nav>

<!-- HERO -->

<section class="hero">

<div class="hero-content">

<h1 class="hero-title">
Create Amazing Blogs
</h1>

<p class="hero-subtitle">

Share your thoughts, ideas, tutorials,
and stories professionally with the world.

</p>

</div>

</section>

<!-- FORM -->

<div class="container pb-5">

<div class="row justify-content-center">

<div class="col-lg-8">

<div class="blog-card">

<h2 class="form-title">

<i class="fa-solid fa-pen-nib"></i>

 Create New Blog

</h2>

<form action="addBlog" method="post">

<label class="form-label">
Blog Title
</label>

<div class="input-group">

<span class="input-group-text">
<i class="fa-solid fa-heading"></i>
</span>

<input type="text"
name="title"
class="form-control"
placeholder="Enter blog title"
required>

</div>

<label class="form-label">
Blog Content
</label>

<div class="input-group">

<span class="input-group-text">
<i class="fa-solid fa-align-left"></i>
</span>

<textarea
name="content"
rows="6"
class="form-control"
placeholder="Write your blog content..."
required></textarea>

</div>

<label class="form-label">
Author Name
</label>

<div class="input-group">

<span class="input-group-text">
<i class="fa-solid fa-user"></i>
</span>

<input type="text"
name="author"
class="form-control"
placeholder="Enter author name"
required>

</div>

<button class="publish-btn">

<i class="fa-solid fa-paper-plane"></i>

 Publish Blog

</button>

</form>

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