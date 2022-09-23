package com.EscapeRoom.reserve.dto;

public class ReserveDto2 {
	private String cnt;
	private String rank;
	private String tid;
	
	public ReserveDto2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReserveDto2(String cnt, String rank, String tid) {
		super();
		this.cnt = cnt;
		this.rank = rank;
		this.tid = tid;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	
}
