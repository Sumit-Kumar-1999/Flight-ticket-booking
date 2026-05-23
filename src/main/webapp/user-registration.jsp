<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Register</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<style type="text/css">

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration: none;
    list-style: none;
    font-family: Arial, sans-serif;
}

body{
    height: 100vh;
    width: 100%;
    background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),
    url("image/AirGo.jpg");
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    overflow: hidden;
}

/* ================= NAVBAR ================= */

nav{
    width: 100%;
    height: 70px;
    background: rgba(0, 255, 255, 0.15);
    backdrop-filter: blur(8px);
    border-bottom: 1px solid rgba(255,255,255,0.2);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 40px;
    position: fixed;
    top: 0;
    z-index: 100;
}

.logo-section{
    display: flex;
    align-items: center;
    gap: 10px;
}

.logo{
    background-image: url("image/airplane-icon-png-22.png");
    height: 50px;
    width: 50px;
    background-position: center;
    background-repeat: no-repeat;
    background-size: contain;
}

.logo-text{
    font-size: 28px;
    font-weight: bold;
    color: white;
    letter-spacing: 1px;
}

nav ul{
    display: flex;
    gap: 20px;
}

nav ul li a{
    color: white;
    font-size: 18px;
    padding: 8px 16px;
    border-radius: 8px;
    transition: 0.4s;
}

nav ul li a:hover{
    background-color: rgba(255,255,255,0.2);
    color: cyan;
}

/* ================= FORM SECTION ================= */

.container{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    padding-top: 70px;
}

form{
    width: 430px;
    padding: 35px;
    border-radius: 20px;
    background: rgba(255,255,255,0.12);
    backdrop-filter: blur(12px);
    box-shadow: 0 8px 32px rgba(0,0,0,0.35);
    border: 1px solid rgba(255,255,255,0.2);
    animation: formAnimation 1s ease;
}

@keyframes formAnimation{
    from{
        transform: translateY(-30px);
        opacity: 0;
    }
    to{
        transform: translateY(0);
        opacity: 1;
    }
}

form h1{
    text-align: center;
    color: white;
    margin-bottom: 30px;
    font-size: 34px;
}

.input-group{
    margin-bottom: 22px;
}

label{
    display: block;
    color: white;
    margin-bottom: 8px;
    font-size: 18px;
    font-weight: bold;
}

input[type="text"],
input[type="email"],
input[type="password"]{
    width: 100%;
    height: 45px;
    border: none;
    outline: none;
    border-radius: 10px;
    padding-left: 15px;
    font-size: 16px;
    background: rgba(255,255,255,0.85);
    transition: 0.3s;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus{
    transform: scale(1.02);
    box-shadow: 0 0 10px cyan;
}

input[type="submit"]{
    width: 100%;
    height: 48px;
    border: none;
    border-radius: 10px;
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    color: white;
    font-size: 20px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.4s;
    margin-top: 10px;
}

input[type="submit"]:hover{
    transform: scale(1.03);
    box-shadow: 0 0 15px rgba(255,75,43,0.8);
}

.bottom-text{
    text-align: center;
    margin-top: 20px;
    color: white;
    font-size: 15px;
}

.bottom-text a{
    color: cyan;
    font-weight: bold;
}

.bottom-text a:hover{
    text-decoration: underline;
}

/* ================= RESPONSIVE ================= */

@media(max-width: 500px){

    nav{
        padding: 0 15px;
    }

    .logo-text{
        font-size: 22px;
    }

    form{
        width: 90%;
        padding: 25px;
    }
}

</style>
</head>

<body>

<header>
    <nav>

        <div class="logo-section">
            <span class="logo"></span>
            <span class="logo-text">AirGo</span>
        </div>

        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="user-login.jsp">Logout</a></li>
        </ul>

    </nav>
</header>

<div class="container">

    <form action="userRegister" method="post">

        <h1>Create Account</h1>

        <div class="input-group">
            <label>Name</label>
            <input type="text" name="name" placeholder="Enter your name" required="required">
        </div>

        <div class="input-group">
            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your email" required="required">
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter password" required="required">
        </div>

        <div class="input-group">
            <label>Confirm Password</label>
            <input type="password" name="confirmpassword" placeholder="Confirm password" required="required">
        </div>

        <input type="submit" value="Register">

        <div class="bottom-text">
            Already have an account?
            <a href="user-login.jsp">Login</a>
        </div>

    </form>

</div>

</body>
</html>