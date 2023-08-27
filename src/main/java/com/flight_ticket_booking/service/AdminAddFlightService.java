package com.flight_ticket_booking.service;

import com.flight_ticket_booking.dao.AdminAddFlightDao;
import com.flight_ticket_booking.dto.AdminAddFlight;

public class AdminAddFlightService 
{
	AdminAddFlightDao addFlightDao = new AdminAddFlightDao();
	/*
	 * addFlight
	 */
	public AdminAddFlight addFlight(AdminAddFlight addFlight)
	{
		return addFlightDao.addFlight(addFlight);
	}
	/*
	 * deleteFlight
	 */
	public int deleteFlight(int flightNumber)
	{
		return addFlightDao.deleteFlight(flightNumber);
	}
	/*
	 * updateFlight
	 */
	public int updateFlight(AdminAddFlight addFlight)
	{
		return addFlightDao.updateFlight(addFlight);
	}
	/*
	 * updateFlightNumByNull
	 */
	public int updateFlightNumByNull(int FlightNumber)
	{
		return addFlightDao.updateFlightNumByNull(FlightNumber);
	}
}
