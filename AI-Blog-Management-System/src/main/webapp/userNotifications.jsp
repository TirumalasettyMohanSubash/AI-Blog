<%@page import="java.sql.*"%>
<%@page import="db.DBConnection"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>User Notifications</title>

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
    background:#f1f5f9;
    min-height:100vh;
}

/* NAVBAR */

.navbar{
    background:linear-gradient(to right,#111827,#7f1d1d);
    padding:15px 0;
}

.navbar-brand{
    font-size:28px;
    font-weight:bold;
}

.nav-link{
    color:white !important;
    font-size:16px;
    margin-right:10px;
    transition:0.3s;
}

.nav-link:hover{
    color:#fca5a5 !important;
}

.notification-btn{
    background:#dc2626;
    color:white;
    border:none;
    border-radius:30px;
    padding:10px 22px;
    font-weight:600;
    transition:0.3s;
    position:relative;
    text-decoration:none;
}

.notification-btn:hover{
    background:#991b1b;
    transform:scale(1.05);
    color:white;
}

.notification-badge{
    position:absolute;
    top:-8px;
    right:-8px;
    background:#facc15;
    color:black;
    font-size:11px;
    padding:5px 8px;
    border-radius:50%;
    font-weight:bold;
}

/* MAIN CONTAINER */

.notification-box{
    max-width:900px;
    margin:50px auto;
    background:white;
    padding:35px;
    border-radius:25px;
    box-shadow:0 15px 35px rgba(0,0,0,0.1);
    animation:fadeUp 0.8s ease;
}

/* TITLE */

.page-title{
    display:flex;
    align-items:center;
    gap:15px;
    margin-bottom:35px;
}

.page-title i{
    background:#7f1d1d;
    color:white;
    width:60px;
    height:60px;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:24px;
}

.page-title h2{
    font-weight:bold;
    color:#7f1d1d;
    margin:0;
}

/* NOTIFICATION CARD */

.notification-card{
    background:linear-gradient(to right,#7f1d1d,#991b1b);
    color:white;
    padding:25px;
    border-radius:18px;
    margin-bottom:25px;
    position:relative;
    overflow:hidden;
    transition:0.4s;
    animation:fadeCard 0.5s ease;
}

.notification-card:hover{
    transform:translateY(-5px);
}

.notification-card::before{
    content:'';
    position:absolute;
    width:180px;
    height:180px;
    background:rgba(255,255,255,0.08);
    border-radius:50%;
    top:-70px;
    right:-60px;
}

.notification-message{
    font-size:18px;
    font-weight:500;
    position:relative;
    z-index:2;
}

.notification-time{
    font-size:13px;
    opacity:0.85;
    margin-top:15px;
    position:relative;
    z-index:2;
}

/* EMPTY */

.empty-box{
    text-align:center;
    padding:50px 20px;
}

.empty-box i{
    font-size:70px;
    color:#cbd5e1;
    margin-bottom:20px;
}

.empty-box h4{
    color:#64748b;
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

@keyframes fadeCard{

    from{
        opacity:0;
        transform:scale(0.95);
    }

    to{
        opacity:1;
        transform:scale(1);
    }
}

/* MOBILE */

@media(max-width:768px){

    .notification-box{
        margin:20px;
        padding:25px;
    }

    .page-title{
        flex-direction:column;
        text-align:center;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark shadow">

<div class="container">

<a class="navbar-brand text-white" href="#">
Blog Website
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
<a class="nav-link" href="index.jsp">Home</a>
</li>

<li class="nav-item">
<a class="nav-link" href="blogs.jsp">Blogs</a>
</li>

<li class="nav-item">
<a class="nav-link" href="about.jsp">About</a>
</li>

<li class="nav-item ms-3">

<a href="userNotifications.jsp"
class="notification-btn">

<i class="fa-solid fa-bell"></i>
 Notifications

<span class="notification-badge">
New
</span>

</a>

</li>

</ul>

</div>

</div>

</nav>

<!-- MAIN CONTENT -->

<div class="notification-box">

<div class="page-title">

<i class="fa-solid fa-bell"></i>

<div>

<h2>
Admin Notifications
</h2>

<p class="text-muted">
Latest announcements and updates from admin
</p>

</div>

</div>

<%

boolean hasNotification = false;

try{

    Connection con = DBConnection.getConnection();

    String query =
    "SELECT * FROM notifications ORDER BY id DESC";

    PreparedStatement ps =
    con.prepareStatement(query);

    ResultSet rs = ps.executeQuery();

    while(rs.next()){

    hasNotification = true;

%>

<div class="notification-card">

<div class="notification-message">

<i class="fa-solid fa-paper-plane me-2"></i>

<%= rs.getString("message") %>

</div>

<div class="notification-time">

<i class="fa-regular fa-clock me-1"></i>

<%= rs.getTimestamp("created_at") %>

</div>

</div>

<%
    }

    if(!hasNotification){
%>

<div class="empty-box">

<i class="fa-regular fa-bell-slash"></i>

<h4>No Notifications Available</h4>

<p class="text-muted">
Admin notifications will appear here.
</p>

</div>

<%
    }

}catch(Exception e){

    e.printStackTrace();
}
%>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>