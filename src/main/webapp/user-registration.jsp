<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<style type="text/css">
		*{
            box-sizing: border-box;
            margin: 0px;
            padding: 0px;
            text-decoration: none;
            list-style: none;
            /* border: 1px solid; */
        }
        nav{
            background: aqua;
            position: absolute;
            border-bottom: 2px solid aqua;
            height: 62px;
            width: 100%;
        }
        .logo{
            display: inline-block;
            background-image: url("image/airplane-icon-png-22.png");
            height: 50px;
            width: 50px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: contain;
            padding: 0 60px;
            margin-top: 5px;
        }
        nav ul{
            float: right;
            margin-right: 20px;
        }
        nav ul li{
            display: inline-block;
            line-height: 60px;
            margin: 0 15px;
            font-size: 22px;
        }
        a, .button{
            padding: 4px 5px;
            border-radius: 5px;
            /* color: aliceblue; */
        }
        a:hover,.button:hover{
            background: rgba(179, 254, 185, 0.447);
            transition: 1s;
        }
        body{
            /* background-color: rgb(213, 128, 255); */
            background-image: url("image/AirGo.jpg");
            height: 100vh;
            width: 100vw;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .myLogin {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        form{
            border: 3px solid blue;
            padding: 25px;
            width: 500px;
            border-radius: 10px;
            box-shadow: 1px 1px 15px 4px gray;
            background: transparent;
            backdrop-filter: blur(5px);
        }
        input[name] {
            float: right;
            height: 25px;
            width: 200px;
            outline: none;
        }

        input[value] {
            margin-left: 180px;
            margin-top: 38px;
            font-size: 20px;
            color: white;
            background-color: red;
            border: none;
            cursor: pointer;
            padding: 5px 10px;
            border-radius: 5px;
        }
        label{
            font-size: 20px;
            color: rgb(211, 0, 0);
            font-weight: bold;
        }
	</style>
</head>
<body>
    <header>
        <nav class="navbar">
            <span class="logo"></span>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="user-login.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>
	<div class="myLogin">
		<form action="userRegister" method="post">
		<label>Name</label>
		<input type="text" name="name" required="required"><br><br>
		<label>Email</label>
		<input type="email" name="email" required="required"><br><br>
		<label>Password</label>
		<input type="password" name="password" required="required"><br><br>
		<label>Confirm-Password</label>
		<input type="password" name="confirmpassword" required="required"><br><br>
		<input type="Submit" value="Register">
	</form>
	</div>
</body>
</html>