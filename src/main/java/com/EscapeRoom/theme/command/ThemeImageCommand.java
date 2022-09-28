package com.EscapeRoom.theme.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.theme.dto.ThemeDto;


// 테마이미지만 공통으로 사용하는 Constant 주입하는 방식이 아닌 다른 방식으로 바꾸었다.
// ThemeImageCommand를 bean을 생성시킴
@Repository
public class ThemeImageCommand implements ThemeCommand {

	
	// themeDao Bean을 주입받음
	@Autowired
	private ThemeDao tdao;
	// reserve용도
	@Override
	public void execute(HttpServletRequest request, Model model) {
		String tId = request.getParameter("themevalue"); // 테마 id가 담겨져있는 키값 themevalue를 tId 변수에 저장
		System.out.println("tId는" + tId);
		ThemeDto tdto = tdao.themeImage(tId); // 변수를 파라메터로 이용하여 Dao 로직을 실행  타입은 Themedto로 받음
		
		System.out.println("execute tdto는"+tdto);
		model.addAttribute("theme",tdto); // 모델에 저장
		
	}

}
