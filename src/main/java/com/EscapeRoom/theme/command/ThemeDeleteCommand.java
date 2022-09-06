package com.EscapeRoom.theme.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.util.Constant;

public class ThemeDeleteCommand implements ThemeCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

		ThemeDao tdao = Constant.tdao;
		String tid = request.getParameter("tid");
		
		tdao.delete(tid);
	}

}
