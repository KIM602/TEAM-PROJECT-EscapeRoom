package com.EscapeRoom.theme.command;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.theme.dto.ThemeDto;
import com.EscapeRoom.util.Constant;

public class ThemeEditCommand implements ThemeCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		ThemeDao tdao = Constant.tdao;
		ThemeDto dto = (ThemeDto)request.getAttribute("tdto");
		String result = tdao.edit(dto);
		model.addAttribute("result", result);
		tdao.edit(dto);
	}

}
