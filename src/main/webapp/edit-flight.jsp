<%@page import="com.flight_ticket_booking.dto.AdminAddFlight"%>
<%@page import="com.flight_ticket_booking.dao.AdminAddFlightDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">

<title>AirGo Update Flight</title>

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

/* Neon Background */
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
	opacity: 0.22;
	animation: move1 8s infinite alternate;
}

body::after {
	content: "";
	position: fixed;
	width: 380px;
	height: 380px;
	background: linear-gradient(#ff00ff, #7b2ff7);
	border-radius: 50%;
	filter: blur(180px);
	bottom: -120px;
	right: -120px;
	opacity: 0.18;
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
	box-shadow: 0 0 18px rgba(0, 229, 255, 0.5);
}

/* Main Container */
.container {
	width: 100%;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 120px;
	padding-bottom: 40px;
	position: relative;
	z-index: 2;
}

/* Glass Form */
.form-card {
	width: 900px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(18px);
	border: 1px solid rgba(255, 255, 255, 0.12);
	border-radius: 30px;
	padding: 45px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.45), inset 0 0 10px
		rgba(255, 255, 255, 0.04);
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

/* Title */
.form-title {
	text-align: center;
	margin-bottom: 40px;
}

.form-title h1 {
	font-size: 42px;
	margin-bottom: 10px;
}

.form-title p {
	color: #d2d2d2;
	font-size: 15px;
}

/* Grid */
.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 30px;
}

/* Input Box */
.input-box {
	display: flex;
	flex-direction: column;
}

.input-box label {
	margin-bottom: 10px;
	color: #00e5ff;
	font-size: 15px;
	font-weight: 500;
}

.input-box input {
	height: 52px;
	border: none;
	outline: none;
	border-radius: 16px;
	padding: 0 18px;
	background: rgba(255, 255, 255, 0.10);
	border: 1px solid rgba(255, 255, 255, 0.12);
	color: white;
	font-size: 15px;
	transition: 0.4s;
}

.input-box input:focus {
	border: 1px solid #00e5ff;
	box-shadow: 0 0 18px rgba(0, 229, 255, 0.4);
	background: rgba(255, 255, 255, 0.14);
}

/* Submit Button */
.btn-area {
	width: 100%;
	display: flex;
	justify-content: center;
	margin-top: 40px;
}

.update-btn {
	width: 250px;
	height: 55px;
	border: none;
	outline: none;
	border-radius: 18px;
	background: linear-gradient(135deg, #00e676, #00c853);
	color: white;
	font-size: 18px;
	font-weight: 600;
	cursor: pointer;
	letter-spacing: 1px;
	transition: 0.4s;
	box-shadow: 0 0 22px rgba(0, 230, 118, 0.3);
}

.update-btn:hover {
	transform: translateY(-4px);
	box-shadow: 0 0 28px rgba(0, 230, 118, 0.6);
}

/* Remove Number Arrows */
input[type='number']::-webkit-inner-spin-button {
	appearance: none;
}

/* Responsive */
@media ( max-width :950px) {
	.form-card {
		width: 95%;
		padding: 30px;
	}
	.form-grid {
		grid-template-columns: 1fr;
	}
	nav {
		padding: 0 20px;
	}
	.logo-text {
		font-size: 24px;
	}
	.form-title h1 {
		font-size: 32px;
	}
}
</style>

</head>

<body>

	<%
	int flightNumber = Integer.parseInt(request.getParameter("flightNumber"));

	AdminAddFlightDao addFlightDao = new AdminAddFlightDao();

	AdminAddFlight addFlight = addFlightDao.getFlightByNumber(flightNumber);
	%>

	<!-- Navbar -->

	<header>

		<nav>

			<div class="logo-section">

				<div class="logo"></div>

				<div class="logo-text">AirGo</div>

			</div>

			<ul>

				<li><a href="admin-flight-details.jsp"> All Flights </a></li>

				<li><a href="adminLogout"> Logout </a></li>

			</ul>

		</nav>

	</header>

	<!-- Main Section -->

	<div class="container">

		<div class="form-card">

			<!-- Title -->

			<div class="form-title">

				<h1>Update Flight</h1>

				<p>Modify airline details with futuristic control</p>

			</div>

			<!-- Form -->

			<form action="updateFlight" method="post">

				<div class="form-grid">

					<!-- Flight Number -->

					<div class="input-box">

						<label>Flight Number</label> <input type="number" name="flightNum"
							value="<%=addFlight.getFlightNum()%>" required>

					</div>

					<!-- Flight Name -->

					<div class="input-box">

						<label>Flight Name</label> <input type="text" name="flightName"
							value="<%=addFlight.getFlightName()%>" required>

					</div>

					<!-- Source -->

					<div class="input-box">

						<label>Source</label> <input type="text" name="source"
							value="<%=addFlight.getSource()%>" required>

					</div>

					<!-- Destination -->

					<div class="input-box">

						<label>Destination</label> <input type="text" name="destination"
							value="<%=addFlight.getDestination()%>" required>

					</div>

					<!-- Departure -->

					<div class="input-box">

						<label>Departure Time</label> <input type="time" name="departure"
							value="<%=addFlight.getDepTime()%>" required>

					</div>

					<!-- Arrival -->

					<div class="input-box">

						<label>Arrival Time</label> <input type="time" name="arrTime"
							value="<%=addFlight.getArrTime()%>" required>

					</div>

					<!-- Economy -->

					<div class="input-box">

						<label>Economy Price</label> <input type="number"
							name="economyTicketPrice" value="<%=addFlight.getEcoPrice()%>"
							required>

					</div>

					<!-- Business -->

					<div class="input-box">

						<label>Business Price</label> <input type="number"
							name="businessTicketPrice" value="<%=addFlight.getBusiPrice()%>"
							required>

					</div>

				</div>

				<!-- Button -->

				<div class="btn-area">

					<input type="submit" value="Update Flight" class="update-btn">

				</div>

			</form>

		</div>

	</div>

</body>

</html>