package com.flight_ticket_booking.service;

import java.util.List;

import com.flight_ticket_booking.dao.AdminDao;
import com.flight_ticket_booking.dto.Admin;


public class AdminService 
{
	AdminDao adminDao = new AdminDao();
	
	/*
	 * display
	 */
	public List<Admin> getAllAdmins()
	{
		return adminDao.getAllAdmins();	
	}
	
	/*
	 * getDataByEmail
	 */
	public Admin getAdminByEmail(String email)
	{
		return adminDao.getAdminByEmail(email);
	}
}
