package com.flight_ticket_booking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flight_ticket_booking.dao.FlightBookingDetailsDao;
import com.flight_ticket_booking.dto.FlightBookingDetails;

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
