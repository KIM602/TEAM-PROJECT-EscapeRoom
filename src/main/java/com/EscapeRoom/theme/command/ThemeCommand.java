package com.EscapeRoom.theme.command;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface ThemeCommand {
	//추상메서드
	public void execute(HttpServletRequest request, Model model);
}
