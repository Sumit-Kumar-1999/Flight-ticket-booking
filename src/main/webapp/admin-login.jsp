<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>AirGo Admin Login</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    min-height:100vh;
    overflow:hidden;

    background:
    linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.75)),
    url("image/AirGo.jpg");

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;

    display:flex;
    justify-content:center;
    align-items:center;

    position:relative;
}

/* Animated Glowing Background */

body::before{
    content:"";
    position:absolute;

    width:450px;
    height:450px;

    background:linear-gradient(#00e5ff,#0072ff);

    border-radius:50%;
    filter:blur(180px);

    top:-100px;
    left:-120px;

    opacity:0.35;

    animation:move1 8s infinite alternate;
}

body::after{
    content:"";
    position:absolute;

    width:400px;
    height:400px;

    background:linear-gradient(#ff00ff,#7b2ff7);

    border-radius:50%;
    filter:blur(180px);

    bottom:-120px;
    right:-120px;

    opacity:0.30;

    animation:move2 8s infinite alternate;
}

@keyframes move1{
    100%{
        transform:translateY(60px) translateX(50px);
    }
}

@keyframes move2{
    100%{
        transform:translateY(-50px) translateX(-40px);
    }
}

/* Login Card */

.login-container{
    position:relative;
    z-index:2;

    width:430px;
    padding:45px 35px;

    border-radius:30px;

    background:rgba(255,255,255,0.08);

    backdrop-filter:blur(18px);

    border:1px solid rgba(255,255,255,0.15);

    box-shadow:
    0 8px 32px rgba(0,0,0,0.45),
    inset 0 0 10px rgba(255,255,255,0.04);

    animation:fadeUp 1s ease;
}

@keyframes fadeUp{
    from{
        opacity:0;
        transform:translateY(70px);
    }

    to{
        opacity:1;
        transform:translateY(0);
    }
}

/* Logo */

.logo-box{
    display:flex;
    justify-content:center;
    margin-bottom:15px;
}

.logo{
    width:80px;
    height:80px;

    background-image:url("image/airplane-icon-png-22.png");
    background-size:contain;
    background-position:center;
    background-repeat:no-repeat;

    transition:0.5s;
}

.logo:hover{
    transform:rotate(-15deg) scale(1.08);
}

/* Heading */

h2{
    color:white;
    text-align:center;
    font-size:38px;
    margin-bottom:8px;
    letter-spacing:1px;
}

.sub-title{
    text-align:center;
    color:#d6d6d6;
    margin-bottom:35px;
    font-size:15px;
}

/* Input Box */

.input-box{
    position:relative;
    margin-bottom:28px;
}

.input-box input{
    width:100%;
    height:58px;

    border:none;
    outline:none;

    border-radius:18px;

    background:rgba(255,255,255,0.10);

    border:1px solid rgba(255,255,255,0.08);

    padding:0 50px 0 18px;

    color:white;
    font-size:16px;

    transition:0.4s;
}

.input-box input:focus{
    border:1px solid #00e5ff;

    box-shadow:0 0 18px rgba(0,229,255,0.5);

    transform:translateY(-3px);
}

.input-box input::placeholder{
    color:#d7d7d7;
}

.input-box ion-icon{
    position:absolute;

    right:18px;
    top:18px;

    color:white;
    font-size:22px;
}

/* Error Message */

.error{
    color:#ff4d6d;
    font-size:13px;
    margin-bottom:8px;
    margin-left:5px;
}

/* Forgot Password */

.forget{
    display:flex;
    justify-content:flex-end;
    margin-bottom:28px;
}

.forget a{
    color:#e0e0e0;
    text-decoration:none;
    font-size:14px;
    transition:0.3s;
}

.forget a:hover{
    color:#00e5ff;
}

/* Login Button */

button{
    width:100%;
    height:58px;

    border:none;
    outline:none;

    border-radius:18px;

    background:linear-gradient(135deg,#00e5ff,#0072ff);

    color:white;

    font-size:18px;
    font-weight:600;

    cursor:pointer;

    transition:0.5s;

    box-shadow:0 0 25px rgba(0,229,255,0.4);
}

button:hover{
    transform:translateY(-5px);

    box-shadow:0 0 35px rgba(0,229,255,0.7);
}

/* Register */

.register{
    margin-top:28px;
    text-align:center;
    color:#d6d6d6;
    font-size:15px;
}

.register a{
    color:#00e5ff;
    text-decoration:none;
    font-weight:600;
}

.register a:hover{
    text-decoration:underline;
}

/* Responsive */

@media(max-width:500px){

    .login-container{
        width:90%;
        padding:35px 25px;
    }

    h2{
        font-size:30px;
    }
}

</style>

</head>

<body>

<%
    String email = (String)request.getAttribute("email");
    String pass = (String)request.getAttribute("pass");
%>

<div class="login-container">

    <!-- Logo -->

    <div class="logo-box">
        <div class="logo"></div>
    </div>

    <!-- Heading -->

    <h2>Admin Login</h2>

    <p class="sub-title">
        Welcome back to AirGo Dashboard
    </p>

    <!-- Form -->

    <form action="loginAdmin" method="post">

        <!-- Email -->

        <div class="input-box">

            <% if(email != null){ %>

            <div class="error">
                <%= email %>
            </div>

            <% } %>

            <input type="email"
                   name="email"
                   placeholder="Enter Email Address"
                   required>

            <ion-icon name="mail-outline"></ion-icon>

        </div>

        <!-- Password -->

        <div class="input-box">

            <% if(pass != null){ %>

            <div class="error">
                <%= pass %>
            </div>

            <% } %>

            <input type="password"
                   name="password"
                   placeholder="Enter Password"
                   required>

            <ion-icon name="lock-closed-outline"></ion-icon>

        </div>

        <!-- Forget Password -->

        <div class="forget">

            <a href="#">Forgot Password?</a>

        </div>

        <!-- Login Button -->

        <button type="submit">

            LOGIN TO DASHBOARD

        </button>

        <!-- Register -->

        <div class="register">

            <p>
                Don't have an account?
                <a href="#">Register</a>
            </p>

        </div>

    </form>

</div>

<!-- Ionicons -->

<script type="module"
src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js">
</script>

<script nomodule
src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js">
</script>

</body>
</html>