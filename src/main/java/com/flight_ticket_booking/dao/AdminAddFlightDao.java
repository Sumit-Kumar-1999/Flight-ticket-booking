package com.flight_ticket_booking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.flight_ticket_booking.connection.FlightConnection;
import com.flight_ticket_booking.dto.AdminAddFlight;

public class AdminAddFlightDao 
{
	Connection conn = FlightConnection.getFllightConnection();
	
	/*
	 * addFlight
	 */
	public AdminAddFlight addFlight(AdminAddFlight addFlight)
	{
		String query = "insert into flightdetails values(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, addFlight.getFlightNum());
			preparedStatement.setString(2, addFlight.getFlightName());
			preparedStatement.setString(3, addFlight.getSource());
			preparedStatement.setString(4, addFlight.getDestination());
			preparedStatement.setTime(5, addFlight.getDepTime());
			preparedStatement.setTime(6, addFlight.getArrTime());
			preparedStatement.setDouble(7, addFlight.getEcoPrice());
			preparedStatement.setDouble(8, addFlight.getBusiPrice());
			preparedStatement.execute();
			return addFlight;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * displayAllFlight
	 */
	public List<AdminAddFlight> getAllFlights()
	{
		String query = "Select * from flightdetails";
		List<AdminAddFlight> addFlights = new ArrayList<AdminAddFlight>();
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				AdminAddFlight addFlight = new AdminAddFlight();
				addFlight.setFlightNum(resultSet.getInt("Num"));
				addFlight.setFlightName(resultSet.getString("Name"));
				addFlight.setSource(resultSet.getString("Source"));
				addFlight.setDestination(resultSet.getString("Destination"));
				addFlight.setDepTime(resultSet.getTime("Departure"));
				addFlight.setArrTime(resultSet.getTime("Arrival"));
				addFlight.setEcoPrice(resultSet.getDouble("EcoPrice"));
				addFlight.setBusiPrice(resultSet.getDouble("BusiPrice"));
				addFlights.add(addFlight);
			}
			return addFlights;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * deleteFlight
	 */
	public int deleteFlight(int flightNumber)
	{
		String query = "Delete from flightdetails where Num=?";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, flightNumber);
			return preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	/*
	 * updateFlight
	 */
	public int updateFlight(AdminAddFlight addFlight)
	{
		String query = "Update flightdetails set Name=?, Source=?, Destination=?, Departure=?, Arrival=?, EcoPrice=?, BusiPrice=? where Num=?";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, addFlight.getFlightName());
			preparedStatement.setString(2, addFlight.getSource());
			preparedStatement.setString(3, addFlight.getDestination());
			preparedStatement.setTime(4, addFlight.getDepTime());
			preparedStatement.setTime(5, addFlight.getArrTime());
			preparedStatement.setDouble(6, addFlight.getEcoPrice());
			preparedStatement.setDouble(7, addFlight.getBusiPrice());
			preparedStatement.setDouble(8, addFlight.getFlightNum());
			
			return preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	/*
	 * getAllFlightByNumber
	 */
	public AdminAddFlight getFlightByNumber(int FlightNumber)
	{
		String query = "Select * from flightdetails where Num=?";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, FlightNumber);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			
			AdminAddFlight addFlight = new AdminAddFlight();
			addFlight.setFlightNum(resultSet.getInt("Num"));
			addFlight.setFlightName(resultSet.getString("Name"));
			addFlight.setSource(resultSet.getString("Source"));
			addFlight.setDestination(resultSet.getString("Destination"));
			addFlight.setDepTime(resultSet.getTime("Departure"));
			addFlight.setArrTime(resultSet.getTime("Arrival"));
			addFlight.setEcoPrice(resultSet.getDouble("EcoPrice"));
			addFlight.setBusiPrice(resultSet.getDouble("BusiPrice"));
			return addFlight;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * getFlightBySourceToDestination
	 */
	public List<AdminAddFlight> getFlightBySourceToDestination(String source, String destination)
	{
		List<AdminAddFlight> addFlights = getAllFlights();
		List<AdminAddFlight> filterFlightDetails = new ArrayList<AdminAddFlight>();
		
		for (AdminAddFlight adminAddFlight : addFlights) 
		{
			if((adminAddFlight.getSource().equalsIgnoreCase(source))&&(adminAddFlight.getDestination().equalsIgnoreCase(destination)))
			{
				filterFlightDetails.add(adminAddFlight);
			}
		}
		return filterFlightDetails;
	}
	/*
	 * updateFlightNumByNull
	 */
	public int updateFlightNumByNull(int FlightNumber)
	{
		String query = "Update flight_booking_details set FlightNumber = NULL where FlightNumber = ?";
		
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			
			preparedStatement.setInt(1, FlightNumber);
			int res = preparedStatement.executeUpdate();
			return res;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
