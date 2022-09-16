package com.EscapeRoom.theme.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.theme.dto.ThemeDto;
import com.EscapeRoom.util.Constant;

public class Top3ImageCommand implements ThemeCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		ThemeDao tdao = Constant.tdao;
		
		String tid1 = (String)request.getAttribute("tid1");
		String tid2 = (String)request.getAttribute("tid2");
		String tid3 = (String)request.getAttribute("tid3");
		
		System.out.println("tid1은" + tid1);
		System.out.println("tid2은" + tid2);
		System.out.println("tid3은" + tid3);
		
		ThemeDto tdto = tdao.top3Image(tid1);
		model.addAttribute("theme1",tdto);
		tdto = tdao.top3Image(tid2);
		model.addAttribute("theme2",tdto);
		tdto = tdao.top3Image(tid3);
		model.addAttribute("theme3",tdto);
		
		System.out.println("execute tdto는"+tdto);
	}

}
