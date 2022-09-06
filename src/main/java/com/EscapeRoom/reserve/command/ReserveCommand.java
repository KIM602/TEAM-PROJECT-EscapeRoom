package com.EscapeRoom.reserve.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ReserveCommand {
	//추상메서드
	public void execute(HttpServletRequest request, Model model);
}
