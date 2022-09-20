package com.EscapeRoom.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.board.dao.BoardDao;
import com.EscapeRoom.reserve.command.ReserveCommand;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class AdminMonthBest implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BoardDao dao = Constant.bdao;
		String ym = request.getParameter("ym");
		
		ReserveDto dto = new ReserveDto(null, null, 0, null, ym, null, 0, null, null, 0, null);
		
		ArrayList<ReserveDto> mlist = dao.AdminMonthBest(dto);
		
		
		model.addAttribute("mList", mlist);
		request.setAttribute("AdminMonthBest", mlist);
		
	}

}
