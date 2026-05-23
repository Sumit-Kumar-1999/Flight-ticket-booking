<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AirGo - Flight Booking</title>

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
	overflow: hidden;
	background: linear-gradient(rgba(0, 0, 0, 0.55), rgba(0, 0, 0, 0.75)),
		url("image/AirGo.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	position: relative;
}

/* Animated Background */
body::before {
	content: "";
	position: absolute;
	width: 500px;
	height: 500px;
	background: linear-gradient(#00e5ff, #0099ff);
	border-radius: 50%;
	filter: blur(180px);
	top: -120px;
	left: -100px;
	opacity: .35;
	animation: float1 8s infinite alternate;
}

body::after {
	content: "";
	position: absolute;
	width: 450px;
	height: 450px;
	background: linear-gradient(#7b2ff7, #f107a3);
	border-radius: 50%;
	filter: blur(180px);
	bottom: -120px;
	right: -100px;
	opacity: .30;
	animation: float2 8s infinite alternate;
}

@
keyframes float1 { 100%{
	transform: translateY(60px) translateX(40px);
}

}
@
keyframes float2 { 100%{
	transform: translateY(-50px) translateX(-40px);
}

}

/* Navbar */
nav {
	width: 100%;
	height: 80px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 60px;
	position: fixed;
	top: 0;
	z-index: 1000;
	background: rgba(255, 255, 255, 0.05);
	backdrop-filter: blur(12px);
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.logo-section {
	display: flex;
	align-items: center;
	gap: 15px;
}

.logo {
	height: 55px;
	width: 55px;
	background-image: url("image/airplane-icon-png-22.png");
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
	transition: 0.5s;
}

.logo:hover {
	transform: rotate(-15deg) scale(1.1);
}

.logo-text {
	color: white;
	font-size: 30px;
	font-weight: 700;
	letter-spacing: 2px;
}

nav ul {
	display: flex;
	gap: 25px;
}

nav ul li {
	list-style: none;
}

nav ul li a, .button {
	color: white;
	text-decoration: none;
	font-size: 16px;
	font-weight: 500;
	padding: 10px 20px;
	border-radius: 30px;
	transition: 0.4s;
	cursor: pointer;
	position: relative;
	overflow: hidden;
}

nav ul li a:hover, .button:hover {
	background: rgba(255, 255, 255, 0.15);
	box-shadow: 0 0 15px rgba(0, 255, 255, 0.4);
}

/* Hero Section */
.hero {
	width: 100%;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	z-index: 2;
}

.booking-container {
	width: 90%;
	max-width: 1200px;
	padding: 45px;
	border-radius: 30px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(18px);
	border: 1px solid rgba(255, 255, 255, 0.15);
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4), inset 0 0 10px
		rgba(255, 255, 255, 0.05);
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
.heading {
	text-align: center;
	margin-bottom: 40px;
}

.heading h1 {
	color: white;
	font-size: 55px;
	font-weight: 700;
	letter-spacing: 2px;
}

.heading p {
	color: #d6d6d6;
	margin-top: 10px;
	font-size: 18px;
}

/* Form */
form {
	display: flex;
	flex-wrap: wrap;
	gap: 25px;
	justify-content: center;
	align-items: center;
}

.input-box {
	position: relative;
}

.input-box input {
	width: 260px;
	height: 60px;
	padding: 0 20px;
	border: none;
	outline: none;
	border-radius: 18px;
	background: rgba(255, 255, 255, 0.12);
	border: 1px solid rgba(255, 255, 255, 0.1);
	color: white;
	font-size: 17px;
	transition: 0.4s;
}

.input-box input:focus {
	border: 1px solid #00e5ff;
	box-shadow: 0 0 15px rgba(0, 229, 255, 0.5);
	transform: translateY(-3px);
}

.input-box input::placeholder {
	color: #d7d7d7;
}

.swap-btn {
	width: 65px;
	height: 65px;
	border-radius: 50%;
	border: none;
	cursor: pointer;
	background: linear-gradient(135deg, #00e5ff, #0072ff);
	display: flex;
	align-items: center;
	justify-content: center;
	transition: 0.5s;
	box-shadow: 0 0 20px rgba(0, 229, 255, 0.4);
}

.swap-btn img {
	width: 28px;
	transform: rotate(90deg);
}

.swap-btn:hover {
	transform: rotate(180deg) scale(1.08);
}

.search-btn {
	width: 280px;
	height: 60px;
	border: none;
	border-radius: 18px;
	cursor: pointer;
	background: linear-gradient(135deg, #00e5ff, #0072ff);
	color: white;
	font-size: 20px;
	font-weight: 600;
	letter-spacing: 1px;
	transition: 0.5s;
	box-shadow: 0 0 25px rgba(0, 229, 255, 0.5);
}

.search-btn:hover {
	transform: translateY(-5px);
	box-shadow: 0 0 35px rgba(0, 229, 255, 0.7);
}

/* Modal */
.overlay {
	position: fixed;
	inset: 0;
	background: rgba(0, 0, 0, 0.7);
	backdrop-filter: blur(8px);
	opacity: 0;
	visibility: hidden;
	transition: 0.5s;
	z-index: 100;
}

.overlay.active {
	opacity: 1;
	visibility: visible;
}

.pnr-modal {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(0.7);
	width: 420px;
	padding: 35px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(20px);
	border-radius: 25px;
	border: 1px solid rgba(255, 255, 255, 0.15);
	box-shadow: 0 0 40px rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transition: 0.5s;
	z-index: 101;
}

.pnr-modal.active {
	opacity: 1;
	visibility: visible;
	transform: translate(-50%, -50%) scale(1);
}

.close-btn {
	position: absolute;
	top: 10px;
	right: 15px;
	width: 35px;
	height: 35px;
	border-radius: 50%;
	background: red;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	font-size: 22px;
}

.modal-title {
	text-align: center;
	color: white;
	font-size: 28px;
	margin-bottom: 25px;
}

.pnr-modal form {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.pnr-modal input {
	width: 100%;
	height: 55px;
	border: none;
	outline: none;
	border-radius: 15px;
	padding: 0 15px;
	background: rgba(255, 255, 255, 0.12);
	color: white;
	font-size: 17px;
}

.pnr-modal input::placeholder {
	color: #d4d4d4;
}

.search-pnr-btn {
	background: linear-gradient(135deg, #00e676, #00c853);
	cursor: pointer;
	font-weight: 600;
	transition: 0.4s;
}

.search-pnr-btn:hover {
	transform: translateY(-4px);
}

/* Responsive */
@media ( max-width :900px) {
	nav {
		padding: 0 20px;
	}
	.heading h1 {
		font-size: 38px;
	}
	.booking-container {
		padding: 30px 20px;
	}
	form {
		flex-direction: column;
	}
	.input-box input {
		width: 100%;
	}
	.search-btn {
		width: 100%;
	}
	.pnr-modal {
		width: 90%;
	}
}
</style>
</head>

<body>

	<%
	HttpSession httpSession = request.getSession();

	String email = (String) httpSession.getAttribute("email");
	String adminEmail = (String) httpSession.getAttribute("adminEmail");
	%>

	<!-- Overlay -->
	<div class="overlay"></div>

	<!-- PNR Modal -->
	<div class="pnr-modal">

		<div class="close-btn" onclick="closeModal()">&times;</div>

		<h2 class="modal-title">Track Your Flight</h2>

		<form action="flightByPnr" method="post">

			<input type="number" placeholder="Enter Your PNR Number" name="pnr"
				class="pnrInput" required> <input type="submit"
				value="Search PNR" class="search-pnr-btn">

		</form>

	</div>

	<!-- Navbar -->

	<header>

		<nav>

			<div class="logo-section">
				<span class="logo"></span> <span class="logo-text">AirGo</span>
			</div>

			<ul>

				<%
				if (adminEmail == null) {
				%>

				<li><a href="admin-login.jsp">Admin</a></li>

				<%
				} else {
				%>

				<li><a href="admin-add-flight.jsp">Dashboard</a></li>

				<%
				}
				%>

				<li><span class="button" onclick="showModal()">PNR</span></li>

				<%
				if (email != null) {
				%>

				<li><a href="userLogout">Logout</a></li>

				<%
				} else {
				%>

				<li><a href="user-login.jsp">Login</a></li>

				<%
				}
				%>

			</ul>

		</nav>

	</header>

	<!-- Hero Section -->

	<section class="hero">

		<div class="booking-container">

			<div class="heading">

				<h1>Fly Beyond The Future</h1>

				<p>Book flights with futuristic experience and luxury UI</p>

			</div>

			<form action="searchUser" method="GET">

				<div class="input-box">
					<input type="text" name="source" placeholder="From" class="from"
						required>
				</div>

				<button type="button" class="swap-btn">

					<img src="image/dataIcon.png">

				</button>

				<div class="input-box">
					<input type="text" name="destination" placeholder="To" class="to"
						required>
				</div>

				<div class="input-box">
					<input type="date" name="date"
						value="<%=LocalDate.now().plusDays(1)%>" required>
				</div>

				<input type="submit" value="Search Flight" class="search-btn">

			</form>

		</div>

	</section>

	<script>

/* Modal */

function showModal(){
    document.querySelector('.overlay').classList.add('active');
    document.querySelector('.pnr-modal').classList.add('active');
}

function closeModal(){
    document.querySelector('.overlay').classList.remove('active');
    document.querySelector('.pnr-modal').classList.remove('active');
}

/* Swap */

document.querySelector('.swap-btn').addEventListener('click',()=>{

    let from = document.querySelector('.from');
    let to = document.querySelector('.to');

    let temp = from.value;

    from.value = to.value;
    to.value = temp;
});

/* Auto Clear PNR */

document.querySelector('.search-pnr-btn')
.addEventListener('click',()=>{

    setTimeout(()=>{

        document.querySelector('.pnrInput').value="";

    },1000);

});

</script>

</body>
</html>