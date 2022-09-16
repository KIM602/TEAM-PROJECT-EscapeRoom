package com.EscapeRoom.theme.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.EscapeRoom.reserve.command.ReserveCommand;
import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.theme.command.ThemeCommand;
import com.EscapeRoom.theme.command.ThemeContentCommand;
import com.EscapeRoom.theme.command.ThemeDeleteCommand;
import com.EscapeRoom.theme.command.ThemeDetailsPageCommand;
import com.EscapeRoom.theme.command.ThemeEditCommand;
import com.EscapeRoom.theme.command.ThemeInsertCommand;
import com.EscapeRoom.theme.command.ThemeListCommand;
import com.EscapeRoom.theme.command.ThemeListPageCommand;
import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.theme.dto.ThemeDto;
import com.EscapeRoom.util.Constant;

@Controller
public class ThemeController {
	
	private ThemeCommand com;
	
	//ThemeDao bean 등록
	private ThemeDao tdao;
	
	@Autowired
	public void setTdao(ThemeDao tdao) {
		this.tdao = tdao;
		Constant.tdao = tdao;
	}
	
	// 예약 다오
	private ReserveDao rdao;
	private ReserveCommand rcom;
			
	@Autowired
	public void setRdao(ReserveDao rdao) {
		this.rdao = rdao;
		Constant.rdao = rdao;
	}
	
	//개인 폴더 주소에 맞게 변경
	private String path ="C:/Users/kyk92/git/EscapeRoom/src/main/webapp/resources/upimage/";
	private String path1 = "C:/KYK/Util/apache-tomcat-9.0.64-windows-x64/apache-tomcat-9.0.64/wtpwebapps/EscapeRoom_security/resources/upimage/";
	
	/* User page */
	//테마 페이지(리스트 불러옴)
	@RequestMapping("/themePage")
	public String themePage(HttpServletRequest request, Model model) {
		System.out.println("테마페이지요청");
		com = new ThemeListCommand();
		com.execute(request, model);
		return "theme/themePage";
	}
	
	/* Admin page */
	//테마 등록창
	@RequestMapping("/themeInsert")
	public String themeInsert() {
		System.out.println("theme이동");
		return "theme/themeInsert";
	}
	
	//테마등록처리
	@RequestMapping("/inserttheme")
	public String inserttheme(MultipartHttpServletRequest mphr, Model model) {
		System.out.println("inserttheme");
		String tid = ""; //rId는 임의로 정함(DB에서 seq넘버로 설정하니까 
		String tname = mphr.getParameter("tname");
		String tgenre = mphr.getParameter("tgenre");
		String tdifficulty = mphr.getParameter("tdifficulty");
		String ttime = mphr.getParameter("ttime");
		String tprofile = mphr.getParameter("tprofile");
		String tphoto = null; //DB에 저장할 사진이름
		
		//반환되는 파일 데이터는 MultipartFile형이고 getFile(파일속성명)로 구한다
		MultipartFile mf = mphr.getFile("tphoto");
		
		//업로드 되는 파일 저장위치 (프로젝트내, 톰캣서버내)
		//초기 신속 저장으로 바로 보여주기위해 톰캣에도 저장(war파일로 톰캣서버로 배포시는 불필요)
		
		//업로드된 파일 이름
		String originFileName = mf.getOriginalFilename();
		long prename = System.currentTimeMillis();
		long fileSize = mf.getSize();
		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);
		//저장하기위해 중복이 되는 것은 파일명을 피하기 위해 만드는 파일명
		String safeFile = path + prename + originFileName;
		String safeFiel1 = path1 + prename + originFileName;
		//DB에 저장할 파일 이름
		tphoto = prename + originFileName;
		ThemeDto tdto = new ThemeDto(tid, tname, tgenre, tdifficulty, ttime, tprofile, tphoto);
		mphr.setAttribute("tdto", tdto);
		
		com = new ThemeInsertCommand();
		com.execute(mphr, model);
		
		//model객체의 값을 추출하려면 asMap()메서드를 사용
		Map<String, Object> map = model.asMap();
		String res = (String)map.get("result");
		System.out.println("res : " + res);
		if(res.equals("success")) {
			try {
				mf.transferTo(new File(safeFile));
				mf.transferTo(new File(safeFiel1));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return "redirect:/main";
		}
		else {
			return "redirect:/main";
		}
	}
	
	//등록된 테마 목록 페이지
	@RequestMapping("/themeListPage")
	public String themeListPage(HttpServletRequest request, Model model) {
		System.out.println("themeListPage");
		com = new ThemeListPageCommand();
		com.execute(request, model);
		return "theme/themeListPage";
	}
		
	//등록된 테마 상세보기 페이지
	@RequestMapping("/themeDetailsPage")
	public String themeDetailsPage(HttpServletRequest request, Model model) {
		System.out.println("themeDetailsPage입니다");
		com = new ThemeDetailsPageCommand();
		com.execute(request, model);
		return "theme/themeDetailsPage";
	}
		
	//태마 수정 페이지
	@RequestMapping("/themeEdit")
	public String themeEdit(HttpServletRequest request, Model model) {
		System.out.println("themeEdit");
		com = new ThemeContentCommand();
		com.execute(request, model);
		return "theme/themeEdit";
	}
		
	//테마 수정 DB처리
	@RequestMapping(value="/edit", produces="application/text; charset=UTF-8")
	public String edit(MultipartHttpServletRequest request, Model model) {
		System.out.println("edit요청");
		String tid = request.getParameter("tid"); //rId는 임의로 정함(DB에서 seq넘버로 설정하니까 
		System.out.println("tid는" + tid);
		String tname = request.getParameter("tname");
		String tgenre = request.getParameter("tgenre");
		String tdifficulty = request.getParameter("tdifficulty");
		String ttime = request.getParameter("ttime");
		String tprofile = request.getParameter("tprofile");
		String tphoto = null;
		
		MultipartFile mf = request.getFile("tphoto");
	
		//업로드된 파일 이름
		String originFileName = mf.getOriginalFilename();
		long prename = System.currentTimeMillis();
		long fileSize = mf.getSize();
		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);
		
		//저장하기위해 중복이 되는 것은 파일명을 피하기 위해 만드는 파일명
		String safeFile = path + prename + originFileName;
		String safeFiel1 = path1 + prename + originFileName;
		
		//DB에 저장할 파일 이름
		tphoto = prename + originFileName;
		ThemeDto tdto = new ThemeDto(tid, tname, tgenre, tdifficulty, ttime, tprofile, tphoto);
		request.setAttribute("tdto", tdto);
		
		com = new ThemeEditCommand();
		com.execute(request, model);
		Map<String, Object> map = model.asMap();
		String res = (String)map.get("result");
		System.out.println("res : " + res);
		if(res.equals("success")) {
			try {
				mf.transferTo(new File(safeFile));
				mf.transferTo(new File(safeFiel1));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return "redirect:/main";
		}
		else {
			return "redirect:/main";
		}
	}
		
	//테마 삭제
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete요청");
		com = new ThemeDeleteCommand();
		com.execute(request, model);
		com = new ThemeListPageCommand();
		com.execute(request, model);
		return "theme/themeListPage";
	}
}
