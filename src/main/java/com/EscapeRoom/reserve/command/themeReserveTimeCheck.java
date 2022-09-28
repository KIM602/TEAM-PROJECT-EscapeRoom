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
		String rtime; // 모델 키값
		String theme; // 모델 키값
		for(int i=1; i<9;i++) {   // 시간은 8개 밖에 없으므로 8번 반복 
			if(i%2==1) {//i=1 / 10:20분, i=3 / 13:20분 ,i=5 /16:20분  ,i=7 / 19:20분 
				rtime = "1"+ ((i-1)*3/2) +":20";  // 값이 변하는 모델 키값을 설정하기 위함  
				theme = "theme"+i; // 키값 용도
				ReserveDto rdto = new ReserveDto(rDate,tId,rtime);
				ReserveDto rdtoSu = rdao.themeReserveTimeCheck(rdto);
				model.addAttribute(theme,rdtoSu);
				
			}
			else if(i%2==0) {
				if(i==8) { // i=8일때 20:50분 
					rtime = "20:50"; // 키값 용도
					theme = "theme"+i; // 키값 용도
					ReserveDto rdto = new ReserveDto(rDate,tId,rtime);
					ReserveDto rdtoSu = rdao.themeReserveTimeCheck(rdto);
					model.addAttribute(theme,rdtoSu);
				}
				else { // i=2 / 11:50, i=4 / 14:50, i=6 / 17:50;
					rtime = "1"+ ((i-1)*3/2) + ":50"; //키값 용도
					theme = "theme"+i;  // 키값 용도
					ReserveDto rdto = new ReserveDto(rDate,tId,rtime);
					ReserveDto rdtoSu = rdao.themeReserveTimeCheck(rdto);
					model.addAttribute(theme,rdtoSu);
				}
			}
		}	
	
//		String rTime1 = "10:20";
//		String rTime2 = "11:50";
//		String rTime3 = "13:20";
//		String rTime4 = "14:50";
//		String rTime5 = "16:20";
//		String rTime6 = "17:50";
//		String rTime7 = "19:20";
//		String rTime8 = "20:50";
//		
//		
//		// 10시20분
//		ReserveDto rdto1 = new ReserveDto(rDate, tId,rTime1); 
//		ReserveDto rdtoSu1 = rdao.themeReserveTimeCheck(rdto1);
//		model.addAttribute("theme1",rdtoSu1);
//		// 11시50분
//		ReserveDto rdto2 = new ReserveDto(rDate, tId,rTime2); 
//		ReserveDto rdtoSu2 = rdao.themeReserveTimeCheck(rdto2);
//		model.addAttribute("theme2",rdtoSu2);
//		// 13시20분
//		ReserveDto rdto3 = new ReserveDto(rDate, tId,rTime3); 
//		ReserveDto rdtoSu3 = rdao.themeReserveTimeCheck(rdto3);
//		model.addAttribute("theme3",rdtoSu3);
//		// 14시50분
//		ReserveDto rdto4 = new ReserveDto(rDate, tId,rTime4); 
//		ReserveDto rdtoSu4 = rdao.themeReserveTimeCheck(rdto4);
//		model.addAttribute("theme4",rdtoSu4);
//		// 16시20분
//		ReserveDto rdto5 = new ReserveDto(rDate, tId,rTime5); 
//		ReserveDto rdtoSu5 = rdao.themeReserveTimeCheck(rdto5);
//		model.addAttribute("theme5",rdtoSu5);
//		
//		//String theme = "theme"+i+1) 
//		// 17시50분
//		ReserveDto rdto6 = new ReserveDto(rDate, tId,rTime6); 
//		ReserveDto rdtoSu6 = rdao.themeReserveTimeCheck(rdto6);
//		model.addAttribute("theme6",rdtoSu6);
//		// 19시20분
//		ReserveDto rdto7 = new ReserveDto(rDate, tId,rTime7); 
//		ReserveDto rdtoSu7 = rdao.themeReserveTimeCheck(rdto7);
//		model.addAttribute("theme7",rdtoSu7);
//		// 20시50분
//		ReserveDto rdto8 = new ReserveDto(rDate, tId,rTime8); 
//		ReserveDto rdtoSu8 = rdao.themeReserveTimeCheck(rdto8);
//		model.addAttribute("theme8",rdtoSu8);


	}

}
