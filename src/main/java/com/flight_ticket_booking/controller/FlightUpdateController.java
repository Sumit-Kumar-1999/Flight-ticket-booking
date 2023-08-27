package com.flight_ticket_booking.controller;

import java.io.IOException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flight_ticket_booking.dao.AdminAddFlightDao;
import com.flight_ticket_booking.dto.AdminAddFlight;
import com.flight_ticket_booking.service.AdminAddFlightService;

@SuppressWarnings("serial")
@WebServlet(value = "/updateFlight")
public class FlightUpdateController extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int flightNum = Integer.parseInt(req.getParameter("flightNum"));
		String flightName = req.getParameter("flightName");
		String source = req.getParameter("source");
		String destination = req.getParameter("destination");
		String depTime = req.getParameter("departure");
		String arrTime = req.getParameter("arrTime");
		double economyTicketPrice = Double.parseDouble(req.getParameter("economyTicketPrice"));
		double businessTicketPrice = Double.parseDouble(req.getParameter("businessTicketPrice"));
		
		AdminAddFlight addFlight = new AdminAddFlight();
		
		DateFormat dateFormat = new SimpleDateFormat("HH:mm");
		Time time=null;
		Time time2=null;
		try {
			time = new Time(dateFormat.parse(depTime).getTime());
			time2 = new Time(dateFormat.parse(arrTime).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		AdminAddFlightDao addFlightDao = new AdminAddFlightDao();
		
		List<AdminAddFlight> addFlights = new ArrayList<AdminAddFlight>();
		addFlights = addFlightDao.getAllFlights();
		for (AdminAddFlight adminAddFlight : addFlights) {
			if(adminAddFlight.getFlightNum()!=flightNum)
			{
				addFlight.setFlightNum(flightNum);
			}else {
				req.setAttribute("flightNum", "Flight Number is already present");
			}
		}
		addFlight.setFlightName(flightName);
		addFlight.setSource(source);
		addFlight.setDestination(destination);
		addFlight.setDepTime(time);
		addFlight.setArrTime(time2);
		addFlight.setEcoPrice(economyTicketPrice);
		addFlight.setBusiPrice(businessTicketPrice);
		
		AdminAddFlightService addFlightService = new AdminAddFlightService();
		addFlightService.updateFlight(addFlight);
		RequestDispatcher dispatcher = req.getRequestDispatcher("admin-flight-details.jsp");
		dispatcher.forward(req, resp);
	}
}
