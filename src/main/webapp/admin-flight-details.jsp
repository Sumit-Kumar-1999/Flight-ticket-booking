<%@page import="com.flight_ticket_booking.dto.AdminAddFlight"%>
<%@page import="java.util.List"%>
<%@page import="com.flight_ticket_booking.dao.AdminAddFlightDao"%>
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
            padding: 10px;
            font-size: 20px;
        }
        table tbody td{
            border: 1px solid #DDEEEE;
            color: #000000;
            text-align: center;
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
            padding: 3px 4px;
        }
        .delete{
            background-color: rgb(255, 67, 67);
            border: none;
            border-radius: 3px;
            padding: 5px 8px;
            width: 60px;
            color: white;
            font-size: 15px;
        }
        .update{
            background-color: rgb(77, 255, 77);
            border: none;
            width: 60px;
            border-radius: 3px;
            padding: 5px 8px;
            color: white;
            font-size: 15px;
        }
        .img{
            width: 100%;
            height: 50px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            border-radius: 10px;
        }
    </style>
</head>

<body>
   <header>
        <nav class="navbar">
            <span class="logo"></span>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="admin-add-flight.jsp">AddFlight</a></li>
                <li><a href="adminLogout">Logout</a></li>
            </ul>
        </nav>
    </header>
    <%
	AdminAddFlightDao addFlightDao = new AdminAddFlightDao();
	List<AdminAddFlight> addFlights = addFlightDao.getAllFlights();
	%>
    <div>
        <table>
            <thead>
                <tr>
                    <th>LoGo</th>
                    <th>Number</th>
                    <th>Name</th>
                    <th>Source</th>
                    <th>Destination</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>EcoPrice</th>
                    <th>BusiPrice</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <%
			for (AdminAddFlight addFlight : addFlights) {
			%>
			<%
			if (addFlight.getFlightName().equalsIgnoreCase("IndiGo")) {
			%>
            <tbody>
                <tr>
                    <td><img src="image/IndiGo_Airlines_logo.svg.png" alt="IndiGo" class="img"></td>
                    <td><%=addFlight.getFlightNum()%></td>
				<td><%=addFlight.getFlightName()%></td>
				<td><%=addFlight.getSource()%></td>
				<td><%=addFlight.getDestination()%></td>
				<td><%=addFlight.getDepTime()%></td>
				<td><%=addFlight.getArrTime()%></td>
				<td><%=addFlight.getEcoPrice()%></td>
				<td><%=addFlight.getBusiPrice()%></td>
				<td><a
					href="deleteFlight?flightNumber=<%=addFlight.getFlightNum()%>"><button class="delete">Delete</button></a></td>
				<td><a
					href="edit-flight.jsp?flightNumber=<%=addFlight.getFlightNum()%>"><button class="update">Edit</button></a></td>
			</tr>
            
            <%}%>
            <%
			if (addFlight.getFlightName().equalsIgnoreCase("AirGo")) {
			%>
            <tr>
				<td><img alt="AirGo"
					src="image/AirGo.jpg" class="img"></td>
				<td><%=addFlight.getFlightNum()%></td>
				<td><%=addFlight.getFlightName()%></td>
				<td><%=addFlight.getSource()%></td>
				<td><%=addFlight.getDestination()%></td>
				<td><%=addFlight.getDepTime()%></td>
				<td><%=addFlight.getArrTime()%></td>
				<td><%=addFlight.getEcoPrice()%></td>
				<td><%=addFlight.getBusiPrice()%></td>
				<td><a
					href="deleteFlight?flightNumber=<%=addFlight.getFlightNum()%>"><button class="delete">Delete</button></a></td>
				<td><a
					href="edit-flight.jsp?flightNumber=<%=addFlight.getFlightNum()%>"><button class="update">Edit</button></a></td>
			</tr>
			<%}%>
			<%
			if (addFlight.getFlightName().equalsIgnoreCase("AirIndia")) {
			%>
			<tr>
				<td><img alt="AirIndia"
					src="image/Air India.jpg" class="img"></td>
				<td><%=addFlight.getFlightNum()%></td>
				<td><%=addFlight.getFlightName()%></td>
				<td><%=addFlight.getSource()%></td>
				<td><%=addFlight.getDestination()%></td>
				<td><%=addFlight.getDepTime()%></td>
				<td><%=addFlight.getArrTime()%></td>
				<td><%=addFlight.getEcoPrice()%></td>
				<td><%=addFlight.getBusiPrice()%></td>
				<td><a
					href="deleteFlight?flightNumber=<%=addFlight.getFlightNum()%>"><button class="delete">Delete</button></a></td>
				<td><a
					href="edit-flight.jsp?flightNumber=<%=addFlight.getFlightNum()%>"><button class="update">Edit</button></a></td>
			</tr>
			<%}%>
			<%
			if (addFlight.getFlightName().equalsIgnoreCase("Vistara")) {
			%>
			<tr>
				<td><img alt="Vistara"
					src="image/vistara.jpg" class="img"></td>
				<td><%=addFlight.getFlightNum()%></td>
				<td><%=addFlight.getFlightName()%></td>
				<td><%=addFlight.getSource()%></td>
				<td><%=addFlight.getDestination()%></td>
				<td><%=addFlight.getDepTime()%></td>
				<td><%=addFlight.getArrTime()%></td>
				<td><%=addFlight.getEcoPrice()%></td>
				<td><%=addFlight.getBusiPrice()%></td>
				<td><a
					href="deleteFlight?flightNumber=<%=addFlight.getFlightNum()%>"><button class="delete">Delete</button></a></td>
				<td><a
					href="edit-flight.jsp?flightNumber=<%=addFlight.getFlightNum()%>"><button class="update">Edit</button></a></td>
			</tr>
			<%}}%>
			</tbody>
        </table>
    </div>
</body>
</html>