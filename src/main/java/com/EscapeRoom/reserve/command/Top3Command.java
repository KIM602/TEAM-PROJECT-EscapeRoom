package com.EscapeRoom.reserve.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto3;
import com.EscapeRoom.util.Constant;

public class Top3Command implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		ReserveDao rdao = Constant.rdao;
		
		ReserveDto3 dto = new ReserveDto3("null","null","null");
		
		ArrayList<ReserveDto3> rlist = rdao.Top3(dto);
		model.addAttribute("rlist", rlist);
		System.out.println("³¡");
	}

}
