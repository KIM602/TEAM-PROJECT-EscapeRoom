package com.EscapeRoom.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.EscapeRoom.board.dao.BoardDao;
import com.EscapeRoom.board.dto.EventDto;
import com.EscapeRoom.board.dto.NoticeDto;

@Controller
public class BoardController {
	
	private BoardDao dao;
	@Autowired
	public void setDao(BoardDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping("/index")
	public String index() {
		return "main/Main";
	}
	
	
	@RequestMapping("/about")
	public String about() {
		return "board/about";
	}
	
	
	@RequestMapping("/board")
	public String board() {
//		int tn = dao.totalNotice();
//		int te = dao.totalEvent();
//		model.addAttribute("totalNotice", tn);
//		model.addAttribute("totalEvent", te);
//		
//		ArrayList<NoticeDto> nList = dao.listNotice();
//		ArrayList<EventDto> eList = dao.listEvent();
//		model.addAttribute("nboard", nList);
//		model.addAttribute("eboard", eList);
		return "board/board";
	}
	
	@RequestMapping("/admin_board")
	public String admin_board() {
		return "board/admin_board";
	}
	
	
	@RequestMapping("/noticeBoard")
	public String noticeBoard(HttpServletRequest request, Model model) {
		System.out.println("noticeBoard요청");
		int tn = dao.totalNotice();
		model.addAttribute("totalNotice", tn);

//		ArrayList<NoticeDto> nList = dao.listNotice();
//		model.addAttribute("nboard", nList);
		return "board/noticeBoard";
	}
	@RequestMapping("/admin_noticeBoard")
	public String admin_noticeBoard(HttpServletRequest request, Model model) {
		System.out.println("admin_noticeBoard요청");
		int tn = dao.totalNotice();
		model.addAttribute("totalNotice", tn);
		
//		ArrayList<NoticeDto> nList = dao.listNotice();
//		model.addAttribute("nboard", nList);
		return "board/admin_noticeBoard";
	}
	
	@RequestMapping("/eventBoard")
	public String eventBoard(HttpServletRequest request, Model model) {
		System.out.println("eventBoard요청");
		int te = dao.totalEvent();
		model.addAttribute("totalEvent", te);
		
//		ArrayList<EventDto> eList = dao.listEvent();
//		model.addAttribute("eboard", eList);
		return "board/eventBoard";
	}
	@RequestMapping("/admin_eventBoard")
	public String admin_eventBoard(HttpServletRequest request, Model model) {
		System.out.println("admin_eventBoard요청");
		int te = dao.totalEvent();
		model.addAttribute("totalEvent", te);
		
//		ArrayList<EventDto> eList = dao.listEvent();
//		model.addAttribute("eboard", eList);
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
		return "redirect:admin_board";
	}
	
	@RequestMapping(value = "/writeEvent", produces = "application/text; charset=UTF-8")
	public String writeEvent(HttpServletRequest request, Model model) {
		System.out.println("writeEvent 요청");
		dao.writeEvent(request.getParameter("bTitle"), request.getParameter("bContent"), request.getParameter("bWriter"));
		return "redirect:admin_board";
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
	
	
	
	@RequestMapping("/editNoticeForm")
	public String editNoticeForm(HttpServletRequest request, Model model) {
		NoticeDto dto = dao.viewNotice(Integer.parseInt(request.getParameter("bNum")));
		model.addAttribute("viewNotice", dto);
		return "board/editNoticeForm";
	}	
	@RequestMapping("/editEventForm")
	public String editEventForm(HttpServletRequest request, Model model) {
		EventDto dto = dao.viewEvent(Integer.parseInt(request.getParameter("bNum")));
		model.addAttribute("viewEvent", dto);
		return "board/editEventForm";
	}
	
	
	@RequestMapping(value = "/editNotice", produces = "application/text; charset=UTF-8")
	public String editNotice(HttpServletRequest request, Model model) {
		dao.editNotice(Integer.parseInt(request.getParameter("bNum")), request.getParameter("bTitle"), request.getParameter("bContent"));
		return "redirect:admin_viewNotice?bNum=" + request.getParameter("bNum");
	}
	@RequestMapping(value = "/editEvent", produces = "application/text; charset=UTF-8")
	public String editEvent(HttpServletRequest request, Model model) {
		dao.editEvent(Integer.parseInt(request.getParameter("bNum")), request.getParameter("bTitle"), request.getParameter("bContent"));
		return "redirect:admin_viewEvent?bNum=" + request.getParameter("bNum");
	}
	
	@RequestMapping("/deleteNotice")
	public String deleteNotice(HttpServletRequest request, Model model) {
		dao.deleteNotice(Integer.parseInt(request.getParameter("bNum")));
		return "redirect:admin_board";
	}
	@RequestMapping("/deleteEvent")
	public String deleteEvent(HttpServletRequest request, Model model) {
		dao.deleteEvent(Integer.parseInt(request.getParameter("bNum")));
		return "redirect:admin_board";
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
