package com.flight_ticket_booking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
