package com.flight_ticket_booking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/flight")
public class FlightBookingDetailsController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("flightNumber"));
		String name = req.getParameter("PassengerName");
		String email = req.getParameter("PassengerEmail");
		String gender = req.getParameter("gender");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("user-book-details.jsp");
		dispatcher.forward(req, resp);
	}
}
