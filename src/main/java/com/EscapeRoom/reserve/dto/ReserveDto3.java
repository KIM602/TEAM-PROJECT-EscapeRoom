package com.EscapeRoom.reserve.dto;

public class ReserveDto3 {
	private String rthemename;
	private String tid;
	private String cnt;
	
	public ReserveDto3() {
		super();
	}

	public ReserveDto3(String rthemename, String tid, String cnt) {
		super();
		this.rthemename = rthemename;
		this.tid = tid;
		this.cnt = cnt;
	}

	public String getRthemename() {
		return rthemename;
	}

	public void setRthemename(String rthemename) {
		this.rthemename = rthemename;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

}
