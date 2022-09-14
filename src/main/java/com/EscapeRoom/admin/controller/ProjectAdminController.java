package com.EscapeRoom.admin.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.EscapeRoom.admin.command.ProjectAdminCommand;
import com.EscapeRoom.admin.command.ProjectAdminJoinCommand;
import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.admin.util.Constant;

@Controller
public class ProjectAdminController {
	
	private ProjectAdminCommand com;
	
	//암호화 처리 bean
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		Constant.passwordEncoder = passwordEncoder;
	}
	
	//ProjectAdminDao bean
	private ProjectAdminDao edao;
	@Autowired
	public void setEdao(ProjectAdminDao edao) {
		this.edao = edao;
		Constant.edao = edao;
	}
	
	@RequestMapping("/AdminJoinView")
	public String JoinView() {
		System.out.println("JoinView요청");
		return "admin/AdminJoinView";
	}
	
	//회원가입처리
	@RequestMapping("/join")
	public String join(HttpServletRequest request, Model model) {
		System.out.println("join 요청");
		com = new ProjectAdminJoinCommand();
		com.execute(request, model);
		
		String result = (String)request.getAttribute("result");
		
		if(result.equals("success")) {
			System.out.println("success");
			return "admin/AdminLoginView";
		}
		else {
			return "join-failed";
		}
	}
	
	//login창 화면
	@RequestMapping("/AdminLoginView")
	public String AdminLoginView() {
		System.out.println("AdminLoginView 요청");
		return "admin/AdminLoginView";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		System.out.println("AdminLoginView 요청");
		return "admin/AdminLoginView";
	}
	
	//login성공처리
	@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("login 성공 후 이동 요청");
		
		getUsername(authentication,request);
		String username = (String)request.getAttribute("username");
		String auth = (String)request.getAttribute("auth");
		
		return "admin/DashBoardMain2";
		
	}
	
	
	@RequestMapping("/processLogin")
	public ModelAndView processLogin(
			@RequestParam(value="login", required = false) String login,
			@RequestParam(value="error", required = false) String error,
			@RequestParam(value="logout", required = false) String logout,
			HttpSession session, Model pmodel
			) {
		System.out.println("processLogin 요청");
		ModelAndView model = new ModelAndView();
		if(login != null && login != "") {
			model.addObject("login", "로그인 전");
		}
		if(error != null && error != "") { //로그인 실패 시 processLogin?error=1
			model.addObject("error", "입력한 정보가 올바르지 않습니다.");
		}
		if(logout != null && logout != "") { //processLogin?logout=1
			model.addObject("logout", "성공적으로 로그아웃 되었습니다.");
		}
		
		model.setViewName("admin/AdminLoginView");
		return model;
			
	}
	
	//logout
	@RequestMapping("/AdminLogoutView")
	public String AdminLogoutView()	{
		System.out.println("AdminLogoutView 요청");
		return "admin/AdminLogoutView";
	}
	
	//error
	@RequestMapping("/error")
	public String error() {
		System.out.println("error page 요청");
		return "admin/error";
	}
	
	//DashBoardMain
	@RequestMapping("/DashBoardMain")
	public String DashBoardMain() {
		System.out.println("DashBoardMain 요청");
		return "admin/DashBoardMain";
	}
	
	private void getUsername(Authentication authentication, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		System.out.println(userDetails.getUsername()); //로그인한 아이디
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		String auth = authorities.toString(); //role를 얻어서 문자열 반환
		System.out.println(auth); //[ROLE_USER]형태
		request.setAttribute("username", username);
		request.setAttribute("auth", auth);
	}
	
}
