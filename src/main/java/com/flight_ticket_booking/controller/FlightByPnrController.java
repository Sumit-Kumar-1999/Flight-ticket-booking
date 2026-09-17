package com.flight_ticket_booking.controller;

import java.io.IOException;

import com.flight_ticket_booking.dao.FlightBookingDetailsDao;
import com.flight_ticket_booking.dto.FlightBookingDetails;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/flightByPnr")
public class FlightByPnrController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Long pnr = Long.parseLong(req.getParameter("pnr"));
		FlightBookingDetailsDao dao = new FlightBookingDetailsDao();
		FlightBookingDetails details = dao.getBookedFlightByPnr(pnr);
		if(details.getPnr()==pnr)
		{
			RequestDispatcher dispatcher = req.getRequestDispatcher("flight-by-pnr.jsp");
			dispatcher.forward(req, resp);
		}
		else {
			req.setAttribute("pnrmsg", "Invalid PNR number");
		}
	}
}
