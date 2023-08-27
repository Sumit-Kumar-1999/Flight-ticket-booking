<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight ticket Booking</title>
<style>
        * {
            box-sizing: border-box;
            margin: 0px;
            padding: 0px;
            text-decoration: none;
            list-style: none;
            /* border: 1px solid; */
        }
        nav{
            /* background: aqua; */
            position: absolute;
            border-bottom: 2px solid aqua;
            height: 62px;
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
            color: aliceblue;
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
        .body{
            position: relative;
            top: 100px;
            border: 2px solid white;
            height: 300px;
            box-sizing: border-box;
            margin-left: 30px;
            margin-right: 30px;
            padding: 20px 20px;
            background: transparent;
            backdrop-filter: blur(3px);
            border-radius: 10px;
            box-shadow: 0px 0px 8px 8px rgba(144, 142, 142, 0.656);
        }
        .mobileData{
            height: 30px;
            width: 30px;
            transform: rotate(90deg);
            position: relative;
            margin-top: 5px;
            margin-bottom: 5px;
            cursor: pointer;
            display: flex;
            margin-left: auto;
            margin-right: auto;
            align-content: center;
        }
        form{
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }
        input[type]{
            height: 40px;
            width: 320px;
            outline: 0;
            font-size: 20px;
        }
        #data{
            /* border: 1px solid black; */
            width: 50px;
            height: 40px;
        }
        .input[type="Date"]{
            position: relative;
        }
        .lab{
            position: absolute;
        }
        input[class="search"]{
            background-color: red;
            border: none;
            color: #fff;
            cursor: pointer;
            border-radius: 10px;
            position: absolute;
            top: 230px;
            display: flex;
            justify-content: center;
        }
        form, .search{
            justify-content: center;
        }
        .overlay{
            position: fixed;
            width: 100%;
            background: rgba(37, 37, 37, 0.7);
            height: 100vh;
            z-index: -1;
            opacity: 0;
            transition: .5s;
        }
        .pnr{
            width: 400px;
            height: 200px;
            background-color: #ea8585;
            border-radius: 10px;
            padding: 20px;
            position: absolute;
            transition: 2s;
            z-index: 1;
            top: -50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
        }
        .pnr input[type="number"]{
            border: none;
            outline: none;
            border-bottom: 2px solid black;
            margin-top: 20px;
            background: transparent;
            color: white;
        }
        input[class="searchPnr"]{
            background-color: green;
            border: none;
            color: #fff;
            border-radius: 10px;
            cursor: pointer;
        }
        .pnr input::-webkit-inner-spin-button{
            visibility: hidden;
        }
        .pnr input::-webkit-input-placeholder{
            color: white;
        }
        .body input::-webkit-input-placeholder{
        	padding-left: 10px;
        }
        .pnr span{
            position: absolute;
            right: 0;
            top: 0;
            width: 30px;
            height: 30px;
            text-align: center;
            color: white;
            line-height: 30px;
            background-color: red;
            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            cursor: pointer;
            font-size: 20px;
        }
        .showoverlay{
            opacity: 1;
            z-index: 1;
        }
        .button{
            color: white;
            cursor: pointer;
        }
        .showpnr{
            top: 50%;
        }
    </style>
</head>
<body>
<%
	HttpSession httpSession = request.getSession();
	String msg = (String)request.getAttribute("pnrmsg");
	String email = (String)httpSession.getAttribute("email");
	String adminEmail = (String)httpSession.getAttribute("adminEmail");
%>
	<div class="overlay"></div>
    <div class="pnr">
        <span onclick="closeModal()">&times;</span>
        <form action="flightByPnr" method="post">
            <input type="number" placeholder="Enter PNR Number" name="pnr" class="pnr1" required="required">
            <input type="Submit" name="Submit" value="Search" class="searchPnr">
        </form>
    </div>
    <header>
        <nav class="navbar">
            <span class="logo"></span>
            <ul>
            	<%if(adminEmail==null){ %>
                <li><a href="admin-login.jsp">ALogin</a></li>
                <%}else{ %>
                <li><a href="admin-add-flight.jsp">AdminAdd</a></li>
                <%} %>
                <li onclick="showModal()"><span class="button">PNR</span></li>
               <%if(email!=null){%>
                <li><a href="userLogout">Logout</a></li>
                <%}else{ %>
                <li><a href="user-login.jsp">Login</a></li>
                <%} %>
            </ul>
        </nav>
    </header>
    <main>
        <article>
            <div class="body">
                <form action="searchUser" method="Get">
                    <input type="text" name="source" placeholder="From" class="from">
                    <div id="data"><img src="image/dataIcon.png" class="mobileData"></div>    
                    <input type="text" name="destination" placeholder="To" class="to">
                    <input type="Date" name="date" value="<%=LocalDate.now().plusDays(1)%>">
                    <input type="submit" name="Search" value="Search Flight" class="search">
                </form>
            </div>
        </article>
    </main>
</body>
<script>
    function showModal() {
        document.querySelector('.overlay').classList.add('showoverlay');
        document.querySelector('.pnr').classList.add('showpnr');
    }
    function closeModal() {
        document.querySelector('.overlay').classList.remove('showoverlay');
        document.querySelector('.pnr').classList.remove('showpnr');
    }
    let data = document.getElementsByClassName('mobileData')[0];
    
     data.addEventListener('click',()=>{
        let from = document.querySelector('.from').value;
        let to = document.querySelector('.to').value;
        document.querySelector('.from').value = to;
        document.querySelector('.to').value = from;
     })
     let button = document.getElementsByClassName('searchPnr')[0];
     console.log(button);
	
     button.addEventListener('click',()=>{
     let pnr = document.getElementsByClassName('pnr1')[0];
    setTimeout(() => {
        pnr.value = "";
    }, 1000);
});
</script>
</html>