package com.EscapeRoom.reserve.dao;

import java.util.ArrayList;


import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.reserve.dto.ReserveDto2;
import com.EscapeRoom.reserve.dto.ReserveDto3;
import com.EscapeRoom.reserve.dto.TodayReserveTidDto;

public interface RdaoInterface {
	// 추상메서드
	public void insertReserve(ReserveDto dto);
	public ReserveDto themeReserveTimeCheck(ReserveDto dto);
	public ArrayList<ReserveDto> reserveFindCheck(ReserveDto dto);
	public void deleteReserve(String rId);

	public ArrayList<ReserveDto> reserverList();

	public ArrayList<ReserveDto> calendarChoiceReserverList(ReserveDto rdto);
	public ArrayList<ReserveDto> reservePageList(String pageNo);
	public ArrayList<ReserveDto> calendarChoiceReserverPageList(String pageNo,String rDate);


	public ArrayList<ReserveDto3> Top3(ReserveDto3 dto);
	public int reserveListTotal();
	public int calendarChoiceReserverListTotal(String ymd);
	public ArrayList<ReserveDto> reserveFindMoreThan2DetailPage(ReserveDto rdto);
	
	public int todayReservethemeCheck(TodayReserveTidDto dto);
	
	public ArrayList<ReserveDto2> themeBest(ReserveDto2 rdto);
	
	

	
}
