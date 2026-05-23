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

<title>AirGo Passenger Booking</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

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

/* Animated Glow */
body::before {
	content: "";
	position: fixed;
	width: 450px;
	height: 450px;
	background: linear-gradient(#00e5ff, #0072ff);
	border-radius: 50%;
	filter: blur(180px);
	top: -100px;
	left: -120px;
	opacity: 0.25;
	animation: move1 7s infinite alternate;
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
	right: -100px;
	opacity: 0.18;
	animation: move2 7s infinite alternate;
}

@
keyframes move1 { 100%{
	transform: translateY(50px) translateX(50px);
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
	padding: 10px 22px;
	border-radius: 30px;
	transition: 0.4s;
	font-weight: 500;
}

nav ul li a:hover {
	background: rgba(255, 255, 255, 0.15);
	box-shadow: 0 0 18px rgba(0, 229, 255, 0.4);
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

/* Booking Card */
.booking-card {
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
	transform: translateY(50px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* Title */
.title {
	text-align: center;
	margin-bottom: 35px;
}

.title h1 {
	font-size: 42px;
	background: linear-gradient(90deg, #00e5ff, #7b2ff7, #ff00ff);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	margin-bottom: 10px;
}

.title p {
	color: #d6d6d6;
	font-size: 15px;
}

/* Form Grid */
.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 25px;
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
	background: rgba(255, 255, 255, 0.15);
}

/* Radio Sections */
.radio-section {
	margin-top: 25px;
}

.radio-section label {
	color: #00e5ff;
	font-size: 15px;
	font-weight: 500;
}

.radio-options {
	display: flex;
	gap: 30px;
	margin-top: 15px;
}

.radio-options input {
	margin-right: 8px;
	accent-color: #00e5ff;
}

/* Button */
.btn-area {
	width: 100%;
	display: flex;
	justify-content: center;
	margin-top: 40px;
}

.book-btn {
	width: 260px;
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

.book-btn:hover {
	transform: translateY(-4px);
	box-shadow: 0 0 28px rgba(0, 230, 118, 0.6);
}

/* Remove Number Arrows */
input[type='number']::-webkit-inner-spin-button {
	appearance: none;
}

/* Responsive */
@media ( max-width :950px) {
	.booking-card {
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
	.title h1 {
		font-size: 32px;
	}
}
</style>

</head>

<body>

	<%
	HttpSession httpSession = request.getSession();

	String FlightNumber = request.getParameter("flightNumber");

	AdminAddFlightDao addFlightDao = new AdminAddFlightDao();

	String email = (String) httpSession.getAttribute("email");

	AdminAddFlight addFlight = addFlightDao.getFlightByNumber(Integer.parseInt(FlightNumber));

	String date = (String) httpSession.getAttribute("date");
	%>

	<!-- Navbar -->

	<header>

		<nav>

			<div class="logo-section">

				<div class="logo"></div>

				<div class="logo-text">AirGo</div>

			</div>

			<ul>

				<li><a href="home.jsp"> Home </a></li>

				<li><a href="userLogout"> Logout </a></li>

			</ul>

		</nav>

	</header>

	<!-- Main Section -->

	<div class="container">

		<div class="booking-card">

			<!-- Title -->

			<div class="title">

				<h1>Passenger Details</h1>

				<p>Complete your futuristic flight booking</p>

			</div>

			<!-- Form -->

			<form action="flightBooking" method="post">

				<!-- Hidden Fields -->

				<input type="hidden" name="number"
					value="<%=addFlight.getFlightNum()%>"> <input type="hidden"
					name="price" value="<%=addFlight.getEcoPrice()%>"> <input
					type="hidden" name="userEmail" value="<%=email%>"> <input
					type="hidden" name="date" value="<%=date%>">

				<!-- Grid -->

				<div class="form-grid">

					<!-- Name -->

					<div class="input-box">

						<label>Passenger Name</label> <input type="text" name="name"
							placeholder="Enter full name" required>

					</div>

					<!-- Email -->

					<div class="input-box">

						<label>Email Address</label> <input type="email" name="email"
							placeholder="Enter email address" required>

					</div>

					<!-- Phone -->

					<div class="input-box">

						<label>Phone Number</label> <input type="number" name="phone"
							placeholder="Enter phone number" required>

					</div>

					<!-- Age -->

					<div class="input-box">

						<label>Age</label> <input type="number" name="age"
							placeholder="Enter age" required>

					</div>

				</div>

				<!-- Class -->

				<div class="radio-section">

					<label>Select Class</label>

					<div class="radio-options">

						<div>
							<input type="radio" name="class" value="BUSINESS" required>

							Business
						</div>

						<div>
							<input type="radio" name="class" value="ECONOMY"> Economy
						</div>

					</div>

				</div>

				<!-- Gender -->

				<div class="radio-section">

					<label>Select Gender</label>

					<div class="radio-options">

						<div>
							<input type="radio" name="gender" value="Male" required>

							Male
						</div>

						<div>
							<input type="radio" name="gender" value="Female"> Female
						</div>

						<div>
							<input type="radio" name="gender" value="Other"> Other
						</div>

					</div>

				</div>

				<!-- Button -->

				<div class="btn-area">

					<button type="submit" class="book-btn">Book Your Ticket</button>

				</div>

			</form>

		</div>

	</div>

</body>

</html>