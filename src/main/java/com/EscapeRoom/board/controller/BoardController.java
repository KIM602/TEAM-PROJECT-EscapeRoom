package com.EscapeRoom.board.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.EscapeRoom.admin.command.ProjectAdminCommand;
import com.EscapeRoom.admin.command.ProjectAdminFooterCommand;
import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.board.dao.BoardDao;
import com.EscapeRoom.board.dto.EventDto;
import com.EscapeRoom.board.dto.NoticeDto;
import com.EscapeRoom.reserve.command.ReserveCommand;
import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.theme.command.ThemeCommand;
import com.EscapeRoom.util.Constant;

@Controller
public class BoardController {	
	
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
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	//admin 통계 작업용으로 가져옴
	//예약 다오
	private ReserveDao rdao;
	private ReserveCommand rcom;
	private ThemeCommand tcom;
	
	@Autowired
	public void setRdao(ReserveDao rdao) {
		this.rdao = rdao;
		Constant.rdao = rdao;
	}
	
	@RequestMapping("/MonthTotal")
	public String MonthTotal() {
		return "board/MonthTotal";
	}
	
	@RequestMapping(value="/mTotalCount", produces="application/text; charset=UTF8")
	@ResponseBody
	public String AdminMonthTotalCount(HttpServletRequest request, Model model) {
		System.out.println("ym값1 : " + request.getParameter("ym"));
		
		rcom = new AdminMonthTotalCountCommand();
		rcom.execute(request, model);
		System.out.println("req값1 : " + (String)request.getAttribute("AdminMonthTotalCount"));
		
		String result = (String)request.getAttribute("AdminMonthTotalCount");
		System.out.println("성공1");
		
		return result + " 건";
	}
	
	@RequestMapping(value="/mTotalSales", produces="application/text; charset=UTF8")
	@ResponseBody
	public String AdminMonthTotalSales(HttpServletRequest request, Model model) {
		System.out.println("ym값2 : " + request.getParameter("ym"));
		
		rcom = new AdminMonthTotalSalesCommand();
		rcom.execute(request, model);
		System.out.println("req값2 : " + request.getAttribute("AdminMonthTotalSales"));
		
		int result = (Integer)request.getAttribute("AdminMonthTotalSales");
		

		DecimalFormat df = new DecimalFormat("###,###");
		String str;
		
		if(result == 0) {			
			str = "0 원";
		}
		else {
			str = df.format(result) + " 원";
		}
		return str;
	}
	
	@RequestMapping("/mBestList")
	public String AdminMonthBest(HttpServletRequest request, Model model) {
		rcom = new AdminMonthBestCommand();
		rcom.execute(request, model);
		
		rcom = new AdminMonthBest3Command();
		rcom.execute(request, model);
		tcom = new AdminMonthBest3ImgCommand();
		tcom.execute(request, model);
		
		
		return "board/mList";
	}
	
	
		
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	private BoardDao dao;
	@Autowired
	public void setDao(BoardDao dao) {
		this.dao = dao;
		Constant.bdao = dao;
	}
	
	
	@RequestMapping("/about")
	public String about(HttpServletRequest request, Model model) {
		
		//footer 출력으로 추가
		com = new ProjectAdminFooterCommand();
		com.execute(request, model);
		
		return "board/about";
	}
	
	
	@RequestMapping("/board1")
	public String board1() {
		return "board/board1";
	}
	@RequestMapping("/board2")
	public String board2() {
		return "board/board2";
	}
	
	@RequestMapping("/admin_board1")
	public String admin_board1() {
		return "board/admin_board1";
	}
	@RequestMapping("/admin_board2")
	public String admin_board2() {
		return "board/admin_board2";
	}
	
	
	@RequestMapping("/noticeBoard")
	public String noticeBoard(HttpServletRequest request, Model model) {
		System.out.println("noticeBoard요청");
		int tn = dao.totalNotice();
		model.addAttribute("totalNotice", tn);
		return "board/noticeBoard";
	}
	@RequestMapping("/admin_noticeBoard")
	public String admin_noticeBoard(HttpServletRequest request, Model model) {
		System.out.println("admin_noticeBoard요청");
		int tn = dao.totalNotice();
		model.addAttribute("totalNotice", tn);
		return "board/admin_noticeBoard";
	}
	
	@RequestMapping("/eventBoard")
	public String eventBoard(HttpServletRequest request, Model model) {
		System.out.println("eventBoard요청");
		int te = dao.totalEvent();
		model.addAttribute("totalEvent", te);
		return "board/eventBoard";
	}
	@RequestMapping("/admin_eventBoard")
	public String admin_eventBoard(HttpServletRequest request, Model model) {
		System.out.println("admin_eventBoard요청");
		int te = dao.totalEvent();
		model.addAttribute("totalEvent", te);
		return "board/admin_eventBoard";
	}
	
