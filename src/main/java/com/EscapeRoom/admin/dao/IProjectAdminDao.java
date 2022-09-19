package com.EscapeRoom.admin.dao;

import java.util.ArrayList;

import com.EscapeRoom.admin.dto.ProjectAdminJoinDto;
import com.EscapeRoom.admin.dto.ProjectAdminMainDto;

public interface IProjectAdminDao {
	//추상메서드
	public String join(ProjectAdminJoinDto dto);
	public ProjectAdminJoinDto login(String pid);
	
	public String mainInsert(ProjectAdminMainDto dto);
	public ArrayList<ProjectAdminMainDto> MainList();
	public String mainModify(ProjectAdminMainDto dto);
	
}
