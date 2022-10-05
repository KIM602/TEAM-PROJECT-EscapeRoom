package com.EscapeRoom.reserve.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class CalendarChoiceReserverListTotal implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		ReserveDao rdao = Constant.rdao;
		
		String ymd = request.getParameter("ymd");
		int tn = rdao.calendarChoiceReserverListTotal(ymd); // 총합 수를 반환
		
		model.addAttribute("CalendarChoiceReserverListTotal",tn);
		
	}

}
