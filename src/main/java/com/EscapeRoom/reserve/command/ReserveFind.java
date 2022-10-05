package com.EscapeRoom.reserve.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class ReserveFind implements ReserveCommand {
	
	
	// 예약자가 단수
	@Override
	public void execute(HttpServletRequest request, Model model) {
		ReserveDao rdao = Constant.rdao;
		String rid = request.getParameter("rId"); // 아이디값 받기
		System.out.println("rid값은  ? " + rid);
		ReserveDto rdto = new ReserveDto(rid); // 해당되는 예약 id값 저장
		ArrayList<ReserveDto> result = rdao.reserveFindMoreThan2DetailPage(rdto); 
		model.addAttribute("reserveCheckData",result);
	}
	
	// 조회가 성공했다는 String 타입의 결과값이 필요해서 새로 클래스를 생성함
	public String StrExecute(HttpServletRequest request, Model model) {
		ReserveDao rdao = Constant.rdao;
		String name = request.getParameter("nameKey");  // 세션에서 받아온 키값을 이용하여 값을 가져옴
		String phone = request.getParameter("phoneKey");
		System.out.println("reservefind에서 name은" + name);
		System.out.println("reservefind에서 phone은" + phone);
		ReserveDto rdto = new ReserveDto(phone, name); // 확인용 정보를 위한 값들을 ReserveDto의 setter
		ArrayList<ReserveDto> result = rdao.reserveFindCheck(rdto);  // 가져온 쿼리값을 담음
		String StrResult;  // 쿼리 성공여부를 파악
		if(result.size() < 1)  { // 가져온 결과값이 비어있을경우
			StrResult = "fail";  // 쿼리 실패 메세지 전달
		}
		else {
			if(result.size() == 1) { // 결과값 리스트가 한개일 경우
				StrResult ="success";
				model.addAttribute("reserveCheckData",result); // 쿼리정보를 사용하기 위한 모델값 저장
				
			}
			else { // 결과값 리스트가 2개 이상일 경우
				StrResult = "success2";  
				model.addAttribute("reserveCheckData",result);
			}
			
		}
		return StrResult;
	}


}
