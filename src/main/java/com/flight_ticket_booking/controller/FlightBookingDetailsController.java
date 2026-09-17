package com.flight_ticket_booking.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
