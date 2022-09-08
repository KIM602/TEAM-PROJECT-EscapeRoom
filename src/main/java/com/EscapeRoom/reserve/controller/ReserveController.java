package com.EscapeRoom.reserve.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.EscapeRoom.reserve.command.InsertReserve;
import com.EscapeRoom.reserve.command.ReserveCommand;
import com.EscapeRoom.reserve.command.reserveFind;
import com.EscapeRoom.reserve.command.themeReserveTimeCheck;
import com.EscapeRoom.reserve.dao.ReserveDao;

import com.EscapeRoom.theme.command.ThemeCommand;
import com.EscapeRoom.theme.command.ThemeImageCommand;
import com.EscapeRoom.theme.command.ThemeNameListCommand;
import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.util.Constant;


@Controller
public class ReserveController {

	//테마 네임 리스트 가져오기용도
	private ThemeCommand tcom;
	private ThemeDao tdao;
	
	// 예약 다오
	private ReserveDao rdao;
	private ReserveCommand rcom;
	
	@Autowired
	public void setRdao(ReserveDao rdao) {
		this.rdao = rdao;
		Constant.rdao = rdao;
	}

	@Autowired
	public void setTdao(ThemeDao tdao) {
		this.tdao = tdao;
		Constant.tdao = tdao;
	}
	
	// 테마 네임리스트 모음
	@RequestMapping("/themeNameList")
	public String themeNameList(HttpServletRequest request, Model model) {
		System.out.println("테마네임입니다");
		
		System.out.println("ymd값" + request.getParameter("ymd"));
		model.addAttribute("ymd",request.getParameter("ymd"));
		tcom = new ThemeNameListCommand();
		tcom.execute(request, model);
		
		return "theme/themeNameList";
	}
	
	// 예약에서 테마를 선택하여 값을 받아 이미지 출력 
	@RequestMapping("/imageView")
	public String imageView(HttpServletRequest request, Model model) {
		System.out.println("themevalue값은" + request.getParameter("themevalue"));
		System.out.println("넘어온ymd값은" + request.getParameter("ymd"));
		model.addAttribute("ymd",request.getParameter("ymd"));
		
		
		tcom = new ThemeImageCommand();
		tcom.execute(request, model);
		
		return "theme/themeImage";

	}
	
	// 예약페이지 이동
	@RequestMapping("/reservePage")
	public String reservePage(HttpServletRequest request, Model model) {
		System.out.println("reservePage");

		return "reserve/reservePage";
	}
	
	// 예약하기 상세정보
	@RequestMapping("/reserveForm")
	public String reserveForm(HttpServletRequest request,Model model) {
		System.out.println("reserveForm이동");
		model.addAttribute("ymd",request.getParameter("ymd"));
		model.addAttribute("themeTime",request.getParameter("themeTime"));
		// 
		tcom = new ThemeImageCommand();
		tcom.execute(request, model);
		
		return "reserve/reserveForm";
	}
	
	// 예약하는 행위
	@RequestMapping("/reserve")
	public String reserve(HttpServletRequest request,Model model) {
		System.out.println("reserve");
		rcom = new InsertReserve();
		rcom.execute(request, model);
		
		return "main/Main";
		
	}

	// 테마 시간 비어있는지 확인하면서 불러오기 (ajax용도)
	@RequestMapping("/themeReserveTimeCheck" )
	public String themeReserveTimeCheck(HttpServletRequest request,Model model) {
		System.out.println("themeReserveTimeCheck");
		model.addAttribute("ymd",request.getParameter("ymd"));
		model.addAttribute("themevalue",request.getParameter("themevalue"));
		System.out.println("ymd값 : " + request.getParameter("ymd"));
		System.out.println("themevalue값 : " + request.getParameter("themevalue"));
		
		rcom = new themeReserveTimeCheck();
		rcom.execute(request, model);
		
		return "reserve/reserveTime";
	}
	
	
	// 예약확인/관리 페이지 이동
		@RequestMapping("/reserveCheckCanclePage")
		public String reserveCheckCanclePage(HttpServletRequest request, Model model) {
			System.out.println("reserveCheckCanclePage");
			return "reserve/reserveCheckCanclePage";
		}

	// 예약확인 
		@RequestMapping(value="/reserveFind",produces = "application/text; charset=UTF8")
		@ResponseBody
		public String reserveFind(HttpServletRequest request,Model model) {
			System.out.println("reserveFind");
			System.out.println("nameKey값은?"+request.getParameter("nameKey"));
			System.out.println("phoneKey값은?"+request.getParameter("phoneKey"));
			rcom = new reserveFind();
			rcom.execute(request, model);
			
			String result = (String)request.getAttribute("result");
			System.out.println("최종 result값"+result);
			
			if(result.equals("success")) {
				System.out.println("리턴을 find-success");
				return "find-success";
			}
			else{
				System.out.println("리턴을 find-failed");
				return "find-failed";
			}
			
		}
		// 예약확인 
		@RequestMapping(value="/reserveFind1")
		public String reserveFind1(HttpServletRequest request,Model model) {
			System.out.println("reserveFind");
			System.out.println("nameKey값은?"+request.getParameter("nameKey"));
			System.out.println("phoneKey값은?"+request.getParameter("phoneKey"));
			rcom = new reserveFind();
			rcom.execute(request, model);
			
			return "reserve/hihi"; 
			
		}

}
