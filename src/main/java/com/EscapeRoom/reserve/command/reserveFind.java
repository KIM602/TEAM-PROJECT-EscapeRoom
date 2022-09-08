package com.EscapeRoom.reserve.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.util.Constant;

public class reserveFind implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		// 사용안함 여기서는
	}
	
	// 조회가 성공했다는 String 타입의 결과값이 필요해서 새로 클래스를 생성함
	public String StrExecute(HttpServletRequest request, Model model) {
		ReserveDao rdao = Constant.rdao;
		String name = request.getParameter("nameKey");  // 세션에서 받아온 키값을 이용하여 값을 가져옴
		String phone = request.getParameter("phoneKey");
		System.out.println("reservefind에서 name은" + name);
		System.out.println("reservefind에서 phone은" + phone);
		ReserveDto rdto = new ReserveDto(phone, name);  // 확인용 정보를 위한 값들을 ReserveDto의 setter
		ReserveDto result = rdao.reserveFindCheck(rdto);  // 가져온 쿼리값을 담음
		String StrResult;  // 쿼리 성공여부를 파악
	
		if(result == null)  { // 가져온 결과값이 비어있을경우
			StrResult = "fail";  // 쿼리 실패 메세지 전달
		}
		else {
			StrResult ="success";
			//request.setAttribute("tid", result.gettId());
			System.out.println("tid값은?"+result.gettId());
			request.setAttribute("tid", result.gettId()); // 테마Id는 별도 테이블에 있어 외래키인 tid 값 저장
			
			model.addAttribute("reserveCheckData",result); // 쿼리정보를 사용하기 위한 모델값 저장
		}
		return StrResult;
	}


}
