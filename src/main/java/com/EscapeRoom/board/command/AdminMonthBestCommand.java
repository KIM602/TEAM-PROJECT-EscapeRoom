package com.EscapeRoom.board.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.board.dao.BoardDao;
import com.EscapeRoom.reserve.command.ReserveCommand;
import com.EscapeRoom.reserve.dto.ReserveDto4;
import com.EscapeRoom.util.Constant;

public class AdminMonthBestCommand implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BoardDao dao = Constant.bdao;
		String ym = request.getParameter("ym");
		
		ReserveDto4 dto = new ReserveDto4(null, null, ym, null);
		
		ArrayList<ReserveDto4> mlist = dao.AdminMonthBest(dto);
		
		
		model.addAttribute("mList", mlist);
		request.setAttribute("AdminMonthBest", mlist);
		
	}

}
