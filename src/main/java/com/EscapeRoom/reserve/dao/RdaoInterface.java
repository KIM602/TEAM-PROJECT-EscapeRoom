package com.EscapeRoom.reserve.dao;

import java.util.ArrayList;


import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.reserve.dto.ReserveDto2;

public interface RdaoInterface {
	// 추상메서드
	public void insertReserve(ReserveDto dto);
	public ReserveDto themeReserveTimeCheck(ReserveDto dto);
	public ReserveDto reserveFindCheck(ReserveDto dto);
	public void deleteReserve(String rId);
	public ArrayList<ReserveDto2> reserveTop31(ReserveDto2 dto2);
	public ArrayList<ReserveDto> ReserverList();
	ArrayList<ReserveDto> CalendarChoiceReserverList(ReserveDto rdto);
	ArrayList<ReserveDto> ReservePageList(String pageNo);
	ArrayList<ReserveDto> CalendarChoiceReserverPageList(String pageNo,String rDate);
	
}
