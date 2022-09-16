package com.EscapeRoom.admin.dto;

public class ProjectAdminMainDto {
	private String lImage;
	private String mImageNormal;
	private String mImageEvent;
	
	public ProjectAdminMainDto() {
		super();
	}

	public ProjectAdminMainDto(String lImage, String mImageNormal, String mImageEvent) {
		super();
		this.lImage = lImage;
		this.mImageNormal = mImageNormal;
		this.mImageEvent = mImageEvent;
	}

	public String getlImage() {
		return lImage;
	}

	public void setlImage(String lImage) {
		this.lImage = lImage;
	}

	public String getmImageNormal() {
		return mImageNormal;
	}

	public void setmImageNormal(String mImageNormal) {
		this.mImageNormal = mImageNormal;
	}

	public String getmImageEvent() {
		return mImageEvent;
	}

	public void setmImageEvent(String mImageEvent) {
		this.mImageEvent = mImageEvent;
	}
	
}
