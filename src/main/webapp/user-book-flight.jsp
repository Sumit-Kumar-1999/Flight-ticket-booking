<%@page import="com.flight_ticket_booking.service.UserService"%>
<%@page import="com.flight_ticket_booking.dto.User"%>
<%@page import="com.flight_ticket_booking.dto.AdminAddFlight"%>
<%@page import="com.flight_ticket_booking.dao.AdminAddFlightDao"%>
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
            border-bottom: 2px solid rgb(0, 102, 255);
            height: 10%;
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
            
        }
        section{
            background-color: floralwhite;
            position: absolute;
            height: 90%;
            width: 100vw;
            top: 10%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        article h2{
            color: forestgreen;
            margin-bottom: 10px;
        }
        .content{
            border: 2px solid red;
            padding: 20px 20px;
            width: 450px;
            height: auto;
            border-radius: 10px;
        }
        .a{
            float: right;
            outline: none;
            height: 21px;
            width: 200px;
        }
        .radio{
            float: right;
            margin-right: -10px;
        }
        button{
            cursor: pointer;
            background-color: red;
            border: none;
            padding: 8px 8px;
            border-radius: 5px;
            margin-left: 145px;
            color: white;
            font-size: 15px;
        }
        input[type="number"]::-webkit-inner-spin-button{
            visibility: hidden;
        }
</style>
</head>
<body>
	<%
	HttpSession httpSession = request.getSession();
	String FlightNumber = request.getParameter("flightNumber");
	AdminAddFlightDao addFlightDao = new AdminAddFlightDao();
	String email = (String)httpSession.getAttribute("email");
	AdminAddFlight addFlight = addFlightDao.getFlightByNumber(Integer.parseInt(FlightNumber));
	String date = (String)httpSession.getAttribute("date");
	%>
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
            <h2>Passenger Detail</h2>
            <div class="content">
                <form action="flightBooking" method="post">
        
                    <input type="number" name="number" value="<%=addFlight.getFlightNum()%>" hidden="true">
                    
                    <input type="decimal" placeholder="enter-flight-economy-ticket-price" name="price" hidden="true" class="common" value="<%=addFlight.getEcoPrice()%>">
        
                    <label id="PassengerName">Name</label> <input
                        type="text" name="name" class="a"><br><br>
        
                    <label id="PassengerEmail">Email</label> <input
                        type="email" name="email" class="a"><br><br>
        
                    <label id="PassengerPhone">Phone</label> <input
                        type="number" name="phone" class="a"><br><br>
        
                    <label id="PassengerAge">Age</label> <input
                        type="number" name="age" class="a"><br><br>
                        
                     <label id="date" hidden="true">Date</label> <input
                        type="date" name="age" class="a" value="<%=date%>" hidden="true">
                        
                    <label id="UserEmail" hidden="true">UserEmail</label> <input
                        type="email" value="<%=email%>" name="userEmail" hidden="true" class="a">
        			<label>Class</label>
        			<div class="radio">
                        Business  <input type="radio" name="class" value="BUSINESS">&nbsp &nbsp &nbsp &nbsp &nbsp;
                        Economy <input type="radio" name="class" value="ECONOMY">&nbsp &nbsp;
                    </div><br><br>
                    <label id="PassengerGender">Gender</label> 
                    <div class="radio">
                        Male  <input type="radio" name="gender" value="Male">&nbsp &nbsp;
                        Female <input type="radio" name="gender" value="Female">&nbsp &nbsp;
                        Other <input type="radio" name="gender" value="Other">&nbsp &nbsp;
                    </div><br><br><br>
                    <button type="submit">BookYourTicket</button>
                </form>
            </div>
        </article>
    </section>
</body>
</html>