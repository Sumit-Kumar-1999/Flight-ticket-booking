package com.flight_ticket_booking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.flight_ticket_booking.connection.FlightConnection;
import com.flight_ticket_booking.dto.Admin;

public class AdminDao 
{
	Connection connection = FlightConnection.getFllightConnection();
	
	/*
	 * display
	 */
	public List<Admin> getAllAdmins()
	{
		String display = "Select * from adminlogin";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(display);
			ResultSet resultSet = preparedStatement.executeQuery();
			List<Admin> admins = new ArrayList<Admin>();
			while(resultSet.next())
			{
				Admin admin = new Admin();
				admin.setId(resultSet.getInt("id"));
				admin.setEmail(resultSet.getString("email"));
				admin.setPassword(resultSet.getString("password"));
				admins.add(admin);
			}
			return admins;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * getDataByEmail
	 */
	public Admin getAdminByEmail(String email)
	{
		List<Admin> admins = getAllAdmins();
		for (Admin admin : admins) 
		{
			if(email.equals(admin.getEmail()))
			{
				return admin;
			}
		}
		return null;
	}
}
