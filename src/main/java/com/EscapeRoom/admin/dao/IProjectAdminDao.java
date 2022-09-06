package com.EscapeRoom.admin.dao;

import com.EscapeRoom.admin.dto.ProjectAdminJoinDto;

public interface IProjectAdminDao {
	//추상메서드
	public String join(ProjectAdminJoinDto dto);
	public ProjectAdminJoinDto login(String pid);
	
}
