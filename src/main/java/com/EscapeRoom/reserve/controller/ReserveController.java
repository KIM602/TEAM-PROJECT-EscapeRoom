package com.EscapeRoom.reserve.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.EscapeRoom.admin.command.ProjectAdminCommand;
import com.EscapeRoom.admin.command.ProjectAdminFooterCommand;
import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.reserve.command.CalendarChoiceReserverList;
import com.EscapeRoom.reserve.command.CalendarChoiceReserverListTotal;
import com.EscapeRoom.reserve.command.CalendarChoiceReserverPageList;
import com.EscapeRoom.reserve.command.InsertReserve;
import com.EscapeRoom.reserve.command.ReserveCommand;
import com.EscapeRoom.reserve.command.ReserveDelete;
import com.EscapeRoom.reserve.command.ReserveFind;
import com.EscapeRoom.reserve.command.ReserveListTotal;
import com.EscapeRoom.reserve.command.ReservePageList;
import com.EscapeRoom.reserve.command.ReserverList;
import com.EscapeRoom.reserve.command.Test123132;
import com.EscapeRoom.reserve.command.themeReserveTimeCheck;
import com.EscapeRoom.reserve.dao.ReserveDao;

import com.EscapeRoom.theme.command.ThemeCommand;
import com.EscapeRoom.theme.command.ThemeImageCommand;
import com.EscapeRoom.theme.command.ThemeNameListCommand;
import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.util.Constant;


@Controller
public class ReserveController {
	
	//footer 가져오기
	private ProjectAdminCommand com;
	
	//footer
	//ProjectAdminDao bean
	private ProjectAdminDao edao;
	@Autowired
	public void setEdao(ProjectAdminDao edao) {
		this.edao = edao;
		Constant.edao = edao;
	}
	
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

		//footer 출력으로 추가
		com = new ProjectAdminFooterCommand();
		com.execute(request, model);
		
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
	
	@RequestMapping("/reserveOK")
	public String reserveOK(HttpServletRequest request,Model model) {
		System.out.println("reserveOK");
		return "reserve/reserveMessagePage";
	}
	
	// 예약하는 행위
	@RequestMapping("/reserve")
	public String reserve(HttpServletRequest request,Model model) {
		System.out.println("reserve");
		rcom = new InsertReserve();
		rcom.execute(request, model);
		
		return "reserve/reservePage";
		
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

		// 예약자가 있는지 체크 유무와 예약자 정보 
		@RequestMapping(value="/reserveFind")
		public String reserveFind(HttpServletRequest request,Model model) {
			System.out.println("reserveFind");
			System.out.println("nameKey값은?"+request.getParameter("nameKey"));  
			System.out.println("phoneKey값은?"+request.getParameter("phoneKey"));
			// 스트링 타입으로 가져오려고 인터페이스말고 클래스에서 가져옴
			ReserveFind rF = new ReserveFind(); // 객체생성
			String result =(String)rF.StrExecute(request, model);  // 동작 부분 
	
		
			System.out.println("result값?" + result);
			if(result == "success") {
				
				return "reserve/reserverInformation";   
			}
			
			else if (result == "success2"){
				return "reserve/reserveInformationList";
			}
			else {	// 정상적으로 값을 가져오지 못할 시 정보 불일치 페이지로 이동
				return "reserve/reserveCheckFailPage";
			}
		}
		
		@RequestMapping("/reserveFindMoreThan2DetailPage")
		public String reserveFindMoreThan2DetailPage(HttpServletRequest request,Model model) {
			System.out.println("reserveFindMoreThan2DetailPage");
			rcom = new ReserveFind();
			rcom.execute(request, model);
			return "reserve/reserverInformation";
		}
		
		// 예약자가 예약 삭제
		@RequestMapping("/reserveDelete")
		public String reserveDelete(HttpServletRequest request,Model model) {
			System.out.println("reserveDelete");
			System.out.println("삭제 테마 id는 ? " + request.getParameter("reserveid"));
			rcom = new ReserveDelete();
			rcom.execute(request, model);
			return "reserve/reserveDeleteMessagePage";
		}
		
		
		// 테스트
		@RequestMapping("/test")
		public String test(HttpServletRequest request,Model model) {
			System.out.println("test");
			tcom = new Test123132();
			tcom.execute(request, model);
			
			return "reserve/test";
		}
		
		
		// 관리자 페이지 예약자 리스트 뽑기
		@RequestMapping("/ReserverList")
		public String ReserverList(HttpServletRequest request,Model model) {
			System.out.println("ReserverList");
			rcom = new ReserverList();
			rcom.execute(request, model);
			rcom = new ReserveListTotal();
			rcom.execute(request, model);
			
			return "admin/reserver/ReserverCheck";
		}
		// 관리자 페이지에서 테마 삭제
		@RequestMapping("AdminReserveDelete")
		public String AdminReserveDelete(HttpServletRequest request,Model model) {
			System.out.println("adminReserveDelete");
			rcom = new ReserveDelete();
			rcom.execute(request, model);
			
			return "redirect:/main";
		}
		
		// 관리자 페이지 페이지 리스트 10개 단위로 추려서 보기
		@RequestMapping("ReservePageList")
		public String ReservePageList(HttpServletRequest request,Model model) {
			System.out.println("ReservePageList");
			System.out.println(request.getParameter("pageNo"));
			
			rcom = new ReservePageList();
			rcom.execute(request, model);
			
			return "admin/reserver/ReservePageList";
		}
		
		// 관리자 페이지 달력으로 날짜 선택하여 예약자 찾기
		@RequestMapping("/CalendarChoiceReserverList")
		public String CalendarReserverList(HttpServletRequest request, Model model) {
			
			System.out.println("ymd값" + request.getParameter("ymd"));
			
			rcom = new CalendarChoiceReserverList();
			rcom.execute(request, model);
			
			rcom = new CalendarChoiceReserverListTotal();
			rcom.execute(request, model);
	
			return "admin/reserver/calendarChoiceReserveList";
		}
		
		// 관리자 페이지 달력으로 날짜 선택하여 페이지 리스트 10개 단위로 추려서 보기
		@RequestMapping("/calendarChoiceReserverPageList")
		public String CalendarChoiceReserverPageList(HttpServletRequest request, Model model) {
			System.out.println("calendarChoiceReserverPageList");
			System.out.println(request.getParameter("pageNo"));
			System.out.println("리퀘스트에서 rDate값은 ? " + request.getParameter("rDate"));
			rcom = new CalendarChoiceReserverPageList();
			rcom.execute(request, model);
			
			return "admin/reserver/calendarChoiceReserverPageList";
		}
		
		
		
}
