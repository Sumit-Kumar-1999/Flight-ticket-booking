<%@page import="com.flight_ticket_booking.dto.AdminAddFlight"%>
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
        nav{
            background: aqua;
            position: absolute;
            border-bottom: 2px solid aqua;
            height: 60px;
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
        article{
            background-color: gray;
            height: 89%;
            width: 100%;
            position: absolute;
            top: 11%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .details{
            /* border: 2px solid black; */
            height: 80%;
            width: 90%;
        }
        .row {
            display: flex;
            justify-content: space-around;
            margin-top: 40px;
        }
        input {
            float: right;
            width: 60%;
            height: 25px;
            outline: none;
        }

        .a {
            width: 400px;
            color: aliceblue;
            font-weight: bold;
            font-size: 20px;
        }
        input[type='submit'] {
            background-color: red;
            color: aliceblue;
            font-weight: bold;
            font-size: 20px;
            border: 1px solid red;
            cursor: pointer;
            border-radius: 15px;
            width: 200px;
            height: 30px;
        }
        input[type='number']::-webkit-inner-spin-button{
            appearance: none;
        }
    </style>
</head>
<body>
</body>
<%
	int flightNumber = Integer.parseInt(request.getParameter("flightNumber"));
	AdminAddFlightDao addFlightDao = new AdminAddFlightDao();
	AdminAddFlight addFlight = addFlightDao.getFlightByNumber(flightNumber);
%>
 <header>
        <nav class="navbar">
            <span class="logo"></span>
            <ul>
                <li><a href="admin-flight-details.jsp">All Flight</a></li>
                <li><a href="user-login.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>
  <main>
        <article>
            <div class="details">
                <form action="updateFlight" method="post">
                    <div class="first">
                        <div class="row">
                            <div class="a">
                                <label id="">Flight Number</label>
                                <input type="number" name="flightNum" value="<%=addFlight.getFlightNum()%>"><br><br>
                            </div>
                            <div class="a">
                                <label id="">Flight Name</label>
                                <input type="text" name="flightName" value="<%=addFlight.getFlightName()%>"><br><br>
                            </div>
                        </div>
                        <div class="row">
                            <div class="a">
                                <label id="">Source</label>
                                <input type="text" name="source" value="<%=addFlight.getSource()%>"><br><br>
                            </div>
                            <div class="a">
                                <label id="">Destination</label>
                                <input type="text" name="destination" value="<%=addFlight.getDestination()%>"><br><br>
                            </div>
                        </div>
                    </div>
                    <div class="second">
                        <div class="row">
                            <div class="a">
                                <label id="">Departure time</label>
                                <input type="time" name="departure" value="<%=addFlight.getDepTime()%>"><br><br>
                            </div>
                            <div class="a">
                                <label id="">Arrival time</label>
                                <input type="time" name="arrTime" value="<%=addFlight.getArrTime()%>"><br><br>
                            </div>
                        </div>
                        <div class="row">
                            <div class="a">
                                <label id="">Economy Price</label>
                                <input type="Number" name="economyTicketPrice" value="<%=addFlight.getEcoPrice()%>"><br><br>
                            </div>
                            <div class="a">
                                <label id="">Business Price</label>
                                <input type="number" name="businessTicketPrice" value="<%=addFlight.getBusiPrice()%>"><br><br>
                            </div>
                        </div>
                        <div class="row">
                            <input type="submit" name="Submit" value="Update">
                        </div>
                      </div>
                </form>
            </div>
        </article>
    </main>
</body>
</html>