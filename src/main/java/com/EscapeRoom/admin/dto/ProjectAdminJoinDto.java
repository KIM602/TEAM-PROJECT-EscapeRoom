package com.EscapeRoom.admin.dto;

public class ProjectAdminJoinDto {

	private String pid;
	private String ppw;
	private String pname;
	private String poaddress;
	private String paddress;
	private String pdetailaddress;
	private String pnumber;
	private String auth;
	
	public ProjectAdminJoinDto() {
		super();
	}

	public ProjectAdminJoinDto(String pid, String ppw, String pname, String poaddress, String paddress,
			String pdetailaddress, String pnumber, String auth) {
		super();
		this.pid = pid;
		this.ppw = ppw;
		this.pname = pname;
		this.poaddress = poaddress;
		this.paddress = paddress;
		this.pdetailaddress = pdetailaddress;
		this.pnumber = pnumber;
		this.auth = auth;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPpw() {
		return ppw;
	}

	public void setPpw(String ppw) {
		this.ppw = ppw;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPoaddress() {
		return poaddress;
	}

	public void setPoaddress(String poaddress) {
		this.poaddress = poaddress;
	}

	public String getPaddress() {
		return paddress;
	}

	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}

	public String getPdetailaddress() {
		return pdetailaddress;
	}

	public void setPdetailaddress(String pdetailaddress) {
		this.pdetailaddress = pdetailaddress;
	}

	public String getPnumber() {
		return pnumber;
	}

	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
}
