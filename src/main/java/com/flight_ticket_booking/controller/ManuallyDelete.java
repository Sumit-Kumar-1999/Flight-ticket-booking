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
@WebServlet(value = "/userBookOrLogin")
public class ManuallyDelete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession httpSession = req.getSession();
		if(httpSession.getAttribute("email")!=null)
		{
			RequestDispatcher dispatcher = req.getRequestDispatcher("user-book-flight.jsp");
			dispatcher.include(req, resp);
		}
		else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("user-login.jsp");
			dispatcher.include(req, resp);
		}
	}

}
