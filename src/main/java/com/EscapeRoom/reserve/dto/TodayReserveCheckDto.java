package com.EscapeRoom.reserve.dto;

public class TodayReserveCheckDto {
	private String tId;
	private String tName;
	private String tPhoto;
	private String tProfile;
	private String rTime;
	private String rDate;
	private String tTime;
	private String tDifficulty;
	private String tGenre;
	private int rCheck;


	public TodayReserveCheckDto(String tId, String tName, String tPhoto, String tProfile, String rTime, String rDate,
			String tTime, String tDifficulty, String tGenre, int rCheck) {
		super();
		this.tId = tId;
		this.tName = tName;
		this.tPhoto = tPhoto;
		this.tProfile = tProfile;
		this.rTime = rTime;
		this.rDate = rDate;
		this.tTime = tTime;
		this.tDifficulty = tDifficulty;
		this.tGenre = tGenre;
		this.rCheck = rCheck;
	}


	public String gettGenre() {
		return tGenre;
	}


	public void settGenre(String tGenre) {
		this.tGenre = tGenre;
	}


	public String gettTime() {
		return tTime;
	}

	public void settTime(String tTime) {
		this.tTime = tTime;
	}

	public String gettDifficulty() {
		return tDifficulty;
	}

	public void settDifficulty(String tDifficulty) {
		this.tDifficulty = tDifficulty;
	}
	
	public String gettId() {
		return tId;
	}

	public void settId(String tId) {
		this.tId = tId;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String gettPhoto() {
		return tPhoto;
	}

	public void settPhoto(String tPhoto) {
		this.tPhoto = tPhoto;
	}

	public String gettProfile() {
		return tProfile;
	}

	public void settProfile(String tProfile) {
		this.tProfile = tProfile;
	}

	public String getrTime() {
		return rTime;
	}

	public void setrTime(String rTime) {
		this.rTime = rTime;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public int getrCheck() {
		return rCheck;
	}

	public void setrCheck(int rCheck) {
		this.rCheck = rCheck;
	}

	public TodayReserveCheckDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
