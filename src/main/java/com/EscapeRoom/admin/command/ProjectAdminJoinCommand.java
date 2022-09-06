package com.EscapeRoom.admin.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.admin.dto.ProjectAdminJoinDto;
import com.EscapeRoom.admin.util.Constant;

public class ProjectAdminJoinCommand implements ProjectAdminCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		//암호화 객체
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		
		String bid = request.getParameter("pid");
		String bpw = request.getParameter("ppw");
		String bname = request.getParameter("pname");
		String boaddress = request.getParameter("poaddress");
		String baddress = request.getParameter("paddress");
		String bdetailaddress = request.getParameter("pdetailaddress");
		String bnumber = request.getParameter("pnumber");
		
		String bpw_org = bpw; //bpw_org = 암호화 전 pw
		
		bpw = passwordEncoder.encode(bpw_org); //encode 메서드로 암호화
		System.out.println(bpw + " size " + bpw.length());
		
		ProjectAdminJoinDto dto = new ProjectAdminJoinDto(bid, bpw, bname, boaddress, baddress, bdetailaddress, bnumber, null);
		
		ProjectAdminDao edao = Constant.edao;
		String result = edao.join(dto);
		
		request.setAttribute("result", result);
	}

}
