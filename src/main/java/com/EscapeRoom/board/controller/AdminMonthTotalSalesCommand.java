package com.EscapeRoom.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.board.dao.BoardDao;
import com.EscapeRoom.reserve.command.ReserveCommand;
import com.EscapeRoom.util.Constant;

public class AdminMonthTotalSalesCommand implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BoardDao dao = Constant.bdao;
		String ym = request.getParameter("ym");
		
		int result = dao.AdminMonthTotalSales(ym);
		
		System.out.println("ÅäÅ»°ª:" + result);
		
		model.addAttribute("AdminMonthTotalSales", result);
		request.setAttribute("AdminMonthTotalSales", result);
		
	}

}
