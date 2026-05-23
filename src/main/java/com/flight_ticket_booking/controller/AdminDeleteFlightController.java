package com.flight_ticket_booking.controller;

import java.io.IOException;

import com.flight_ticket_booking.service.AdminAddFlightService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
