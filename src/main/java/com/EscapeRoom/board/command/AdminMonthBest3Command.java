package com.EscapeRoom.board.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.board.dao.BoardDao;
import com.EscapeRoom.reserve.command.ReserveCommand;
import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto4;
import com.EscapeRoom.util.Constant;

public class AdminMonthBest3Command implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BoardDao bdao = Constant.bdao;
		String ym = request.getParameter("ym");
		
		ReserveDto4 dto = new ReserveDto4(null, null, ym, null);
		
		ArrayList<ReserveDto4> rlist = bdao.AdminMonthTop3(dto);
		
		if(rlist.size() != 0 ) {
			model.addAttribute("rlist", rlist);
			
			for(int i=0; i<rlist.size(); i++) {
				request.setAttribute(("tid"+(i+1)), rlist.get(i).gettId());
			}
		}
		
	}

}
