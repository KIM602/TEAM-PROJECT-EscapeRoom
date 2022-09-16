package com.EscapeRoom.theme.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.theme.dto.ThemeDto;
import com.EscapeRoom.util.Constant;

public class ThemeImageCommand implements ThemeCommand {

	
	// reserve용도
	@Override
	public void execute(HttpServletRequest request, Model model) {
		ThemeDao tdao = Constant.tdao;
		String tId = request.getParameter("themevalue");
		System.out.println("tId는" + tId);
		ThemeDto tdto = tdao.themeImage(tId);
		
		System.out.println("execute tdto는"+tdto);
		model.addAttribute("theme",tdto);
		
	}

}
