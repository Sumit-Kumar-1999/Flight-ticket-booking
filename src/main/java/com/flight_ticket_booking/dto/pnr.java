package com.flight_ticket_booking.dto;

public class pnr {

	public static void main(String[] args) 
	{
		FlightBookingDetails bookingDetails = new FlightBookingDetails();
		long pnr = (long) (Math.floor(Math.random()*9000000000L) + 1000000000L);
		long phone = (long) Math.floor(9560530114L);
		bookingDetails.setPnr(pnr);
		bookingDetails.setName("Sumit");
		bookingDetails.setAge(21);
		bookingDetails.setGender("male");
		bookingDetails.setPhone(phone);
		System.out.println(pnr);
		System.out.println(bookingDetails.getName());
		System.out.println(bookingDetails.getAge());
		System.out.println(bookingDetails.getGender());
		System.out.println(bookingDetails.getPhone());
		int num = 123456789;
		int num1 = (int) Math.floor(Math.log10(num)+ 1);
		System.out.println(num1);
	}

}
