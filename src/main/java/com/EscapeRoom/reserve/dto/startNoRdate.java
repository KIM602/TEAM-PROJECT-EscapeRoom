package com.EscapeRoom.reserve.dto;

public class startNoRdate {
	private int StartNo;
	private String rDate;
	public startNoRdate(int startNo, String rDate) {
		super();
		StartNo = startNo;
		this.rDate = rDate;
	}
	public startNoRdate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getStartNo() {
		return StartNo;
	}
	public void setStartNo(int startNo) {
		StartNo = startNo;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	
	
}
