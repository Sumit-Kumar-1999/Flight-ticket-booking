package com.flight_ticket_booking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flight_ticket_booking.dto.User;
import com.flight_ticket_booking.service.UserService;

@WebServlet("/userLogin")
public class UserLoginController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession httpSession = req.getSession();
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserService service = new UserService();
		User user = service.getUserByEmail(email);
		if(user!=null)
		{
			if(password.equals(user.getPassword()))
			{
				httpSession.setAttribute("email", user.getEmail());
				RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
				dispatcher.forward(req, resp);
			}
			else
			{
				req.setAttribute("pmsg", "invalid password");
				RequestDispatcher dispatcher = req.getRequestDispatcher("user-login.jsp");
				dispatcher.forward(req, resp);
			}
		}else {
			req.setAttribute("emsg", "invalid Email");
			RequestDispatcher dispatcher = req.getRequestDispatcher("user-login.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
