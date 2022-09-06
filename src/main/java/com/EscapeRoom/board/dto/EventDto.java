package com.EscapeRoom.board.dto;

import java.sql.Timestamp;

public class EventDto {
	private int bNum;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private Timestamp bDate;
	private int bHit;
	private int bGroup;
	private int bStep;
	private int bIndent;
	/**
	 * 
	 */
	public EventDto() {
		super();
	}
	
	
	public EventDto(int bNum, String bTitle, String bContent, String bWriter,
			Timestamp bDate, int bHit, int bGroup, int bStep, int bIndent) {
		super();
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bDate = bDate;
		this.bHit = bHit;
		this.bGroup = bGroup;
		this.bStep = bStep;
		this.bIndent = bIndent;
	}
	
	
	
	public EventDto(int bNum) {
		super();
		this.bNum = bNum;
	}
	
	
	public EventDto(int bNum, String bTitle, String bContent) {
		super();
		this.bNum= bNum;
		this.bTitle= bTitle;
		this.bContent= bContent;
	}
	
	
	public int getbNum() {
		return bNum;
	}
	public String getbTitle() {
		return bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public String getbWriter() {
		return bWriter;
	}
	public Timestamp getbDate() {
		return bDate;
	}
	public int getbHit() {
		return bHit;
	}
	public int getbGroup() {
		return bGroup;
	}
	public int getbStep() {
		return bStep;
	}
	public int getbIndent() {
		return bIndent;
	}
	
	
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}


	/**
	 * @param bTitle
	 * @param bContent
	 * @param bWriter
	 */
	public EventDto(String bTitle, String bContent, String bWriter) {
		super();
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
	}

	
}
