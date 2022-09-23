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
		
		if(rlist.size() != 0) {
			model.addAttribute("rlist", rlist);
			
			for(int i=0; i<rlist.size(); i++) {
				request.setAttribute(("tid"+(i+1)), rlist.get(i).getTid());
			}
		}
		
		/*
		request.setAttribute("tid1", rlist.get(0).getTid());
		request.setAttribute("tid2", rlist.get(1).getTid());
		request.setAttribute("tid3", rlist.get(2).getTid());
		
		System.out.println("rlist" + rlist.get(0).getTid());
		
		model.addAttribute("rlist", rlist);
		System.out.println("³¡");
		 */
	}

}
