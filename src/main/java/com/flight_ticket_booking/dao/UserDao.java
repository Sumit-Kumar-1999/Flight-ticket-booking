package com.flight_ticket_booking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.flight_ticket_booking.connection.FlightConnection;
import com.flight_ticket_booking.dto.User;

public class UserDao 
{
	Connection connection = FlightConnection.getFllightConnection();
	/*
	 * saveUserdetails
	 */
	public User saveUser(User user)
	{
		String query = "insert into user(name, email, password) values(?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.execute();
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * getAllUser
	 */
	public List<User> getAllUser()
	{
		String query = "select * from user";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			List<User> user = new ArrayList<User>();
			while(resultSet.next())
			{
				User user2 = new User();
				user2.setId(resultSet.getInt("id"));
				user2.setName(resultSet.getString("name"));
				user2.setEmail(resultSet.getString("email"));
				user2.setPassword(resultSet.getString("password"));
				user.add(user2);
			}
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * deleteUser
	 */
	public int deleteUser(int id)
	{
		String query = "delete from user where id = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			int tableId = preparedStatement.executeUpdate();
			return tableId;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	/*
	 * updateUser
	 */
	public User updateUser(String name, String email)
	{
		String query = "update user set values";
		return null;
	}
	/*
	 * getUserByEmail
	 */
	public User getUserByEmail(String email)
	{
		List<User> users = getAllUser();
		for (User user : users) 
		{
			if(email.equals(user.getEmail()))
			{
				return user;
			}
		}
		return null;
	}
}
