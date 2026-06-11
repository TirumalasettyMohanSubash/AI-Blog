<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>User Login</title>

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
    background:linear-gradient(135deg,#0f172a,#1e293b,#111827);
    display:flex;
    justify-content:center;
    align-items:center;
    position:relative;
}

/* BACKGROUND CIRCLES */

body::before{
    content:'';
    position:absolute;
    width:400px;
    height:400px;
    background:rgba(255,255,255,0.05);
    border-radius:50%;
    top:-100px;
    left:-100px;
    animation:float1 6s ease-in-out infinite;
}

body::after{
    content:'';
    position:absolute;
    width:350px;
    height:350px;
    background:rgba(255,255,255,0.04);
    border-radius:50%;
    bottom:-100px;
    right:-80px;
    animation:float2 7s ease-in-out infinite;
}

/* LOGIN CARD */

.login-card{
    width:100%;
    max-width:430px;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    border:1px solid rgba(255,255,255,0.12);
    border-radius:28px;
    padding:45px;
    box-shadow:0 15px 35px rgba(0,0,0,0.4);
    position:relative;
    z-index:10;
    animation:fadeUp 1s ease;
}

/* LOGO */

.logo-box{
    width:90px;
    height:90px;
    margin:0 auto 25px;
    background:linear-gradient(to right,#22c55e,#16a34a);
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    box-shadow:0 10px 25px rgba(34,197,94,0.4);
}

.logo-box i{
    font-size:38px;
    color:white;
}

/* TITLE */

.login-title{
    text-align:center;
    color:white;
    font-size:34px;
    font-weight:bold;
}

.login-subtitle{
    text-align:center;
    color:#cbd5e1;
    margin-top:10px;
    margin-bottom:35px;
}

/* LABEL */

.form-label{
    color:white;
    font-weight:500;
    margin-bottom:8px;
}

/* INPUT */

.input-group{
    background:rgba(255,255,255,0.06);
    border-radius:15px;
    overflow:hidden;
    margin-bottom:22px;
    border:1px solid rgba(255,255,255,0.1);
    transition:0.3s;
}

.input-group:hover{
    transform:translateY(-2px);
    border-color:#22c55e;
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

/* BUTTON */

.login-btn{
    width:100%;
    border:none;
    border-radius:35px;
    padding:14px;
    background:linear-gradient(to right,#22c55e,#16a34a);
    color:white;
    font-size:17px;
    font-weight:bold;
    transition:0.4s;
    margin-top:10px;
    box-shadow:0 10px 20px rgba(34,197,94,0.3);
}

.login-btn:hover{
    transform:translateY(-3px) scale(1.02);
    background:linear-gradient(to right,#4ade80,#15803d);
}

/* REGISTER */

.register-text{
    text-align:center;
    margin-top:25px;
    color:#cbd5e1;
}

.register-text a{
    color:#22c55e;
    font-weight:bold;
    text-decoration:none;
}

.register-text a:hover{
    text-decoration:underline;
}

/* FOOTER */

.footer-text{
    text-align:center;
    margin-top:20px;
    color:#94a3b8;
    font-size:13px;
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

<i class="fa-solid fa-user"></i>

</div>

<h2 class="login-title">
Welcome Back
</h2>

<p class="login-subtitle">
Login to continue exploring the blog platform
</p>

<form action="login" method="post">

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
placeholder="Enter your email"
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
placeholder="Enter your password"
required>

</div>

<button type="submit" class="login-btn">

<i class="fa-solid fa-right-to-bracket"></i>

 Login

</button>

</form>

<div class="register-text">

New user?

<a href="register.jsp">
Create Account
</a>

</div>

<div class="footer-text">
© 2026 Blog Website | Secure Login System
</div>

</div>

</body>
</html>