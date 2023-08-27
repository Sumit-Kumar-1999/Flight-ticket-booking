package com.flight_ticket_booking.dto;

import java.sql.Time;

public class AdminAddFlight 
{
	private int flightNum;
	private String flightName;
	private String source;
	private String destination;
	private Time depTime;
	private Time arrTime;
	private double ecoPrice;
	private double busiPrice;
	
	
	public int getFlightNum() {
		return flightNum;
	}
	public void setFlightNum(int flightNum) {
		this.flightNum = flightNum;
	}
	public String getFlightName() {
		return flightName;
	}
	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public Time getDepTime() {
		return depTime;
	}
	public void setDepTime(Time depTime) {
		this.depTime = depTime;
	}
	public Time getArrTime() {
		return arrTime;
	}
	public void setArrTime(Time arrTime) {
		this.arrTime = arrTime;
	}
	public double getEcoPrice() {
		return ecoPrice;
	}
	public void setEcoPrice(double ecoPrice) {
		this.ecoPrice = ecoPrice;
	}
	public double getBusiPrice() {
		return busiPrice;
	}
	public void setBusiPrice(double busiPrice) {
		this.busiPrice = busiPrice;
	}
	
}
