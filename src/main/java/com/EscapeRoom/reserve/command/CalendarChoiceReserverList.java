package com.EscapeRoom.reserve.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class CalendarChoiceReserverList implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		ReserveDao rdao = Constant.rdao;
		String ymd = request.getParameter("ymd");  // ymd라는 calendar에서 선택한 날짜를 가져옴
		ReserveDto rdto = new ReserveDto(null, null, 0, null, ymd, null, 0, null, null, 0); // ymd만 이용해서 사용하니, 나머지는 null값 또는 0을 넣어줌
		
		ArrayList<ReserveDto> result = rdao.calendarChoiceReserverList(rdto);
		model.addAttribute("result",result);
		model.addAttribute("rdate",ymd); 

	}

}
