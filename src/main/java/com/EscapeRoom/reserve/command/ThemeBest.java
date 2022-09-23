package com.EscapeRoom.reserve.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.reserve.dto.ReserveDto2;
import com.EscapeRoom.reserve.dto.ReserveDto4;
import com.EscapeRoom.reserve.dto.TodayReserveCheckDto;
import com.EscapeRoom.theme.dto.ThemeDto;
import com.EscapeRoom.util.Constant;

public class ThemeBest implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		ReserveDao rdao = Constant.rdao;
		
		ReserveDto2 rdto = new ReserveDto2(null, null, null);
		ArrayList<ReserveDto2> blist =  rdao.ThemeBest(rdto);
		
		
		
		
		String tid = null; // request Set키값명
		String rank = null;  // request Set키값명
		String cnt = null; // request Set키값명
		
		
		for(int j=1; j<10; j++) {
			String ThemeList = "ThemeList"+j;
			
			TodayReserveCheckDto tList = (TodayReserveCheckDto) model.asMap().get(ThemeList);
			String ThemeListTid = tList.gettId();
			System.out.println("ThemeListTid"+ThemeListTid);
				
			for(int i=0;i<blist.size();i++) {
				
				tid = "tid" + (0+i); // 테마 아이디  request Set키값명
				rank = "rank" + (0+i); // 순위 request Set키값명
				cnt = "cnt" + (0+i); // 횟수 request Set키값명
				request.setAttribute(tid, blist.get(i).getTid());
				request.setAttribute(rank, blist.get(i).getRank());
				request.setAttribute(cnt, blist.get(i).getCnt());
				
				String Tid = (String) request.getAttribute(tid); // request get용도
				String Rank = (String) request.getAttribute(rank); // request get용도
				String Cnt = (String) request.getAttribute(cnt); // request get용도
				
				if(Tid.equals(ThemeListTid)) { // 문자열 비교
					String bestList = "bestList" + j; // 베스트리스트는 ThemeList와 값이 일치해야 하므로 j번호로 이름을 세팅
					System.out.println("bestList" + bestList);
					System.out.println("ThemeListTid = " + ThemeList + " and Tid = " + Tid );
					System.out.println("Rank = " + Rank);
					rdto= new ReserveDto2(Cnt, Rank, Tid); //저장소
					model.addAttribute(bestList,rdto); // 모델의 저장
				}
			}
			
		}
		
		
				
				

	}

}
