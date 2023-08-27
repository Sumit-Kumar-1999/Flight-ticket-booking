package com.flight_ticket_booking.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flight_ticket_booking.dao.AdminAddFlightDao;
import com.flight_ticket_booking.dao.FlightBookingDetailsDao;
import com.flight_ticket_booking.dto.AdminAddFlight;
import com.flight_ticket_booking.dto.FlightBookingDetails;

@SuppressWarnings("serial")
@WebServlet(value="/flightBooking")
public class FlightBookingController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession httpSession = req.getSession();
		String dateString = (String)httpSession.getAttribute("date");
		String Class = req.getParameter("class");
		int flightNum = Integer.parseInt(req.getParameter("number"));
		/* double price = Double.parseDouble(req.getParameter("price")); */
		FlightBookingDetails bookingDetails = new FlightBookingDetails();
		FlightBookingDetailsDao bookingDetailsDao = new FlightBookingDetailsDao();
		
		AdminAddFlightDao addFlightDao = new AdminAddFlightDao();
		AdminAddFlight addFlight = addFlightDao.getFlightByNumber(flightNum);
		
		long pnr = (long) (Math.floor(Math.random()*9000000000L) + 1000000000L);
		long phone = (long) Math.floor(Long.parseLong(req.getParameter("phone")));
		
		bookingDetails.setPnr(pnr);
		bookingDetails.setName(req.getParameter("name"));
		bookingDetails.setEmail(req.getParameter("email"));
		bookingDetails.setFlightClass(Class);
		bookingDetails.setBookDate(dateString);
		bookingDetails.setPhone(phone);
		bookingDetails.setAge(Integer.parseInt(req.getParameter("age")));
		bookingDetails.setGender(req.getParameter("gender"));
		if(Class.equalsIgnoreCase("Business"))
		{
			bookingDetails.setPrice(addFlight.getBusiPrice());
		}else {
			bookingDetails.setPrice(addFlight.getEcoPrice());
		}
		bookingDetails.setFlightNumber(flightNum);
		bookingDetails.setUserEmail(req.getParameter("userEmail"));
		req.setAttribute("pnr", pnr);
		/* req.setAttribute("passengerEmail", req.getParameter("email")); */
		FlightBookingDetails details = bookingDetailsDao.saveBookingDetails(bookingDetails);
		if(details!=null)
		{
			RequestDispatcher dispatcher = req.getRequestDispatcher("user-book-details.jsp"); 
			dispatcher.forward(req, resp);
		}
		 
	}
}
