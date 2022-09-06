package com.EscapeRoom.admin.dao;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.EscapeRoom.admin.dto.ProjectAdminJoinDto;

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

	//login√≥∏Æ
	@Override
	public ProjectAdminJoinDto login(String pid) {
		System.out.println(pid);
		
		ProjectAdminJoinDto result = sqlSession.selectOne("login",pid);
		
		return result;
	}
	
}
