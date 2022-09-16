package com.EscapeRoom.theme.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.EscapeRoom.theme.dto.ThemeDto;

public class ThemeDao implements TdaoInterface {
	@Autowired //빈을 주입받는 어노테이션
	private SqlSession sqlSession;
	
	/* 테마 등록 */
	@Override
	public String insertform(ThemeDto dto) {
		String result;
		int res = sqlSession.insert("insertform", dto);
		if(res == 1) {
			result = "success";
		}
		else {
			result = "failed";
		}
		return result;
	}

	/* 테마 페이지 */
	@Override
	public ArrayList<ThemeDto> themeList() {
		ArrayList<ThemeDto> dtos = (ArrayList)sqlSession.selectList("themeList");
		return dtos;
	}

	/* 테마 상세보기 */
	@Override
	public ThemeDto themeDetailsPage(String tid) {
		System.out.println("themeDetailsPage");
		ThemeDto dto = sqlSession.selectOne("themeDetailsPage", tid);
		return dto;
	}
	
	/* 수정 처리 */
	@Override
	public String edit(ThemeDto dto) {
		String result;
		int res = sqlSession.update("edit", dto);
		if(res == 1) {
			result = "success";
		}
		else {
			result = "failed";
		}
		return result;
	}
	
	/* 테마 수정 페이지 */
	@Override
	public ThemeDto themeEdit(String tid) {
		ThemeDto dto = sqlSession.selectOne("themeEdit", tid);
		return dto;
	}
	
	/* 테마 삭제 처리 */
	@Override
	public void delete(String tid) {
		int res = sqlSession.delete("delete", tid);
		System.out.println(res);
	}
	
	/* reserve */
	// 테마네임 리스트 reserve용도
	@Override
	public ArrayList<ThemeDto> themeNameList() {
		System.out.println("테마네임리스트입니다");
		ArrayList<ThemeDto> dtos = (ArrayList)sqlSession.selectList("themeNameList");
		return dtos;
	}
	// 테마 이미지용도 reserve용도
	@Override
	public ThemeDto themeImage(String tId) {
		System.out.println("테마tId값은?"+tId);
		ThemeDto dto = sqlSession.selectOne("themeImage",tId);
		return dto;
	}
	
	@Override
	//예약 top3 포스터 이미지 불러오기
	public ThemeDto top3Image(String tid) {
		System.out.println("테마id값" + tid);
		ThemeDto dto = sqlSession.selectOne("top3Image",tid);
		return dto;
	}
}
