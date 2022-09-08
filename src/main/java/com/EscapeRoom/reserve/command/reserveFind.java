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
		String name = request.getParameter("nameKey");
		String phone = request.getParameter("phoneKey");
		System.out.println("reservefind에서 name은" + name);
		System.out.println("reservefind에서 phone은" + phone);
		ReserveDto rdto = new ReserveDto(phone, name);
		
		ReserveDto result = rdao.reserveFindCheck(rdto);
		String StrResult;
		if(result == null)  {
			StrResult = "fail";
		}
		else {
			StrResult ="success";
			//request.setAttribute("tid", result.gettId());
			System.out.println("tid값은?"+result.gettId());
			
			request.setAttribute("tid", result.gettId());
			
			model.addAttribute("reserveCheckData",result);
		}
		return StrResult;
	}


}
