package com.EscapeRoom.reserve;

import java.text.DateFormat;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.EscapeRoom.admin.command.ProjectAdminCommand;
import com.EscapeRoom.admin.command.ProjectAdminFooterCommand;
import com.EscapeRoom.admin.command.ProjectAdminMainCommand;
import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.admin.util.Constant;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private ProjectAdminCommand com;
	
	//ProjectAdminDao bean
	private ProjectAdminDao edao;
	
	@Autowired
	public void setEdao(ProjectAdminDao edao) {
		this.edao = edao;
		Constant.edao = edao;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		com = new ProjectAdminMainCommand();
		com.execute(request, model);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main/Main";
	}
	
	@RequestMapping(value="/Homemain")
	public String main(Model model,HttpServletRequest request) {
		System.out.println("메인 이동");
		
		com = new ProjectAdminMainCommand();
		com.execute(request, model);
		
		return "main/Main";
	}
	
	// 맵이동
	@RequestMapping("/map")
	public String map(HttpServletRequest request, Model model) {
		System.out.println("map이동");
		
		com = new ProjectAdminFooterCommand();
		com.execute(request, model);
		
		return "map/map";
	}
}
