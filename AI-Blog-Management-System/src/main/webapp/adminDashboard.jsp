<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("admin")==null){

    response.sendRedirect("adminLogin.jsp");
}

String success = request.getParameter("success");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    background:linear-gradient(135deg,#0f172a,#111827,#1e293b);
    overflow-x:hidden;
    color:white;
}

/* SIDEBAR */

.sidebar{
    width:260px;
    height:100vh;
    position:fixed;
    left:0;
    top:0;
    background:linear-gradient(180deg,#0f172a,#134e4a);
    padding-top:25px;
    z-index:1000;
    box-shadow:5px 0 20px rgba(0,0,0,0.3);
    border-right:1px solid rgba(255,255,255,0.08);
}

.sidebar h2{
    color:white;
    text-align:center;
    font-weight:bold;
    margin-bottom:40px;
    animation:fadeDown 1s ease;
}

.sidebar a{
    display:flex;
    align-items:center;
    gap:12px;
    color:#e2e8f0;
    text-decoration:none;
    padding:16px 30px;
    margin:10px 15px;
    border-radius:14px;
    transition:0.3s;
    font-size:17px;
}

.sidebar a:hover{
    background:rgba(20,184,166,0.18);
    transform:translateX(6px);
    color:white;
}

.sidebar a i{
    font-size:20px;
    color:#2dd4bf;
}

/* MAIN */

.main{
    margin-left:260px;
    padding:30px;
}

/* TOPBAR */

.topbar{
    background:rgba(17,24,39,0.88);
    backdrop-filter:blur(14px);
    border-radius:20px;
    padding:18px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 10px 25px rgba(0,0,0,0.25);
    border:1px solid rgba(255,255,255,0.08);
    animation:fadeDown 1s ease;
}

.admin-info{
    display:flex;
    align-items:center;
    gap:15px;
}

.admin-img{
    width:55px;
    height:55px;
    border-radius:50%;
    object-fit:cover;
    border:3px solid #14b8a6;
}

.topbar h4{
    color:white;
}

.logout-btn{
    background:linear-gradient(to right,#14b8a6,#0f766e);
    color:white;
    border:none;
    padding:10px 22px;
    border-radius:30px;
    transition:0.3s;
    font-weight:bold;
}

.logout-btn:hover{
    background:linear-gradient(to right,#2dd4bf,#115e59);
    transform:scale(1.05);
}

/* HERO */

.hero{
    margin-top:30px;
    background:linear-gradient(to right,#14b8a6,#0f766e);
    padding:45px;
    border-radius:28px;
    color:white;
    position:relative;
    overflow:hidden;
    animation:fadeUp 1s ease;
    box-shadow:0 15px 35px rgba(20,184,166,0.25);
}

.hero::before{
    content:'';
    position:absolute;
    width:300px;
    height:300px;
    background:rgba(255,255,255,0.08);
    border-radius:50%;
    top:-100px;
    right:-80px;
}

.hero h1{
    font-size:42px;
    font-weight:bold;
    position:relative;
    z-index:2;
}

.hero p{
    margin-top:12px;
    font-size:18px;
    position:relative;
    z-index:2;
    color:#e2e8f0;
}

/* STATS */

.stats{
    margin-top:35px;
}

.stat-card{
    background:rgba(17,24,39,0.88);
    border-radius:24px;
    padding:28px;
    box-shadow:0 10px 25px rgba(0,0,0,0.25);
    transition:0.4s;
    animation:fadeUp 1s ease;
    border:1px solid rgba(255,255,255,0.08);
}

.stat-card:hover{
    transform:translateY(-10px);
}

.stat-icon{
    width:65px;
    height:65px;
    border-radius:18px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:28px;
    color:white;
    margin-bottom:20px;
}

.bg-red{
    background:linear-gradient(to right,#ef4444,#dc2626);
}

.bg-dark{
    background:linear-gradient(to right,#334155,#0f172a);
}

.bg-blue{
    background:linear-gradient(to right,#3b82f6,#2563eb);
}

.bg-green{
    background:linear-gradient(to right,#14b8a6,#0f766e);
}

.stat-card h2{
    font-size:34px;
    font-weight:bold;
    color:white;
}

.stat-card p{
    color:#cbd5e1;
}

/* NOTICE BOX */

.notice-box{
    margin-top:35px;
    background:rgba(17,24,39,0.88);
    border-radius:24px;
    padding:30px;
    box-shadow:0 10px 25px rgba(0,0,0,0.25);
    animation:fadeUp 1s ease;
    border:1px solid rgba(255,255,255,0.08);
}

.notice-box h3{
    color:white;
}

.notice-box textarea{
    border-radius:15px;
    resize:none;
    border:1px solid rgba(255,255,255,0.08);
    background:#1e293b;
    color:white;
}

.notice-box textarea::placeholder{
    color:#94a3b8;
}

.notice-box textarea:focus{
    box-shadow:none;
    border:1px solid #14b8a6;
    background:#1e293b;
    color:white;
}

.send-btn{
    background:linear-gradient(to right,#14b8a6,#0f766e);
    color:white;
    border:none;
    padding:12px 30px;
    border-radius:30px;
    margin-top:15px;
    transition:0.3s;
    font-weight:bold;
}

.send-btn:hover{
    transform:scale(1.05);
    background:linear-gradient(to right,#2dd4bf,#115e59);
}

/* TABLE */

.activity-table{
    margin-top:35px;
    background:rgba(17,24,39,0.88);
    border-radius:24px;
    padding:30px;
    box-shadow:0 10px 25px rgba(0,0,0,0.25);
    animation:fadeUp 1s ease;
    border:1px solid rgba(255,255,255,0.08);
}

.activity-table h3{
    color:white;
}

.table{
    color:white;
}

.table thead{
    color:#2dd4bf;
}

.table-hover tbody tr:hover{
    background:rgba(255,255,255,0.05);
}

.text-muted{
    color:#cbd5e1 !important;
}

/* ANIMATIONS */

@keyframes fadeUp{

    from{
        opacity:0;
        transform:translateY(30px);
    }

    to{
        opacity:1;
        transform:translateY(0);
    }
}

@keyframes fadeDown{

    from{
        opacity:0;
        transform:translateY(-30px);
    }

    to{
        opacity:1;
        transform:translateY(0);
    }
}

/* MOBILE */

@media(max-width:992px){

    .sidebar{
        width:100%;
        height:auto;
        position:relative;
    }

    .main{
        margin-left:0;
    }
}

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

<h2>
<i class="fa-solid fa-user-shield"></i>
 Admin Panel
</h2>

<a href="#">
<i class="fa-solid fa-chart-line"></i>
Dashboard
</a>

<a href="viewBlogs.jsp">
<i class="fa-solid fa-blog"></i>
Manage Blogs
</a>

<a href="addBlog.jsp">
<i class="fa-solid fa-pen"></i>
Publish Blogs
</a>

<a href="#">
<i class="fa-solid fa-users"></i>
Users
</a>

<a href="#">
<i class="fa-solid fa-bell"></i>
Notifications
</a>

<a href="logout">
<i class="fa-solid fa-right-from-bracket"></i>
Logout
</a>

</div>

<!-- MAIN -->

<div class="main">

<!-- TOPBAR -->

<div class="topbar">

<div class="admin-info">

<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
class="admin-img">

<div>
<h4 class="mb-0 fw-bold">Welcome Admin</h4>
<small class="text-muted">
Manage your platform professionally
</small>
</div>

</div>

<a href="logout">
<button class="logout-btn">
Logout
</button>
</a>

</div>

<!-- HERO -->

<div class="hero">

<h1>Professional Admin Dashboard</h1>

<p>
Monitor users, publish blogs, manage notifications
and track website activity professionally.
</p>

</div>

<!-- SUCCESS MESSAGE -->

<%
if(success != null){
%>

<div class="alert alert-success alert-dismissible fade show mt-4">

Notification Sent Successfully!

<button type="button"
class="btn-close"
data-bs-dismiss="alert"></button>

</div>

<%
}
%>

<!-- STATS -->

<div class="row stats g-4">

<div class="col-lg-3 col-md-6">

<div class="stat-card">

<div class="stat-icon bg-red">
<i class="fa-solid fa-users"></i>
</div>

<h2>150</h2>

<p>Total Registered Users</p>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="stat-card">

<div class="stat-icon bg-dark">
<i class="fa-solid fa-blog"></i>
</div>

<h2>3</h2>

<p>Total Blogs Published</p>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="stat-card">

<div class="stat-icon bg-blue">
<i class="fa-solid fa-eye"></i>
</div>

<h2>1.0K</h2>

<p>Website Visitors</p>

</div>

</div>

<div class="col-lg-3 col-md-6">

<div class="stat-card">

<div class="stat-icon bg-green">
<i class="fa-solid fa-bell"></i>
</div>

<h2>12</h2>

<p>Notifications Sent</p>

</div>

</div>

</div>

<!-- NOTIFICATION -->

<div class="notice-box">

<h3 class="fw-bold mb-3">
<i class="fa-solid fa-paper-plane"></i>
 Send Notification Message
</h3>

<form action="sendNotification" method="post">

<textarea
class="form-control p-3"
rows="5"
name="message"
placeholder="Write notification message for users..."
required></textarea>

<button type="submit" class="send-btn">
Send Notification
</button>

</form>

</div>

<!-- TABLE -->

<div class="activity-table">

<h3 class="fw-bold mb-4">
<i class="fa-solid fa-chart-column"></i>
 Website Activity
</h3>

<table class="table table-hover align-middle">

<thead>

<tr>

<th>User</th>
<th>Status</th>
<th>Activity</th>
<th>Date</th>

</tr>

</thead>

<tbody>

<tr>
<td>Mohan</td>
<td><span class="badge bg-success">Active</span></td>
<td>Published a new blog</td>
<td>07 May 2026</td>
</tr>

<tr>
<td>Rahul</td>
<td><span class="badge bg-primary">Online</span></td>
<td>Registered account</td>
<td>07 May 2026</td>
</tr>

<tr>
<td>Keerthi</td>
<td><span class="badge bg-warning text-dark">Pending</span></td>
<td>Commented on a blog</td>
<td>06 May 2026</td>
</tr>

<tr>
<td>Sai</td>
<td><span class="badge bg-danger">Offline</span></td>
<td>Logged out</td>
<td>06 May 2026</td>
</tr>

</tbody>

</table>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>