package com.EscapeRoom.reserve.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class themeReserveTimeCheck implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		ReserveDao rdao = Constant.rdao;
		
		String tId = request.getParameter("themevalue");
		String rDate = request.getParameter("ymd");
		String rTime1 = "10:20";
		String rTime2 = "11:50";
		String rTime3 = "13:20";
		String rTime4 = "14:50";
		String rTime5 = "16:20";
		String rTime6 = "17:50";
		String rTime7 = "19:20";
		String rTime8 = "20:50";
		
		
		// 10시20분
		ReserveDto rdto1 = new ReserveDto(rDate, tId,rTime1); 
		ReserveDto rdtoSu1 = rdao.themeReserveTimeCheck(rdto1);
		model.addAttribute("theme1",rdtoSu1);
		// 11시50분
		ReserveDto rdto2 = new ReserveDto(rDate, tId,rTime2); 
		ReserveDto rdtoSu2 = rdao.themeReserveTimeCheck(rdto2);
		model.addAttribute("theme2",rdtoSu2);
		// 13시20분
		ReserveDto rdto3 = new ReserveDto(rDate, tId,rTime3); 
		ReserveDto rdtoSu3 = rdao.themeReserveTimeCheck(rdto3);
		model.addAttribute("theme3",rdtoSu3);
		// 14시50분
		ReserveDto rdto4 = new ReserveDto(rDate, tId,rTime4); 
		ReserveDto rdtoSu4 = rdao.themeReserveTimeCheck(rdto4);
		model.addAttribute("theme4",rdtoSu4);
		// 16시20분
		ReserveDto rdto5 = new ReserveDto(rDate, tId,rTime5); 
		ReserveDto rdtoSu5 = rdao.themeReserveTimeCheck(rdto5);
		model.addAttribute("theme5",rdtoSu5);
		
		//String theme = "theme"+i+1) 
		// 17시50분
		ReserveDto rdto6 = new ReserveDto(rDate, tId,rTime6); 
		ReserveDto rdtoSu6 = rdao.themeReserveTimeCheck(rdto6);
		model.addAttribute("theme6",rdtoSu6);
		// 19시20분
		ReserveDto rdto7 = new ReserveDto(rDate, tId,rTime7); 
		ReserveDto rdtoSu7 = rdao.themeReserveTimeCheck(rdto7);
		model.addAttribute("theme7",rdtoSu7);
		// 20시50분
		ReserveDto rdto8 = new ReserveDto(rDate, tId,rTime8); 
		ReserveDto rdtoSu8 = rdao.themeReserveTimeCheck(rdto8);
		model.addAttribute("theme8",rdtoSu8);


	}

}
