package com.EscapeRoom.theme.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.theme.dto.ThemeDto;
import com.EscapeRoom.util.Constant;

public class ThemeListPageCommand implements ThemeCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		ThemeDao tdao = Constant.tdao;
		ArrayList<ThemeDto> dtos = tdao.themeList();
		model.addAttribute("themeList", dtos);
	}

}
