<%@page import="com.flight_ticket_booking.dao.FlightBookingDetailsDao"%>
<%@page import="com.flight_ticket_booking.dto.FlightBookingDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">

<title>AirGo Booking Details</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	min-height: 100vh;
	background: linear-gradient(rgba(0, 0, 0, 0.72), rgba(0, 0, 0, 0.88)),
		url("image/AirGo.jpg");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	overflow-x: hidden;
	color: white;
	position: relative;
}

/* Animated Background */
body::before {
	content: "";
	position: fixed;
	width: 420px;
	height: 420px;
	background: linear-gradient(#00e5ff, #0066ff);
	border-radius: 50%;
	filter: blur(180px);
	top: -120px;
	left: -120px;
	opacity: 0.25;
	animation: moveOne 8s infinite alternate;
}

body::after {
	content: "";
	position: fixed;
	width: 350px;
	height: 350px;
	background: linear-gradient(#ff00ff, #8e2de2);
	border-radius: 50%;
	filter: blur(180px);
	bottom: -100px;
	right: -100px;
	opacity: 0.18;
	animation: moveTwo 8s infinite alternate;
}

@
keyframes moveOne { 100%{
	transform: translateY(40px) translateX(50px);
}

}
@
keyframes moveTwo { 100%{
	transform: translateY(-40px) translateX(-50px);
}

}

/* Navbar */
nav {
	width: 100%;
	height: 80px;
	position: fixed;
	top: 0;
	z-index: 1000;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 50px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(16px);
	border-bottom: 1px solid rgba(255, 255, 255, 0.12);
}

.logo-section {
	display: flex;
	align-items: center;
	gap: 15px;
}

.logo {
	width: 60px;
	height: 60px;
	background-image: url("image/airplane-icon-png-22.png");
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
	transition: 0.4s;
}

.logo:hover {
	transform: rotate(-15deg) scale(1.08);
}

.logo-text {
	font-size: 30px;
	font-weight: 700;
	letter-spacing: 2px;
}

/* Nav Links */
nav ul {
	display: flex;
	gap: 20px;
}

nav ul li {
	list-style: none;
}

nav ul li a {
	text-decoration: none;
	color: white;
	font-size: 15px;
	font-weight: 500;
	padding: 10px 22px;
	border-radius: 30px;
	transition: 0.4s;
}

nav ul li a:hover {
	background: rgba(255, 255, 255, 0.15);
	box-shadow: 0 0 18px rgba(0, 229, 255, 0.5);
}

/* Main */
.container {
	width: 100%;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 120px 30px 40px;
	position: relative;
	z-index: 2;
}

/* Card */
.table-card {
	width: 100%;
	max-width: 1400px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(18px);
	border: 1px solid rgba(255, 255, 255, 0.12);
	border-radius: 30px;
	padding: 35px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.45), inset 0 0 10px
		rgba(255, 255, 255, 0.03);
	animation: fadeUp 1s ease;
}

@
keyframes fadeUp {from { opacity:0;
	transform: translateY(60px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* Heading */
.heading {
	text-align: center;
	margin-bottom: 30px;
}

.heading h1 {
	font-size: 42px;
	margin-bottom: 8px;
}

.heading p {
	color: #d4d4d4;
	font-size: 15px;
}

/* Table */
.table-wrapper {
	overflow-x: auto;
	border-radius: 22px;
}

table {
	width: 100%;
	border-collapse: collapse;
	overflow: hidden;
}

thead {
	background: rgba(0, 229, 255, 0.15);
}

thead th {
	padding: 18px 15px;
	font-size: 15px;
	color: #00e5ff;
	text-transform: uppercase;
	letter-spacing: 1px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

tbody tr {
	transition: 0.3s;
}

tbody tr:nth-child(even) {
	background: rgba(255, 255, 255, 0.04);
}

tbody tr:hover {
	background: rgba(255, 255, 255, 0.08);
	transform: scale(1.003);
}

tbody td {
	padding: 18px 15px;
	text-align: center;
	color: white;
	font-size: 14px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}

/* PNR */
.pnr {
	color: #00e5ff;
	font-weight: 600;
	letter-spacing: 1px;
}

/* Class Badge */
.flight-class {
	padding: 8px 14px;
	border-radius: 30px;
	font-size: 13px;
	font-weight: 600;
	display: inline-block;
}

.business {
	background: rgba(255, 193, 7, 0.18);
	color: #ffd54f;
}

.economy {
	background: rgba(0, 230, 118, 0.16);
	color: #00e676;
}

/* Ticket Button */
.ticket-btn {
	display: inline-block;
	padding: 12px 22px;
	border-radius: 14px;
	text-decoration: none;
	color: white;
	font-size: 14px;
	font-weight: 600;
	transition: 0.4s;
	background: linear-gradient(135deg, #00e5ff, #0066ff);
	box-shadow: 0 0 18px rgba(0, 229, 255, 0.35);
}

.ticket-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 0 25px rgba(0, 229, 255, 0.7);
}

/* Back Button */
.back-btn {
	position: fixed;
	bottom: 25px;
	left: 25px;
	z-index: 1000;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	color: white;
	font-size: 28px;
	font-weight: bold;
	background: linear-gradient(135deg, #00e5ff, #0066ff);
	box-shadow: 0 0 25px rgba(0, 229, 255, 0.45);
	transition: 0.4s;
}

.back-btn:hover {
	transform: translateY(-5px) scale(1.08);
	box-shadow: 0 0 30px rgba(0, 229, 255, 0.8);
}

/* Responsive */
@media ( max-width :1100px) {
	.table-card {
		padding: 20px;
	}
	.heading h1 {
		font-size: 30px;
	}
	nav {
		padding: 0 20px;
	}
	.logo-text {
		font-size: 24px;
	}
	thead th, tbody td {
		font-size: 13px;
		padding: 14px 10px;
	}
}
</style>

</head>

<body>

	<%
	Long pnr = (Long) request.getAttribute("pnr");

	FlightBookingDetailsDao dao = new FlightBookingDetailsDao();

	FlightBookingDetails details = dao.getBookedFlightByPnr(pnr);
	%>

	<!-- Navbar -->

	<header>

		<nav>

			<div class="logo-section">

				<div class="logo"></div>

				<div class="logo-text">AirGo</div>

			</div>

			<ul>

				<li><a href="home.jsp">Home</a></li>

				<li><a href="userLogout">Logout</a></li>

			</ul>

		</nav>

	</header>

	<!-- Main -->

	<div class="container">

		<div class="table-card">

			<!-- Heading -->

			<div class="heading">

				<h1>Booking Details</h1>

				<p>Your futuristic flight reservation summary</p>

			</div>

			<!-- Table -->

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

							<th>Flight No</th>

							<th>Class</th>

							<th>Date</th>

							<th>Ticket</th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td class="pnr"><%=details.getPnr()%></td>

							<td><%=details.getName()%></td>

							<td><%=details.getEmail()%></td>

							<td><%=details.getPhone()%></td>

							<td><%=details.getAge()%></td>

							<td><%=details.getGender()%></td>

							<td>₹ <%=details.getPrice()%></td>

							<td><%=details.getFlightNumber()%></td>

							<td><span
								class="flight-class 
                            <%=details.getFlightClass().equalsIgnoreCase("BUSINESS") ? "business" : "economy"%>">

									<%=details.getFlightClass()%>

							</span></td>

							<td><%=details.getBookDate()%></td>

							<td><a href="ticket.jsp?pnr=<%=details.getPnr()%>"
								class="ticket-btn"> View Ticket </a></td>

						</tr>

					</tbody>

				</table>

			</div>

		</div>

	</div>

	<!-- Floating Back Button -->

	<a href="home.jsp" class="back-btn">&#8592;</a>

</body>

</html>