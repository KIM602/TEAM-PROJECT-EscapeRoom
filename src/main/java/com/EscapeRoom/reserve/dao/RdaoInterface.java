package com.EscapeRoom.reserve.dao;

import java.util.ArrayList;


import com.EscapeRoom.reserve.dto.ReserveDto;

import com.EscapeRoom.reserve.dto.ReserveDto3;
import com.EscapeRoom.reserve.dto.TodayReserveTidDto;

public interface RdaoInterface {
	// 추상메서드
	public void insertReserve(ReserveDto dto);
	public ReserveDto themeReserveTimeCheck(ReserveDto dto);
	public ArrayList<ReserveDto> reserveFindCheck(ReserveDto dto);
	public void deleteReserve(String rId);

	public ArrayList<ReserveDto> ReserverList();

	public ArrayList<ReserveDto> CalendarChoiceReserverList(ReserveDto rdto);
	public ArrayList<ReserveDto> ReservePageList(String pageNo);
	public ArrayList<ReserveDto> CalendarChoiceReserverPageList(String pageNo,String rDate);


	public ArrayList<ReserveDto3> Top3(ReserveDto3 dto);
	public int ReserveListTotal();
	public int CalendarChoiceReserverListTotal(String ymd);
	public ArrayList<ReserveDto> ReserveFindMoreThan2DetailPage(ReserveDto rdto);
	
	public int todayReservethemeCheck(TodayReserveTidDto dto);
	
	

	
}
