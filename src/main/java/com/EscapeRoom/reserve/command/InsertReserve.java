package com.EscapeRoom.reserve.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class InsertReserve implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		String rid = ""; // 번호는 시퀀스에 의해 자동 부여 되므로 어떠한 값이라도 상관없음
		String rPhone = request.getParameter("rPhone"); //
		int rCount = Integer.parseInt(request.getParameter("rCount")); //
		String rTerms = request.getParameter("rTerms");  //
		String rDate = request.getParameter("rDate"); //
		String rTime = request.getParameter("rTime"); //
		int rCheck = 1; // 예약 유무를 나타냄 1은 예약됨을 의미
		String tId = request.getParameter("tId"); //
		String rName = request.getParameter("rName"); //
		int rPrice = Integer.parseInt(request.getParameter("rPrice")); //
		String rThemeName = request.getParameter("rThemeName");

		System.out.println("rPrice는 " + rPrice);
		System.out.println("rPhone는 " + rPhone);
		System.out.println("rTerms는 " + rTerms);
		System.out.println("rDate는 " + rDate);
		System.out.println("rTime는 " + rTime);
		System.out.println("tId는 " + tId);
		System.out.println("rName는 " + rName);
		System.out.println("rPrice는 " + rPrice);
		
		ReserveDto dto = new ReserveDto(rid, rPhone, rCount, rTerms, rDate, rTime, rCheck, tId, rName, rPrice,rThemeName);
				
		ReserveDao rdao = Constant.rdao;
		rdao.insertReserve(dto);
	
	}

}
