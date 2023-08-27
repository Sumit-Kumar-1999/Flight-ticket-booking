package com.flight_ticket_booking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flight_ticket_booking.service.AdminAddFlightService;

@SuppressWarnings("serial")
@WebServlet("/deleteFlight")
public class AdminDeleteFlightController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		AdminAddFlightService addFlightService = new AdminAddFlightService();
		int flightNum = Integer.parseInt(req.getParameter("flightNumber"));
		
		addFlightService.updateFlightNumByNull(flightNum);
		addFlightService.deleteFlight(flightNum);
		RequestDispatcher dispatcher = req.getRequestDispatcher("admin-flight-details.jsp");
		dispatcher.forward(req, resp);
		
	}
}
