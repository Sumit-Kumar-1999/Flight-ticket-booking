<%@page import="com.flight_ticket_booking.dto.FlightBookingDetails"%>
<%@page import="com.flight_ticket_booking.dao.FlightBookingDetailsDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Passenger Details</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
	text-decoration: none;
	list-style: none;
}

body {
	min-height: 100vh;
	background: linear-gradient(135deg, #0f172a, #111827, #1e293b);
	display: flex;
	flex-direction: column;
	align-items: center;
	color: white;
	overflow-x: hidden;
}

/* NAVBAR */
nav {
	width: 100%;
	height: 75px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(12px);
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 50px;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 100;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.logo-section {
	display: flex;
	align-items: center;
	gap: 15px;
}

.logo {
	background-image: url("image/airplane-icon-png-22.png");
	height: 45px;
	width: 45px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
	filter: drop-shadow(0px 0px 8px cyan);
}

.logo-text {
	font-size: 28px;
	font-weight: 600;
	letter-spacing: 1px;
	color: cyan;
}

nav ul {
	display: flex;
	gap: 25px;
}

nav ul li a {
	color: white;
	font-size: 18px;
	padding: 10px 18px;
	border-radius: 10px;
	transition: 0.4s;
}

nav ul li a:hover {
	background: cyan;
	color: black;
	box-shadow: 0 0 15px cyan;
}

/* MAIN CONTAINER */
.main-container {
	width: 92%;
	max-width: 1300px;
	margin-top: 130px;
	padding: 30px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(15px);
	border-radius: 25px;
	box-shadow: 0 0 25px rgba(0, 255, 255, 0.2);
	border: 1px solid rgba(255, 255, 255, 0.1);
	animation: fadeIn 1s ease;
}

.heading {
	text-align: center;
	font-size: 38px;
	font-weight: 700;
	margin-bottom: 35px;
	color: cyan;
	letter-spacing: 2px;
	text-shadow: 0 0 15px cyan;
}

/* TABLE */
.table-wrapper {
	overflow-x: auto;
	border-radius: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	border-radius: 20px;
	overflow: hidden;
}

thead {
	background: linear-gradient(90deg, #06b6d4, #3b82f6);
}

thead th {
	padding: 18px;
	font-size: 18px;
	color: white;
	text-transform: uppercase;
	letter-spacing: 1px;
}

tbody tr {
	background: rgba(255, 255, 255, 0.06);
	transition: 0.4s;
}

tbody tr:hover {
	background: rgba(0, 255, 255, 0.12);
	transform: scale(1.01);
}

tbody td {
	padding: 18px;
	text-align: center;
	font-size: 17px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.08);
	color: #f1f5f9;
}

/* GLOW EFFECT */
tbody td:first-child {
	color: cyan;
	font-weight: bold;
	text-shadow: 0 0 10px cyan;
}

/* ANIMATION */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* RESPONSIVE */
@media ( max-width : 900px) {
	.heading {
		font-size: 28px;
	}
	thead th, tbody td {
		font-size: 14px;
		padding: 12px;
	}
	nav {
		padding: 0 20px;
	}
	.logo-text {
		font-size: 22px;
	}
	nav ul li a {
		font-size: 15px;
		padding: 8px 12px;
	}
}
</style>
</head>

<body>

	<header>
		<nav>
			<div class="logo-section">
				<span class="logo"></span> <span class="logo-text">SkyWay</span>
			</div>

			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><a href="user-login.jsp">Logout</a></li>
			</ul>
		</nav>
	</header>

	<%
	Long pnr = Long.parseLong(request.getParameter("pnr"));
	FlightBookingDetailsDao dao = new FlightBookingDetailsDao();
	FlightBookingDetails details = dao.getBookedFlightByPnr(pnr);
	%>

	<div class="main-container">

		<h1 class="heading">Passenger Flight Details</h1>

		<div class="table-wrapper">

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
						<th>Flight Number</th>
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
						<td>&#8377; <%=details.getPrice()%></td>
						<td><%=details.getFlightNumber()%></td>
					</tr>
				</tbody>

			</table>

		</div>

	</div>

</body>
</html>