package com.EscapeRoom.reserve.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class reserveFind implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		
		ReserveDao rdao = Constant.rdao;
		String name = request.getParameter("nameKey");
		String phone = request.getParameter("phoneKey");
		System.out.println("reservefind에서 name은" + name);
		System.out.println("reservefind에서 phone은" + phone);
		ReserveDto rdto = new ReserveDto(phone, name);
		
		ReserveDto result = rdao.reserveFindCheck1(rdto);
		model.addAttribute("reserveCheckData",result);
//		String result = rdao.reserveFindCheck(rdto);
//		System.out.println( "result : " + result);
//		request.setAttribute("result", result);
		
		

	}

}
