package com.EscapeRoom.reserve.dto;

public class ReserveDto {
	private String rId;
	private String rPhone;
	private int rCount;
	private String rTerms;
	private String rDate;
	private String rTime;
	private int rCheck;
	private String tId;
	private String rName;
	private int rPrice;
	private String rThemeName;
	

	public ReserveDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	

	public ReserveDto(String rId, String rPhone, int rCount, String rTerms, String rDate, String rTime, int rCheck,
			String tId, String rName, int rPrice, String rThemeName) {
		super();
		this.rId = rId;
		this.rPhone = rPhone;
		this.rCount = rCount;
		this.rTerms = rTerms;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rCheck = rCheck;
		this.tId = tId;
		this.rName = rName;
		this.rPrice = rPrice;
		this.rThemeName = rThemeName;
	}

	public ReserveDto(String rId) {
		super();
		this.rId = rId;
	}




	public ReserveDto(String rPhone, String rName) {
		super();
		this.rPhone = rPhone;
		this.rName = rName;
	}




	public ReserveDto(String rDate, String tId,String rTime) {
		super();
		this.rDate = rDate;
		this.tId = tId;
		this.rTime = rTime;
	}
	
	




	public ReserveDto(String rId, String rPhone, String rTime, String rName) {
		super();
		this.rId = rId;
		this.rPhone = rPhone;
		this.rTime = rTime;
		this.rName = rName;
	}




	public ReserveDto(String rId, String rPhone, int rCount, String rTerms, String rDate, String rTime, int rCheck,
			String tId, String rName, int rPrice) {
		super();
		this.rId = rId;
		this.rPhone = rPhone;
		this.rCount = rCount;
		this.rTerms = rTerms;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rCheck = rCheck;
		this.tId = tId;
		this.rName = rName;
		this.rPrice = rPrice;
	}


	public String getrId() {
		return rId;
	}


	public void setrId(String rId) {
		this.rId = rId;
	}


	public String getrPhone() {
		return rPhone;
	}


	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}


	public int getrCount() {
		return rCount;
	}


	public void setrCount(int rCount) {
		this.rCount = rCount;
	}


	public String getrTerms() {
		return rTerms;
	}


	public void setrTerms(String rTerms) {
		this.rTerms = rTerms;
	}


	public String getrDate() {
		return rDate;
	}


	public void setrDate(String rDate) {
		this.rDate = rDate;
	}


	public String getrTime() {
		return rTime;
	}


	public void setrTime(String rTime) {
		this.rTime = rTime;
	}


	public int getrCheck() {
		return rCheck;
	}


	public void setrCheck(int rCheck) {
		this.rCheck = rCheck;
	}


	public String gettId() {
		return tId;
	}


	public void settId(String tId) {
		this.tId = tId;
	}


	public String getrName() {
		return rName;
	}


	public void setrName(String rName) {
		this.rName = rName;
	}


	public int getrPrice() {
		return rPrice;
	}


	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}




	public String getrThemeName() {
		return rThemeName;
	}




	public void setrThemeName(String rThemeName) {
		this.rThemeName = rThemeName;
	}



	
}
