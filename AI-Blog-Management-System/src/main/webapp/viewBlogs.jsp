<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.BlogDAO" %>
<%@ page import="model.Blog" %>

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

<title>View Blogs</title>

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
    font-size:34px;
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
    background:linear-gradient(to right,#22c55e,#16a34a);
    color:white;
}

.dashboard-btn:hover{
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

/* HERO */

.hero-section{
    text-align:center;
    padding:70px 20px 40px;
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
    top:-220px;
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
    font-size:58px;
    font-weight:bold;
}

.hero-subtitle{
    margin-top:15px;
    font-size:20px;
    color:#cbd5e1;
}

/* BLOG CARD */

.blog-card{
    background:rgba(30,41,59,0.95);
    border:1px solid rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:30px;
    overflow:hidden;
    transition:0.4s;
    animation:fadeUp 1s ease;
}

.blog-card:hover{
    transform:translateY(-10px);
    box-shadow:0 15px 35px rgba(0,0,0,0.35);
}

/* CARD HEADER */

.card-header-custom{
    background:linear-gradient(to right,#22c55e,#16a34a);
    padding:18px 30px;
    color:white;
    font-size:18px;
    font-weight:bold;
}

/* CARD BODY */

.card-body{
    padding:40px;
    background:#1e293b;
}

.blog-title{
    font-size:38px;
    font-weight:bold;
    margin-bottom:20px;
    color:white;
    line-height:1.4;
}

.blog-content{
    font-size:18px;
    line-height:1.9;
    color:#d1d5db;
}

.author-box{
    margin-top:30px;
    padding:15px 20px;
    background:rgba(255,255,255,0.05);
    border-radius:18px;
    display:inline-block;
    color:#cbd5e1;
}

.author-box i{
    color:#22c55e;
}

/* DELETE BUTTON */

.delete-btn{
    margin-top:30px;
    border:none;
    border-radius:35px;
    padding:12px 28px;
    background:linear-gradient(to right,#ef4444,#dc2626);
    color:white;
    font-weight:bold;
    transition:0.3s;
}

.delete-btn:hover{
    transform:scale(1.05);
    background:linear-gradient(to right,#f87171,#b91c1c);
}

/* EMPTY BLOG */

.empty-box{
    text-align:center;
    margin-top:80px;
    animation:fadeUp 1s ease;
}

.empty-box i{
    font-size:90px;
    color:#475569;
    margin-bottom:20px;
}

.empty-box h2{
    font-size:40px;
    font-weight:bold;
}

.empty-box p{
    color:#94a3b8;
    margin-top:10px;
}

/* FOOTER */

.footer{
    text-align:center;
    color:#94a3b8;
    padding:30px 20px;
    margin-top:40px;
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
        font-size:40px;
    }

    .hero-subtitle{
        font-size:17px;
    }

    .blog-title{
        font-size:30px;
    }

    .card-body{
        padding:30px 25px;
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

<section class="hero-section">

<div class="hero-content container">

<h1 class="hero-title">
Explore Amazing Blogs
</h1>

<p class="hero-subtitle">

Read inspiring stories, ideas, tutorials,
and professional content shared by our community.

</p>

</div>

</section>

<!-- BLOGS -->

<div class="container pb-5">

<%

BlogDAO dao = new BlogDAO();

ArrayList<Blog> list = dao.getAllBlogs();

if(list.size() == 0){

%>

<div class="empty-box">

<i class="fa-regular fa-folder-open"></i>

<h2>No Blogs Available</h2>

<p>
Start publishing blogs to see them here.
</p>

</div>

<%
}
else{

for(Blog b : list){

%>

<div class="card blog-card shadow-lg mb-5">

<div class="card-header-custom">

<i class="fa-solid fa-fire"></i>

 Trending Blog

</div>

<div class="card-body">

<h1 class="blog-title">
<%= b.getTitle() %>
</h1>

<p class="blog-content">
<%= b.getContent() %>
</p>

<div class="author-box">

<i class="fa-solid fa-user"></i>

 Author :
 <%= b.getAuthor() %>

</div>

<%

if(session.getAttribute("admin") != null){

%>

<br>

<a href="deleteBlog?id=<%= b.getId() %>"
class="btn delete-btn">

<i class="fa-solid fa-trash"></i>

 Delete Blog

</a>

<%
}
%>

</div>

</div>

<%
}
}
%>

</div>

<!-- FOOTER -->

<div class="footer">

© 2026 BlogSphere | Professional Blogging Platform

</div>

</body>
</html>