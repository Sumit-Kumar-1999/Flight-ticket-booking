package com.flight_ticket_booking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.flight_ticket_booking.connection.FlightConnection;
import com.flight_ticket_booking.dto.FlightBookingDetails;

public class FlightBookingDetailsDao 
{
	Connection conn = FlightConnection.getFllightConnection();
	
	public FlightBookingDetails saveBookingDetails(FlightBookingDetails bookingDetails)
	{
		String query = "insert into flight_booking_details values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setLong(1, bookingDetails.getPnr());
			preparedStatement.setString(2, bookingDetails.getName());
			preparedStatement.setString(3, bookingDetails.getEmail());
			preparedStatement.setLong(4, bookingDetails.getPhone());
			preparedStatement.setInt(5, bookingDetails.getAge());
			preparedStatement.setString(6, bookingDetails.getGender());
			preparedStatement.setString(7, bookingDetails.getFlightClass());
			preparedStatement.setString(8, bookingDetails.getBookDate());
			preparedStatement.setDouble(9, bookingDetails.getPrice());
			preparedStatement.setInt(10, bookingDetails.getFlightNumber());
			preparedStatement.setString(11, bookingDetails.getUserEmail());
			preparedStatement.execute();
			return bookingDetails;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * getBookedFlightByPnr
	 */
	public FlightBookingDetails getBookedFlightByPnr(Long pnr)
	{
		String query = "Select * from flight_booking_details where PNR=?";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setLong(1, pnr);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			FlightBookingDetails bookingDetails = new FlightBookingDetails();
			bookingDetails.setPnr(resultSet.getLong("PNR"));
			bookingDetails.setName(resultSet.getString("Name"));
			bookingDetails.setEmail(resultSet.getString("Email"));
			bookingDetails.setPhone(resultSet.getLong("Phone"));
			bookingDetails.setAge(resultSet.getInt("Age"));
			bookingDetails.setGender(resultSet.getString("Gender"));
			bookingDetails.setFlightClass(resultSet.getString("Class"));
			bookingDetails.setBookDate(resultSet.getString("Date"));
			bookingDetails.setPrice(resultSet.getDouble("Price"));
			bookingDetails.setFlightNumber(resultSet.getInt("FlightNumber"));
			bookingDetails.setUserEmail(resultSet.getString("UserEmail"));
			return bookingDetails;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
}
