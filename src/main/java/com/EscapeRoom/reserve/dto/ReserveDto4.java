package com.EscapeRoom.reserve.dto;

public class ReserveDto4 {
	private String tId;
	private String rThemeName;
	private String rDate;
	private String cnt;
	/**
	 * 
	 */
	public ReserveDto4() {
		super();
	}
	
	
	public ReserveDto4(String tId, String rThemeName, String rDate, String cnt) {
		super();
		this.tId = tId;
		this.rThemeName = rThemeName;
		this.rDate = rDate;
		this.cnt = cnt;
	}
	
	
	public String gettId() {
		return tId;
	}
	public String getrThemeName() {
		return rThemeName;
	}
	public String getrDate() {
		return rDate;
	}
	public String getCnt() {
		return cnt;
	}
	
	
	public void settId(String tId) {
		this.tId = tId;
	}
	public void setrThemeName(String rThemeName) {
		this.rThemeName = rThemeName;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
}
