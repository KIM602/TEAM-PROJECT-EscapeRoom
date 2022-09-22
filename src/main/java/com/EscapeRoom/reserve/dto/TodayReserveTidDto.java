package com.EscapeRoom.reserve.dto;

public class TodayReserveTidDto {
	private String rDate;
	private String cnt;
	private String tId;
	
	public TodayReserveTidDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TodayReserveTidDto(String rDate, String cnt, String tId) {
		super();
		this.rDate = rDate;
		this.cnt = cnt;
		this.tId = tId;
	}
	
	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String gettId() {
		return tId;
	}

	public void settId(String tId) {
		this.tId = tId;
	}

	
}
