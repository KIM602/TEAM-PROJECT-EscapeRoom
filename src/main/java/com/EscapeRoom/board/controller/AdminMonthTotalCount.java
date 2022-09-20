package com.EscapeRoom.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.board.dao.BoardDao;
import com.EscapeRoom.reserve.command.ReserveCommand;
import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class AdminMonthTotalCount implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BoardDao dao = Constant.bdao;
		String ym = request.getParameter("ym");
		
		System.out.println("rdto 넣기 완료");
		String result = (String)dao.AdminMonthTotalCount(ym);
		System.out.println("result는 ? " + result);
		
		
		model.addAttribute("AdminMonthTotalCount", result);
		request.setAttribute("AdminMonthTotalCount", result);
	}

}
