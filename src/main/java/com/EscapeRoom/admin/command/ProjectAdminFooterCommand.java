package com.EscapeRoom.admin.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.admin.dto.ProjectAdminFooterDto;
import com.EscapeRoom.admin.util.Constant;

public class ProjectAdminFooterCommand implements ProjectAdminCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		ProjectAdminDao edao = Constant.edao;
		
		ArrayList<ProjectAdminFooterDto> dto = edao.FooterList();
		
		model.addAttribute("FooterList",dto);

	}

}
