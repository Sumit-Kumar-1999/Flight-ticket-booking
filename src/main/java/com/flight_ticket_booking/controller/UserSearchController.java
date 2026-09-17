package com.flight_ticket_booking.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet(value = "/searchUser")	
public class UserSearchController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession httpSession = req.getSession();
		String dateString = req.getParameter("date");
		httpSession.setAttribute("date", dateString);
		RequestDispatcher dispatcher = req.getRequestDispatcher("user-search-flight.jsp");
		dispatcher.forward(req, resp);
	}
}
