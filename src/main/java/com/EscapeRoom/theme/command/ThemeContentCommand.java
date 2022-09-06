package com.EscapeRoom.theme.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.theme.dto.ThemeDto;
import com.EscapeRoom.util.Constant;

public class ThemeContentCommand implements ThemeCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		ThemeDao tdao = Constant.tdao;
		
		String tid = request.getParameter("tid");
		System.out.println("tid");
		
		ThemeDto dto = tdao.themeEdit(tid);
		
		if(dto != null) {
			model.addAttribute("themeEdit", dto);
		}
	}

}
