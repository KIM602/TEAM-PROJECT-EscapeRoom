package com.EscapeRoom.theme.dao;

import java.util.ArrayList;

import com.EscapeRoom.theme.dto.ThemeDto;

public interface TdaoInterface {
	//추상메서드
	public String insertform(ThemeDto dto);
	public ArrayList<ThemeDto> themeList();
	public ThemeDto themeDetailsPage(String tid);
	public ThemeDto themeEdit(String tid);
	public String edit(ThemeDto dto);
	public void delete(String tid);
	// reserve용도용1
	public ArrayList<ThemeDto> themeNameList();
	public ThemeDto themeImage(String tId);
	// reserve용도용2
	
	
}
