package com.EscapeRoom.reserve.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class ReserveListTotal implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		ReserveDao rdao = Constant.rdao;
		
		int tn = rdao.reserveListTotal();
		System.out.println("tn°ªÀº? " + tn);
		model.addAttribute("ReserveListTotal",tn);
		
	}

}
