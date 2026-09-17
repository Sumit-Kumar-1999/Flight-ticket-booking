<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
		 * {
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
           /* border-bottom: 2px solid aqua; */
           height: 11%;
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
       article{
            background-color: gray;
            height: 89%;
            width: 100%;
            position: absolute;
            top: 11%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .details{
            /* border: 2px solid black; */
            height: 70%;
            width: 400px;
        }
       .container{
           display: flex;
           justify-content: center;
           margin-top: 13vh;
           
       }
       form{
           border: 2px solid white;
           border-radius: 10px;
           background-color: white;
           border: 1px solid white;
           box-shadow: 0px 0px 10px 4px #ccc;
           width: auto;
           height: auto;
           display: flex;
           flex-direction: column;
           align-items: center;
           margin-top: 10px;
           padding-top: 30px;
           padding-left: 30px;
           padding-right: 30px;
       }
       input{
           width: 330px;
           height: 33px;
           font-size: 20px;
       }
       input[type='Submit']{
           background-color: red;
           border: red;
           color: white;
           font-size: 20px;
           border-radius: 20px;
           cursor: pointer;
       }
       ::placeholder{
           font-size: 20px;
           padding-left: 10px;
       }
       input[type='date']{
           font-size: 20px;
       }
</style>
</head>
<body>
    <header>
       <nav class="navbar">
           <span class="logo"></span>
           <ul>
               <li><a href="home.jsp">Home</a></li>
               <li><a href="userLogout">Logout</a></li>
           </ul>
       </nav>
   </header>
   <section>
    <article>
        <div class="details">
            <form action="searchUser" method="Get">
                <input type="text" name="source" placeholder="Source" required><br><br>
                <input type="text" name="destination" placeholder="Destination" required><br><br>
                <input type="date" name="date" value="<%=LocalDate.now().plusDays(1)%>" required><br><br>
                <input type="Submit" value="Search"><br><br>
            </form>
        </div>
    </article>
   </section>
</body>
</body>
</html>