package com.EscapeRoom.reserve.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class CalendarChoiceReserverPageList implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {

			ReserveDao rdao = Constant.rdao;
			String pageNo = request.getParameter("pageNo");
			String rDate = request.getParameter("rDate");
			System.out.println(rDate);
			ArrayList<ReserveDto> dtos = rdao.calendarChoiceReserverPageList(pageNo,rDate);
			model.addAttribute("CalendarChoiceReserverPageList",dtos);
	}

}
