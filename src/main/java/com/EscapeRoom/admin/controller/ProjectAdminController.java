package com.EscapeRoom.admin.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.EscapeRoom.admin.command.ProjectAdminCommand;
import com.EscapeRoom.admin.command.ProjectAdminIdcheckCommand;
import com.EscapeRoom.admin.command.ProjectAdminJoinCommand;
import com.EscapeRoom.admin.command.ProjectAdminMainCommand;
import com.EscapeRoom.admin.command.ProjectAdminMainModifyCommand;
import com.EscapeRoom.admin.command.ProjectAdminMainWriteCommand;
import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.admin.dto.ProjectAdminMainDto;
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
	
	//아이디 중복 체크
	@RequestMapping(value="/idcheck" , produces="application/text; charset=UTF-8")
	@ResponseBody
	public String idcheck(HttpServletRequest request, Model model) {
		com = new ProjectAdminIdcheckCommand();
		com.execute(request, model);
		
		String result = (String)request.getAttribute("result");
		System.out.println("result : " + result);
		if(result.equals("success")) {
			return "idcheck-success";
		}
		else {
			return "idcheck-failed";
		}
	}
	
	//login창 화면
	@RequestMapping("/AdminLoginView")
	public String AdminLoginView() {
		System.out.println("AdminLoginView 요청");
		return "admin/AdminLoginView";
	}
	
	//
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
		
		return "admin/DashBoardMain";


	}
	
	//로그인처리
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
	
	//로그아웃
	@RequestMapping("/AdminLogoutView")
	public String AdminLogoutView()	{
		System.out.println("AdminLogoutView 요청");
		return "admin/AdminLogoutView";
	}
	
	//어드민 접근 잘못됐을때,
	@RequestMapping("/error")
	public String error() {
		System.out.println("error page 요청");
		return "admin/error";
	}
	
	//대시보드 메인페이지로 이동하게
	@RequestMapping("/DashBoardMain")
	public String DashBoardMain() {
		System.out.println("DashBoardMain 요청");
		return "admin/DashBoardMain";
	}
	
	//메인 이미지 등록 페이지 mapping
	@RequestMapping("/MainRegistration")
	public String MainRegistration() {
		System.out.println("MainRegistration 요청");
		return "admin/MainRegistration";
	}
	
	//메인 이미지 DB 등록 처리
	@RequestMapping("/MainInsert")
	public	String MainInsert(MultipartHttpServletRequest mrequest, Model model) {
		System.out.println("Main img DB등록 요청");
		
		String lImage = null;
		String mImageNormal = null;
		String mImageEvent = null;
		
		MultipartFile mfL = mrequest.getFile("lImage");
		MultipartFile mfN = mrequest.getFile("mImageNormal");
		MultipartFile mfE = mrequest.getFile("mImageEvent");
		
		String pathA = "C:/Users/kimj1/git/EscapeRoom/src/main/webapp/resources/upimage/";
		String pathB = "C:/project/server/apache-tomcat-9.0.65/wtpwebapps/EscapeRoom_security/resources/upimage/";	
		
		String orignalFileNameL = mfL.getOriginalFilename();
		String orignalFileNameN = mfN.getOriginalFilename();
		String orignalFileNameE = mfE.getOriginalFilename();
		
		long prename = System.currentTimeMillis();
	
		long fileSizeL = mfL.getSize();
		long fileSizeN = mfN.getSize();
		long fileSizeE = mfE.getSize();
	
		String safeFileA1 = pathA + prename + orignalFileNameL;
		String safeFileA2 = pathA + prename + orignalFileNameN;
		String safeFileA3 = pathA + prename + orignalFileNameE;
	
		String safeFileB1 = pathB + prename + orignalFileNameL;
		String safeFileB2 = pathB + prename+ orignalFileNameN;
		String safeFileB3 = pathB + prename + orignalFileNameE;
	
		lImage = prename + orignalFileNameL;
		mImageNormal = prename + orignalFileNameN;
		mImageEvent = prename + orignalFileNameE;
	
		ProjectAdminMainDto adto = new ProjectAdminMainDto(lImage,	mImageNormal,mImageEvent);
	
		mrequest.setAttribute("adto", adto);
	
		com = new ProjectAdminMainWriteCommand();
		com.execute(mrequest, model);
	
		Map<String, Object> map = model.asMap();
		
		String res = (String)map.get("result");
		
		System.out.println("res : " + res);
		
		if(res.equals("success")) {
			try {
				mfL.transferTo(new File(safeFileA1));
				mfN.transferTo(new File(safeFileA2));
				mfE.transferTo(new File(safeFileA3));
				
				Files.copy(Paths.get(safeFileA1),Paths.get(safeFileB1));
				Files.copy(Paths.get(safeFileA2),Paths.get(safeFileB2));
				Files.copy(Paths.get(safeFileA3),Paths.get(safeFileB3));
			}
		catch (Exception e) {
			e.printStackTrace();
		}
			return "redirect:main";
		}
		else {
			return "main";
		}
	}
	
	//메인이미지 수정 페이지 mapping
	@RequestMapping("/MainModify")
	public String mainModify() {
		return "admin/MainModify";
	}
	
	//메인이미지 수정 처리
	@RequestMapping(value="/mainModify", produces = "application/text; charset=UTF-8")
	public String mainModify(MultipartHttpServletRequest mrequest, Model model) {
		
		String lImage = null;
		String mImageNormal = null;
		String mImageEvent = null;
		
		MultipartFile mfL = mrequest.getFile("lImage");
		MultipartFile mfN = mrequest.getFile("mImageNormal");
		MultipartFile mfE = mrequest.getFile("mImageEvent");
		
		String pathA = "C:/Users/kimj1/git/EscapeRoom/src/main/webapp/resources/upimage/";
		String pathB = "C:/project/server/apache-tomcat-9.0.65/wtpwebapps/EscapeRoom_security/resources/upimage/";	
		
		String orignalFileNameL = mfL.getOriginalFilename();
		String orignalFileNameN = mfN.getOriginalFilename();
		String orignalFileNameE = mfE.getOriginalFilename();
		
		long prename = System.currentTimeMillis();
	
		long fileSizeL = mfL.getSize();
		long fileSizeN = mfN.getSize();
		long fileSizeE = mfE.getSize();
	
		String safeFileA1 = pathA + prename + orignalFileNameL;
		String safeFileA2 = pathA + prename + orignalFileNameN;
		String safeFileA3 = pathA + prename + orignalFileNameE;
	
		String safeFileB1 = pathB + prename + orignalFileNameL;
		String safeFileB2 = pathB + prename+ orignalFileNameN;
		String safeFileB3 = pathB + prename + orignalFileNameE;
	
		lImage = prename + orignalFileNameL;
		mImageNormal = prename + orignalFileNameN;
		mImageEvent = prename + orignalFileNameE;
	
		ProjectAdminMainDto adto = new ProjectAdminMainDto(lImage,	mImageNormal,mImageEvent);
	
		mrequest.setAttribute("adto", adto);
		
		com = new ProjectAdminMainModifyCommand();
		com.execute(mrequest, model);
		
		Map<String, Object> map = model.asMap();
		
		String res = (String)map.get("result");
		
		System.out.println("res : " + res);
		
		if(res.equals("success")) {
			try {
				mfL.transferTo(new File(safeFileA1));
				mfN.transferTo(new File(safeFileA2));
				mfE.transferTo(new File(safeFileA3));
				
				Files.copy(Paths.get(safeFileA1),Paths.get(safeFileB1));
				Files.copy(Paths.get(safeFileA2),Paths.get(safeFileB2));
				Files.copy(Paths.get(safeFileA3),Paths.get(safeFileB3));
			}
		catch (Exception e) {
			e.printStackTrace();
		}
			return "redirect:main";
		}
		else {
			return "main";
		}
	}
	
	
	//로그인 관련 일반메서드
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
