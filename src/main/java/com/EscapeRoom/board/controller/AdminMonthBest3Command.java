package com.EscapeRoom.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.board.dao.BoardDao;
import com.EscapeRoom.reserve.command.ReserveCommand;
import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto4;
import com.EscapeRoom.util.Constant;

public class AdminMonthBest3Command implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BoardDao bdao = Constant.bdao;
		String ym = request.getParameter("ym");
		
		ReserveDto4 dto = new ReserveDto4(null, null, ym, null);
		
		ArrayList<ReserveDto4> rlist = bdao.AdminMonthTop3(dto);
		
		if(rlist.size() != 0) {
			request.setAttribute("tid1", rlist.get(0).gettId());
			request.setAttribute("tid2", rlist.get(1).gettId());
			request.setAttribute("tid3", rlist.get(2).gettId());
		
			model.addAttribute("rlist", rlist);
		}
	}

}
