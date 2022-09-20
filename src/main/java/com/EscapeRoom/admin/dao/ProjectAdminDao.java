package com.EscapeRoom.admin.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.EscapeRoom.admin.dto.ProjectAdminFooterDto;
import com.EscapeRoom.admin.dto.ProjectAdminJoinDto;
import com.EscapeRoom.admin.dto.ProjectAdminMainDto;

public class ProjectAdminDao implements IProjectAdminDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String join(ProjectAdminJoinDto dto) {
		String result = null;
		
		try {
			int res = sqlSession.insert("join",dto);
			
			System.out.println(res);
			
			if(res > 0 ) {
				result = "success";
			}
			else {
				result = "failed";
			}
		}
		catch (Exception e) {
			e.getMessage();
			result = "failed";
		}
		return result;
	}

	//login처리
	@Override
	public ProjectAdminJoinDto login(String pid) {
		System.out.println(pid);
		
		ProjectAdminJoinDto result = sqlSession.selectOne("login",pid);
		
		return result;
	}

	//메인 페이지 이미지 DB 등록 처리
	@Override
	public String mainInsert(ProjectAdminMainDto dto) {
		System.out.println("mainInsert");
		String result;
		
		int res = sqlSession.insert("mainInsert",dto);
		
		if(res == 1) {
			result = "success";
		}
		else {
			result = "failed";
		}
		
		return result;
	}

	//main에 이미지 뿌리기
	@Override
	public ArrayList<ProjectAdminMainDto> MainList() {
		System.out.println("MainList");
		
		ArrayList<ProjectAdminMainDto> dto = (ArrayList)sqlSession.selectList("MainList");
		
		return dto;
	}
	
	//main 이미지 수정
	@Override
	public String mainModify(ProjectAdminMainDto dto) {
		String result;
		
		int res = sqlSession.update("mainModify",dto);
		
		if(res == 1) {
			result = "success";
		}
		else {
			result = "failed";
		}
		
		return result;
	}

	//아이디 중복체크
	@Override
	public String check(ProjectAdminJoinDto dto) {
		System.out.println(dto);
		
		String result = null;
		ProjectAdminJoinDto res1 = sqlSession.selectOne("check",dto);		
			if(res1 != null) {
				result = "failed";
			}
			else {
				result = "success";
			}
	
		return result;
	}

	//footer DB등록 처리
	@Override
	public String footerInsert(ProjectAdminFooterDto dto) {
		String result;
		int res = sqlSession.insert("footerInsert",dto);
		if(res == 1) {
			result = "success";
		}
		else {
			result = "failed";
		}
		return result;
	}
	
	//footer에 이미지 뿌리기
	@Override
	public ArrayList<ProjectAdminFooterDto> FooterList() {
		System.out.println("FooterList");
		
		ArrayList<ProjectAdminFooterDto> dto = (ArrayList)sqlSession.selectList("FooterList");
		
		return dto;
	}

	//footer DB수정 처리
	@Override
	public String footerModify(ProjectAdminFooterDto dto) {
		String result;
		
		int res = sqlSession.update("footerModify",dto);
		
		if(res == 1) {
			result = "success";
		}
		else {
			result = "failed";
		}
		return result;
	}
	
}
