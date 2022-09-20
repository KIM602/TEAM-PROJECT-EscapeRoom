package com.EscapeRoom.admin.dto;

public class ProjectAdminFooterDto {
	private String fImg;
	private String fBusiness;
	private String fName;
	private String fEmail;
	private String fAddress;
	private String fNumber;
	private String fTel;
	
	public ProjectAdminFooterDto() {
		super();
	}

	public ProjectAdminFooterDto(String fImg, String fBusiness, String fName, String fEmail, String fAddress,
			String fNumber, String fTel) {
		super();
		this.fImg = fImg;
		this.fBusiness = fBusiness;
		this.fName = fName;
		this.fEmail = fEmail;
		this.fAddress = fAddress;
		this.fNumber = fNumber;
		this.fTel = fTel;
	}

	public String getfImg() {
		return fImg;
	}

	public void setfImg(String fImg) {
		this.fImg = fImg;
	}

	public String getfBusiness() {
		return fBusiness;
	}

	public void setfBusiness(String fBusiness) {
		this.fBusiness = fBusiness;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getfEmail() {
		return fEmail;
	}

	public void setfEmail(String fEmail) {
		this.fEmail = fEmail;
	}

	public String getfAddress() {
		return fAddress;
	}

	public void setfAddress(String fAddress) {
		this.fAddress = fAddress;
	}

	public String getfNumber() {
		return fNumber;
	}

	public void setfNumber(String fNumber) {
		this.fNumber = fNumber;
	}

	public String getfTel() {
		return fTel;
	}

	public void setfTel(String fTel) {
		this.fTel = fTel;
	}
	
}
