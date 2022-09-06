package com.EscapeRoom.theme.dto;

public class ThemeDto {
	private String tid;
	private String tname;
	private String tgenre;
	private String tdifficulty;
	private String ttime;
	private String tprofile;
	private String tphoto;
	
	public ThemeDto() {
		super();
	}
	
	public ThemeDto(String tid, String tname, String tgenre, String tdifficulty, String ttime, String tprofile,
			String tphoto) {
		super();
		this.tid = tid;
		this.tname = tname;
		this.tgenre = tgenre;
		this.tdifficulty = tdifficulty;
		this.ttime = ttime;
		this.tprofile = tprofile;
		this.tphoto = tphoto;
	}
	
	public ThemeDto(String tphoto) {
		super();
	}
	
	public String getTid() {
		return tid;
	}
	public String getTname() {
		return tname;
	}
	public String getTgenre() {
		return tgenre;
	}
	public String getTdifficulty() {
		return tdifficulty;
	}
	public String getTtime() {
		return ttime;
	}
	public String getTprofile() {
		return tprofile;
	}
	public String getTphoto() {
		return tphoto;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public void setTgenre(String tgenre) {
		this.tgenre = tgenre;
	}
	public void setTdifficulty(String tdifficulty) {
		this.tdifficulty = tdifficulty;
	}
	public void setTtime(String ttime) {
		this.ttime = ttime;
	}
	public void setTprofile(String tprofile) {
		this.tprofile = tprofile;
	}
	public void setTphoto(String tphoto) {
		this.tphoto = tphoto;
	}
}
