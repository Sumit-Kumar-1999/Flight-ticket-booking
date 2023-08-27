package com.flight_ticket_booking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flight_ticket_booking.dto.User;
import com.flight_ticket_booking.service.UserService;

@WebServlet("/userRegister")
public class UserController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String confirmpassword = req.getParameter("confirmpassword");
		
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		
		UserService userService = new UserService();
		if(password.equals(confirmpassword))
		{
			userService.saveUser(user);
			RequestDispatcher dispatcher = req.getRequestDispatcher("user-login.jsp");
			dispatcher.forward(req, resp);
		}
		else {
			req.setAttribute("msg", "mismatch-password");
			RequestDispatcher dispatcher = req.getRequestDispatcher("user-registration.jsp");
		}
		
	}
}