	@RequestMapping("/writeNoticeForm")
	public String writeNoticeForm() {
		System.out.println("writeNoticeForm요청");
		return "board/writeNoticeForm";
	}
	@RequestMapping("/writeEventForm")
	public String writeEventForm() {
		System.out.println("writeEventForm요청");
		return "board/writeEventForm";
	}
	
	
	@RequestMapping(value = "/writeNotice", produces = "application/text; charset=UTF-8")
	public String writeNotice(HttpServletRequest request, Model model) {
		System.out.println("writeNotice 요청");
		dao.writeNotice(request.getParameter("bTitle"), request.getParameter("bContent"), request.getParameter("bWriter"));
		return "redirect:admin_board1";
	}
	@RequestMapping(value = "/writeEvent", produces = "application/text; charset=UTF-8")
	public String writeEvent(HttpServletRequest request, Model model) {
		System.out.println("writeEvent 요청");
		dao.writeEvent(request.getParameter("bTitle"), request.getParameter("bContent"), request.getParameter("bWriter"));
		return "redirect:admin_board2";
	}
	
	
	@RequestMapping("/viewNotice")
	public String viewNotice(HttpServletRequest request, Model model) {
		System.out.println("viewNotice요청");

		//조회수 증가
		System.out.println("조회수 증가");
		dao.countNotice(Integer.parseInt(request.getParameter("bNum")));
		
		NoticeDto dto = dao.viewNotice(Integer.parseInt(request.getParameter("bNum")));
		model.addAttribute("viewNotice", dto);
		return "board/viewNotice";
	}
	@RequestMapping("/admin_viewNotice")
	public String admin_viewNotice(HttpServletRequest request, Model model) {
		System.out.println("admin_viewNotice요청");

		//조회수 증가
		System.out.println("조회수 증가");
		dao.countNotice(Integer.parseInt(request.getParameter("bNum")));
		
		NoticeDto dto = dao.viewNotice(Integer.parseInt(request.getParameter("bNum")));
		model.addAttribute("viewNotice", dto);
		return "board/admin_viewNotice";
	}
	
	@RequestMapping("/viewEvent")
	public String viewEvent(HttpServletRequest request, Model model) {
		System.out.println("viewEvent요청");
		
		//조회수 증가
		System.out.println("조회수 증가");
		dao.countEvent(Integer.parseInt(request.getParameter("bNum")));
		
		EventDto dto = dao.viewEvent(Integer.parseInt(request.getParameter("bNum")));
		model.addAttribute("viewEvent", dto);
		return "board/viewEvent";
	}
	@RequestMapping("/admin_viewEvent")
	public String admin_viewEvent(HttpServletRequest request, Model model) {
		System.out.println("admin_viewEvent요청");
		
		//조회수 증가
		System.out.println("조회수 증가");
		dao.countEvent(Integer.parseInt(request.getParameter("bNum")));
		
		EventDto dto = dao.viewEvent(Integer.parseInt(request.getParameter("bNum")));
		model.addAttribute("viewEvent", dto);
		return "board/admin_viewEvent";
	}
	
	
	
	@RequestMapping(value="/editNoticeForm", method = RequestMethod.POST)
	public String editNoticeForm(HttpServletRequest request, Model model) {
		NoticeDto dto = dao.viewNotice(Integer.parseInt(request.getParameter("bNum")));
		model.addAttribute("viewNotice", dto);
		return "board/editNoticeForm";
	}	
	@RequestMapping(value="/editEventForm", method = RequestMethod.POST)
	public String editEventForm(HttpServletRequest request, Model model) {
		EventDto dto = dao.viewEvent(Integer.parseInt(request.getParameter("bNum")));
		model.addAttribute("viewEvent", dto);
		return "board/editEventForm";
	}
	
	
	@RequestMapping(value = "/editNotice", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String editNotice(HttpServletRequest request, Model model) {
		dao.editNotice(Integer.parseInt(request.getParameter("bNum")), request.getParameter("bTitle"), request.getParameter("bContent"));
		return "redirect:admin_viewNotice?bNum=" + request.getParameter("bNum");
	}
	@RequestMapping(value = "/editEvent", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String editEvent(HttpServletRequest request, Model model) {
		dao.editEvent(Integer.parseInt(request.getParameter("bNum")), request.getParameter("bTitle"), request.getParameter("bContent"));
		return "redirect:admin_viewEvent?bNum=" + request.getParameter("bNum");
	}
	
	@RequestMapping(value = "/deleteNotice", method = RequestMethod.POST)
	public String deleteNotice(HttpServletRequest request, Model model) {
		dao.deleteNotice(Integer.parseInt(request.getParameter("bNum")));
		return "redirect:admin_board1";
	}
	@RequestMapping(value = "/deleteEvent", method = RequestMethod.POST)
	public String deleteEvent(HttpServletRequest request, Model model) {
		dao.deleteEvent(Integer.parseInt(request.getParameter("bNum")));
		return "redirect:admin_board2";
	}
	
	@RequestMapping("/plistN")
	public String plistN(HttpServletRequest request, Model model) {
		System.out.println("plistN요청");
		int tn = dao.totalNotice();
		model.addAttribute("totalNotice", tn);
		
		ArrayList<NoticeDto> nlist = dao.pageListN(request.getParameter("pageNo"));
		model.addAttribute("nPage", nlist);
		
		return "board/pageBoardN";
	}
	@RequestMapping("/admin_plistN")
	public String admin_plistN(HttpServletRequest request, Model model) {
		System.out.println("admin_plistN요청");
		int tn = dao.totalNotice();
		model.addAttribute("totalNotice", tn);
		
		ArrayList<NoticeDto> nlist = dao.pageListN(request.getParameter("pageNo"));
		model.addAttribute("nPage", nlist);
		
		return "board/admin_pageBoardN";
	}
	
	
	@RequestMapping("/plistE")
	public String plistE(HttpServletRequest request, Model model) {
		System.out.println("plistE요청");
		int tn = dao.totalEvent();
		model.addAttribute("totalEvent", tn);
		
		ArrayList<EventDto> elist = dao.pageListE(request.getParameter("pageNo"));
		model.addAttribute("ePage", elist);
		
		return "board/pageBoardE";
	}
	@RequestMapping("/admin_plistE")
	public String admin_plistE(HttpServletRequest request, Model model) {
		System.out.println("admin_plistE요청");
		int tn = dao.totalEvent();
		model.addAttribute("totalEvent", tn);
		
		ArrayList<EventDto> elist = dao.pageListE(request.getParameter("pageNo"));
		model.addAttribute("ePage", elist);
		
		return "board/admin_pageBoardE";
	}
	
	
}
