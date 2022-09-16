package com.EscapeRoom.admin.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.admin.dto.ProjectAdminMainDto;
import com.EscapeRoom.admin.util.Constant;

public class ProjectAdminMainModifyCommand implements ProjectAdminCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		ProjectAdminDao edao = Constant.edao;
		
		ProjectAdminMainDto dto = (ProjectAdminMainDto)request.getAttribute("adto");
		
		String result = edao.mainModify(dto);
		
		model.addAttribute("result",result);
	}

}
