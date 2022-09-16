package com.EscapeRoom.reserve.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto2;
import com.EscapeRoom.theme.command.ThemeCommand;
import com.EscapeRoom.util.Constant;

public class Test123132 implements ThemeCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
	ReserveDao rdao = Constant.rdao;
	
	ReserveDto2 dto = new ReserveDto2("1","1");
	
	ArrayList<ReserveDto2> dlist = rdao.reserveTop31(dto);
	model.addAttribute("dlist",dlist);

	}

}
