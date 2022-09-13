package com.EscapeRoom.reserve.dto;

public class ReserveDto2 {
	private String tId;
	private String cnt;
	
	public String gettId() {
		return tId;
	}
	public void settId(String tId) {
		this.tId = tId;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public ReserveDto2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReserveDto2(String tId, String cnt) {
		super();
		this.tId = tId;
		this.cnt = cnt;
	}
}
