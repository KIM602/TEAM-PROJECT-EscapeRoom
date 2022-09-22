package com.EscapeRoom.admin.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.admin.dto.ProjectAdminFooterDto;
import com.EscapeRoom.admin.util.Constant;

public class ProjectAdminFooterModifyCommand implements ProjectAdminCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		ProjectAdminDao edao = Constant.edao;
		ProjectAdminFooterDto dto = (ProjectAdminFooterDto)request.getAttribute("fdto");
		
		String result = edao.footerModify(dto);
		
		model.addAttribute("result",result);

	}

}
