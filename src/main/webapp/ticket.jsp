<%@page import="com.flight_ticket_booking.dto.AdminAddFlight"%>
<%@page import="com.flight_ticket_booking.dao.AdminAddFlightDao"%>
<%@page import="com.flight_ticket_booking.dto.FlightBookingDetails"%>
<%@page import="com.flight_ticket_booking.dao.FlightBookingDetailsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket</title>
<style>
        *{
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            /* border: 1px solid ; */
        }
        body{
            margin: 0px;
        }
        .main{
            border: 2px solid rgb(220, 219, 219);
            background-color: rgb(220, 219, 219);
            height: 250px;
            width: 750px;
            margin: 60px 100px;
            border-radius: 20px;
            
        }
        .first{
            border: 2px solid red;
            height: 50px;
            width: 750px;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            background-color: red;
            margin-left: -2px;
            margin-top: -2px;
        }
        .logo{
            background-image: url("image/airplane-icon-png-22.png");
            height: 40px;
            width: 35px;
            position: relative;
            z-index: 1;
            top: -68px;
            left: 12px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: contain;
            transform: rotate(23deg);
        }
        .airline{
            color: white;
            margin-left: 55px;
            position: relative;
            top: 8px;
            font-size: 30px;
            font-weight: lighter;
            font-family: Arial, Helvetica, sans-serif;
            
        }
        .economy{
            color: white;
            margin-left: 470px;
            position: relative;
            top: -7px;
            font-weight: lighter;
            font-family: Arial, Helvetica, sans-serif;
        }
        .boarding{
            color: rgb(255, 255, 255);
            margin-left: 576px;
            position: relative;
            top: -38px;
            /* left: 30px; */
            font-weight: lighter;
            font-family: Arial, Helvetica, sans-serif;
        }
        .sec{
            border: 2px solid white;
            height: 170px;
            width: 80px;
            background-color: white;
            position: relative;
            top: 10px;
            left: 12px;
            /* border: 2px solid black; */
        }
        .img{
            background-image: url("image/barCode.jpg");
            height: 50px;
            width: 160px;
            position: relative;
            left: -91px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .rotate{
            transform: rotate(-90deg);
        }
        .pnr{
            margin-left: -55px;
            margin-top: 2px;
        }
        .content{
            /* border: 2px solid red; */
            width: 440px;
            height: 170px;
            position: absolute;
            margin-left: 105px;
            top: 122px;
        }
        p{
            font-size: 12px;
        }
        .name{
            font-size: 25px;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
            margin-top: 2px;
        }
        .loc{
            margin-top: 38px;
            
        }
        .board{
            margin-top: 10px;
        }
        .to{
            margin-top: 10px;
        }
        label{
            font-weight: bold;
        }
        .divison{
            border: 1px dashed white;
            width: 0px;
            height: 249px;
            position: relative;
            top: -220px;
            left: 560px;
            
        }
        .box{
            /* border: 2px solid red; */
            width: 200px;
            height: 110px;
            position: relative;
            top: -125px;
            left: 240px;
            font-size: small;
        }
        .a{
            display: flex;
            justify-content: space-between;
        }
        .side{
            /* border: 2px solid red; */
            height: 180px;
            width: 165px;
            position: relative;
            z-index: 1;
            top: -410px;
            left: 577px;
        }
        .box2{
            /* border: 2px solid green; */
            width: 140px;
            height: 53px;
            position: absolute;
            left: 11px;
            top: 68px;
        }
        .b{
            font-size: 10px;
            display: flex;
            justify-content: space-between;
        }
        .e{
            margin-top: 5px;
        }
        .name1{
            font-family: Arial, Helvetica, sans-serif;
        }
        .f{
            font-size: 12px;
            margin-top: 1px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .g{
            margin-top: 2px;
        }
        .qrcode{
            border: 2px solid white;
            background-color: white;
            width: 140px;
            height: 50px;
            position: relative;
            top: 60px;
            left: 11px;
        }
        .qr{
            background-image: url("image/barCode.jpg");
            height: 30px;
            width: 132px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
            left: 2px;
        }
        .pnr2{
            text-align: center;
        }
        .s{
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
<%
	Long pnr = Long.parseLong(request.getParameter("pnr"));
	FlightBookingDetailsDao dao = new FlightBookingDetailsDao();
	FlightBookingDetails details = dao.getBookedFlightByPnr(pnr);
	int flightNum = details.getFlightNumber();
	AdminAddFlightDao dao2 = new AdminAddFlightDao();
	AdminAddFlight flight = dao2.getFlightByNumber(flightNum);
%>
	
    <div class="main">
        <header class="first">
            <h2 class="airline"><%=flight.getFlightName() %> TICKET
                <h4 class="economy"><%=details.getFlightClass() %></h4>
            </h2>
            <h3 class="boarding">BOARDING PASS</h3>
            <div class="logo"></div>
        </header>
        <main>
            <section class="sec">
               <div class="rotate">
                <div class="img"></div>
                <div class="pnr"><%=details.getPnr()%></div>
               </div>
            </section>
            <article class="content">
                <p class="s">PASSENGER TICKET AND BAGGAGE CHECK<br>
                    NAME OF PASSANGER
                </p>
                <div class="name"><%=details.getName()%></div>
                <div class="loc s" >
                    <div class="from">
                        <label>FROM :</label>
                        <span><%=flight.getSource() %></span>
                    </div>
                    <div class="to">
                        <label>TO :</label>
                        <span><%=flight.getDestination()%></span>
                    </div>
                    <div class="board">
                        <label>BOARDING :</label>
                        <span>87866</span>
                    </div>
                </div>
                <div class="box s">
                    <div class="a">
                        <label>FLIGHT</label>
                        <span><label>DATE</label></span>
                        <span><label>ZONE</label></span>
                    </div>
                        <div class="a">
                            <span><%=flight.getFlightName() %></span>
                            <span><%=details.getBookDate() %></span>
                            <span>7263</span>
                        </div><br><br>
                    <div class="a">
                        <label>GATE</label>
                        <span><label>SEAT</label></span>
                        <span><label>TIME</label></span>
                    </div>
                        <div class="a">
                            <span>7263</span>
                            <span>7263</span>
                            <span><%=flight.getDepTime()%></span>
                        </div>
                </div>
                
            </article>
        </main>
            <div class="divison"></div>
        <aside>
            <div class="side">
                <p class="s">NAME OF PASSENGER</p>
                <H3 class="name1"><%=details.getName() %></H3>
                <div>
                   <div class="f">
                    <label class="from">FROM: </label>
                    <span><%=flight.getSource() %></span>
                    <div class="g"><label >TO: </label>
                    <span><%=flight.getDestination()%></span>
                   </div>
                    <div class="box2">
                        <div class="b">
                            <label>FLIGHT</label>
                            <span><label>DATE</label></span>
                            <span><label>ZONE</label></span>
                        </div>
                            <div class="b">
                                <span><%=flight.getFlightName() %></span>
                            	<span><%=details.getBookDate() %></span>
                            	<span>7263</span>
                            </div>
                        <div class="b e">
                            <label>GATE</label>
                            <span><label>SEAT</label></span>
                            <span><label>TIME</label></span>
                        </div>
                            <div class="b">
                                <span>7263</span>
                            	<span>7263</span>
                            	<span><%=flight.getDepTime()%></span>
                            </div>
                    </div>
                </div>
                </div>
                <div class="qrcode">
                    <div class="qr"></div>
                    <div class="pnr2"><%=details.getPnr()%></div>
                </div>
            </div>
        </aside> 
    </div>
</body>
</html>
