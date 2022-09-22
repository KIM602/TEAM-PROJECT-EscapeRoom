package com.EscapeRoom.theme.dao;

import java.util.ArrayList;

import com.EscapeRoom.theme.dto.ThemeDto;

public interface TdaoInterface {
	/* User page */
	//테마 소개
	public ArrayList<ThemeDto> themeList();
	
	/* Admin page */
	//테마등록
	public String insertform(ThemeDto dto);
	//등록된 테마 상세보기 페이지
	public ThemeDto themeDetailsPage(String tid);
	//테마 수정 페이지
	public ThemeDto themeEdit(String tid);
	//테마 수정 처리
	public String edit(ThemeDto dto);
	//테마 삭제
	public void delete(String tid);
	
	/* Reserve */
	public ArrayList<ThemeDto> themeNameList();
	public ThemeDto themeImage(String tId);
	// top3
	public ThemeDto top3Image(String tid);
}
