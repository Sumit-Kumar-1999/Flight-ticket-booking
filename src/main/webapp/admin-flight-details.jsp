<%@page import="com.flight_ticket_booking.dto.AdminAddFlight"%>
<%@page import="java.util.List"%>
<%@page import="com.flight_ticket_booking.dao.AdminAddFlightDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">

<title>AirGo Admin Dashboard</title>

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
	overflow-x: auto;
	background: linear-gradient(rgba(0, 0, 0, 0.70), rgba(0, 0, 0, 0.85)),
		url("image/AirGo.jpg");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	color: white;
	position: relative;
}

/* Animated Neon Background */
body::before {
	content: "";
	position: fixed;
	width: 450px;
	height: 450px;
	background: linear-gradient(#00e5ff, #0072ff);
	border-radius: 50%;
	filter: blur(180px);
	top: -120px;
	left: -120px;
	opacity: 0.25;
	animation: move1 8s infinite alternate;
}

body::after {
	content: "";
	position: fixed;
	width: 400px;
	height: 400px;
	background: linear-gradient(#ff00ff, #7b2ff7);
	border-radius: 50%;
	filter: blur(180px);
	bottom: -120px;
	right: -120px;
	opacity: 0.20;
	animation: move2 8s infinite alternate;
}

@
keyframes move1 { 100%{
	transform: translateY(60px) translateX(40px);
}

}
@
keyframes move2 { 100%{
	transform: translateY(-50px) translateX(-40px);
}

}

/* Navbar */
nav {
	width: 100%;
	height: 80px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 50px;
	position: fixed;
	top: 0;
	z-index: 1000;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(15px);
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
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
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
	transition: 0.5s;
}

.logo:hover {
	transform: rotate(-15deg) scale(1.08);
}

.logo-text {
	font-size: 30px;
	font-weight: 700;
	letter-spacing: 2px;
}

/* Navbar Links */
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
	font-size: 16px;
	font-weight: 500;
	padding: 10px 22px;
	border-radius: 30px;
	transition: 0.4s;
}

nav ul li a:hover {
	background: rgba(255, 255, 255, 0.15);
	box-shadow: 0 0 18px rgba(0, 229, 255, 0.4);
}

/* Main Content */
.main-container {
	width: 95%;
	margin: auto;
	padding-top: 120px;
	padding-bottom: 40px;
	position: relative;
	z-index: 2;
}

/* Heading */
.dashboard-header {
	margin-bottom: 35px;
}

.dashboard-header h1 {
	font-size: 42px;
	margin-bottom: 10px;
}

.dashboard-header p {
	color: #d4d4d4;
	font-size: 16px;
}

/* Table Container */
.table-container {
	width: 100%;
	overflow-x: auto;
	border-radius: 25px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(18px);
	border: 1px solid rgba(255, 255, 255, 0.12);
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.45), inset 0 0 10px
		rgba(255, 255, 255, 0.04);
	padding: 20px;
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

/* Table */
table {
	width: 100%;
	border-collapse: collapse;
	min-width: 1300px;
}

thead tr {
	background: rgba(255, 255, 255, 0.10);
}

thead th {
	padding: 18px 15px;
	font-size: 15px;
	font-weight: 600;
	color: #00e5ff;
	text-align: center;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

tbody tr {
	transition: 0.4s;
}

tbody tr:hover {
	background: rgba(255, 255, 255, 0.08);
	transform: scale(1.01);
}

tbody td {
	padding: 18px 12px;
	text-align: center;
	color: #f2f2f2;
	border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}

/* Flight Logo */
.flight-logo {
	width: 90px;
	height: 50px;
	object-fit: cover;
	border-radius: 12px;
	box-shadow: 0 0 12px rgba(255, 255, 255, 0.2);
}

/* Buttons */
.action-btn {
	border: none;
	outline: none;
	padding: 10px 18px;
	border-radius: 12px;
	color: white;
	cursor: pointer;
	font-size: 14px;
	font-weight: 600;
	transition: 0.4s;
}

.delete-btn {
	background: linear-gradient(135deg, #ff4d6d, #ff1744);
}

.delete-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 0 18px rgba(255, 77, 109, 0.6);
}

.edit-btn {
	background: linear-gradient(135deg, #00e676, #00c853);
}

.edit-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 0 18px rgba(0, 230, 118, 0.6);
}

/* Scrollbar */
::-webkit-scrollbar {
	height: 8px;
	width: 8px;
}

::-webkit-scrollbar-thumb {
	background: #00e5ff;
	border-radius: 20px;
}

/* Responsive */
@media ( max-width :900px) {
	nav {
		padding: 0 20px;
	}
	.dashboard-header h1 {
		font-size: 32px;
	}
	.logo-text {
		font-size: 24px;
	}
}
</style>

</head>

<body>

	<!-- Navbar -->

	<header>

		<nav>

			<div class="logo-section">

				<div class="logo"></div>

				<div class="logo-text">AirGo</div>

			</div>

			<ul>

				<li><a href="home.jsp"> Home </a></li>

				<li><a href="admin-add-flight.jsp"> Add Flight </a></li>

				<li><a href="adminLogout"> Logout </a></li>

			</ul>

		</nav>

	</header>

	<!-- Data -->

	<%
	AdminAddFlightDao addFlightDao = new AdminAddFlightDao();

	List<AdminAddFlight> addFlights = addFlightDao.getAllFlights();
	%>

	<!-- Main Container -->

	<div class="main-container">

		<!-- Heading -->

		<div class="dashboard-header">

			<h1>Flight Management Dashboard</h1>

			<p>Manage, edit and monitor all airline schedules in real-time</p>

		</div>

		<!-- Table -->

		<div class="table-container">

			<table>

				<thead>

					<tr>

						<th>Airline</th>
						<th>Flight No</th>
						<th>Flight Name</th>
						<th>Source</th>
						<th>Destination</th>
						<th>Departure</th>
						<th>Arrival</th>
						<th>Economy</th>
						<th>Business</th>
						<th>Delete</th>
						<th>Edit</th>

					</tr>

				</thead>

				<tbody>

					<%
					for (AdminAddFlight addFlight : addFlights) {

						String image = "";

						if (addFlight.getFlightName().equalsIgnoreCase("IndiGo Airlines")) {
							image = "image/IndiGo_Airlines_logo.svg.png";
						}

						else if (addFlight.getFlightName().equalsIgnoreCase("Air Go")) {
							image = "image/AirGo.jpg";
						}

						else if (addFlight.getFlightName().equalsIgnoreCase("Air India")) {
							image = "image/Air India.jpg";
						}

						else if (addFlight.getFlightName().equalsIgnoreCase("Vistara Airways")) {
							image = "image/vistara.jpg";
						}
						
						else if(addFlight.getFlightName().equalsIgnoreCase("Air India Express")){
							image = "image/Air india express.png";
						}
						
						else if(addFlight.getFlightName().equalsIgnoreCase("SpiceJet")){
							image = "image/spice jet.png";
						}
						
						else if(addFlight.getFlightName().equalsIgnoreCase("AirAsia India")){
							image = "image/Air Asia.png";
						}
					%>

					<tr>

						<!-- Logo -->

						<td><img src="<%=image%>" class="flight-logo"></td>

						<!-- Flight Details -->

						<td><%=addFlight.getFlightNum()%></td>

						<td><%=addFlight.getFlightName()%></td>

						<td><%=addFlight.getSource()%></td>

						<td><%=addFlight.getDestination()%></td>

						<td><%=addFlight.getDepTime()%></td>

						<td><%=addFlight.getArrTime()%></td>

						<td>&#8377; <%=addFlight.getEcoPrice()%>
						</td>

						<td>&#8377; <%=addFlight.getBusiPrice()%>
						</td>

						<!-- Delete -->

						<td><a
							href="deleteFlight?flightNumber=<%=addFlight.getFlightNum()%>">

								<button class="action-btn delete-btn">Delete</button>

						</a></td>

						<!-- Edit -->

						<td><a
							href="edit-flight.jsp?flightNumber=<%=addFlight.getFlightNum()%>">

								<button class="action-btn edit-btn">Edit</button>

						</a></td>

					</tr>

					<%
					}
					%>

				</tbody>

			</table>

		</div>

	</div>

</body>

</html>