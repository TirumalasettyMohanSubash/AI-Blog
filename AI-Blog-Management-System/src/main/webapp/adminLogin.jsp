<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

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
    height:100vh;
    overflow:hidden;
    background:linear-gradient(135deg,#0f172a,#111827,#134e4a);
    display:flex;
    justify-content:center;
    align-items:center;
    position:relative;
}

/* Animated Background */

body::before{
    content:'';
    position:absolute;
    width:500px;
    height:500px;
    background:rgba(255,255,255,0.05);
    border-radius:50%;
    top:-120px;
    left:-120px;
    animation:float 6s ease-in-out infinite;
}

body::after{
    content:'';
    position:absolute;
    width:400px;
    height:400px;
    background:rgba(255,255,255,0.04);
    border-radius:50%;
    bottom:-120px;
    right:-100px;
    animation:float2 7s ease-in-out infinite;
}

/* Login Card */

.login-card{
    width:100%;
    max-width:430px;
    background:rgba(17,24,39,0.88);
    backdrop-filter:blur(18px);
    border:1px solid rgba(255,255,255,0.08);
    border-radius:28px;
    padding:45px;
    position:relative;
    z-index:10;
    box-shadow:0 15px 35px rgba(0,0,0,0.45);
    animation:fadeUp 1s ease;
}

/* Logo */

.logo-box{
    width:90px;
    height:90px;
    background:linear-gradient(to right,#14b8a6,#0f766e);
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    margin:0 auto 25px;
    box-shadow:0 10px 25px rgba(20,184,166,0.35);
}

.logo-box i{
    color:white;
    font-size:38px;
}

/* Heading */

.login-title{
    text-align:center;
    color:white;
    font-weight:bold;
    font-size:34px;
}

.login-subtitle{
    text-align:center;
    color:#cbd5e1;
    margin-top:10px;
    margin-bottom:35px;
    font-size:15px;
}

/* Input Fields */

.form-label{
    color:white;
    font-weight:500;
    margin-bottom:8px;
}

.input-group{
    background:rgba(255,255,255,0.05);
    border-radius:14px;
    overflow:hidden;
    margin-bottom:22px;
    border:1px solid rgba(255,255,255,0.08);
    transition:0.3s;
}

.input-group:hover{
    transform:translateY(-2px);
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
    box-shadow:none;
    background:transparent;
    color:white;
}

.form-control::placeholder{
    color:#94a3b8;
}

/* Login Button */

.login-btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:40px;
    background:linear-gradient(to right,#14b8a6,#0f766e);
    color:white;
    font-size:17px;
    font-weight:bold;
    transition:0.4s;
    margin-top:10px;
    box-shadow:0 10px 20px rgba(20,184,166,0.30);
}

.login-btn:hover{
    transform:translateY(-3px) scale(1.02);
    background:linear-gradient(to right,#2dd4bf,#115e59);
}

/* Footer Text */

.footer-text{
    text-align:center;
    margin-top:25px;
    color:#cbd5e1;
    font-size:14px;
}

/* Animations */

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

@keyframes float{

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

/* Mobile */

@media(max-width:500px){

    .login-card{
        margin:20px;
        padding:35px 25px;
    }

    .login-title{
        font-size:28px;
    }
}

</style>

</head>

<body>

<div class="login-card">

<div class="logo-box">
<i class="fa-solid fa-user-shield"></i>
</div>

<h2 class="login-title">
Admin Login
</h2>

<p class="login-subtitle">
Secure access to the professional admin dashboard
</p>

<form action="adminLogin" method="post">

<label class="form-label">
Email Address
</label>

<div class="input-group">

<span class="input-group-text">
<i class="fa-solid fa-envelope"></i>
</span>

<input type="email"
name="email"
class="form-control"
placeholder="Enter admin email"
required>

</div>

<label class="form-label">
Password
</label>

<div class="input-group">

<span class="input-group-text">
<i class="fa-solid fa-lock"></i>
</span>

<input type="password"
name="password"
class="form-control"
placeholder="Enter password"
required>

</div>

<button type="submit" class="login-btn">
<i class="fa-solid fa-right-to-bracket"></i>
 Login as Admin
</button>

</form>

<div class="footer-text">
© 2026 Admin Dashboard | Secure System
</div>

</div>

</body>
</html>