<%@page import="com.flight_ticket_booking.dao.FlightBookingDetailsDao"%>
<%@page import="com.flight_ticket_booking.dto.FlightBookingDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        * {
            box-sizing: border-box;
            margin: 0px;
            padding: 0px;
            text-decoration: none;
            list-style: none;
            /* border: 1px solid; */
        }
        body{
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
        nav{
            background-color: aqua;
            position: absolute;
            height: 62px;
            width: 100%;
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
        a{
            padding: 4px 5px;
            border-radius: 5px;
            /* color: aliceblue; */
        }
        li a:hover{
            background: rgb(65, 255, 81);
            transition: 1s;
        }
        table{
            position: relative;
            top: 65px;
            border-spacing: 0;
            border-collapse: collapse;
            border: 1px solid #DDEEEE;
        }
        table thead th{
            width: 400px;
            background-color: rgba(174, 255, 255, 0.495);
            border: 1px solid #DDEEEE;
            color: #000000;
            padding: 10px ;
            font-size: 20px;
        }
        table tbody td{
            border: 1px solid #DDEEEE;
            color: #000000;
            text-align: center;
            padding-top: 8px;
            padding-bottom: 8px;
        }
        table tbody tr:nth-child(odd){
            background-color: #fff;
        }
        table tbody tr:nth-child(even){
            background-color: #EEF7EE;
        }
        table tbody td{
            border-left: none;
            border-right: none;
        }
        button{
            cursor: pointer;
            padding: 6px 6px;
            background-color: red;
            border: none;
            color: white;
            border-radius: 5px;
            font-size: 15px;
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
	<%
		Long pnr = (Long)request.getAttribute("pnr");
		FlightBookingDetailsDao dao = new FlightBookingDetailsDao();
		FlightBookingDetails details = dao.getBookedFlightByPnr(pnr);
	%>
	<table>
		<thead>
            <tr>
                <th>PNR</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Price</th>
                <th>FlightNum</th>
                <th>Class</th>
                <th>Date</th>
                <th>Ticket</th>
            </tr>
        </thead>
		<tbody>
            <tr>
                <td><%=details.getPnr()%></td>
                <td><%=details.getName()%></td>
                <td><%=details.getEmail()%></td>
                <td><%=details.getPhone()%></td>
                <td><%=details.getAge()%></td>
                <td><%=details.getGender()%></td>
                <td><%=details.getPrice()%></td>
                <td><%=details.getFlightNumber()%></td>
                <td><%=details.getFlightClass()%></td>
                <td><%=details.getBookDate()%></td>
                <td><a href="ticket.jsp?pnr=<%=details.getPnr()%>"><button>Show ticket</button></a></td>
            </tr>
        </tbody>
	</table>
</body>
</html>