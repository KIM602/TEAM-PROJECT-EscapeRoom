package com.EscapeRoom.reserve.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class ReserveDelete implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		ReserveDao rdao = Constant.rdao;
		
		String rid = request.getParameter("reserveid"); // rid가 담겨져있는 키값을 불러서 저장
		System.out.println("삭제 rid값은 ? " + rid);
		ReserveDto rdto = new ReserveDto(rid); // 파라메터 rid값 하나만 있는 생성자 생성
		
		rdao.deleteReserve(rid); // 삭제 메소드 실행

	}

}
