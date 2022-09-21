package com.EscapeRoom.board.dao;

import java.util.ArrayList;

import com.EscapeRoom.board.dto.EventDto;
import com.EscapeRoom.board.dto.NoticeDto;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.reserve.dto.ReserveDto4;
import com.EscapeRoom.theme.dto.ThemeDto;

public interface IDao {
	
	//월별 예약 건수
	public String AdminMonthTotalCount(String ym);
		
	//월별 매출액
	public int AdminMonthTotalSales(String ym);
	
	//월별 테마 예약 순위
	public ArrayList<ReserveDto4> AdminMonthBest(ReserveDto4 dto);
	
	//월별 top3 테마 이미지
	ArrayList<ReserveDto4> AdminMonthTop3(ReserveDto4 dto);
	public ThemeDto AdminMonthBestImg(String tid);
	
	
	public void writeNotice(String bTitle, String bContent, String bWriter);
	public void writeEvent(String bTitle, String bContent, String bWriter);
	public ArrayList<NoticeDto> listNotice();
	public ArrayList<EventDto> listEvent();
	public void deleteNotice(int bNum);
	public void deleteEvent(int bNum);
	public NoticeDto viewNotice(int bNum);
	public EventDto viewEvent(int bNum);
	public void countNotice(int bNum);
	public void countEvent(int bNum);
	public void editNotice(int bNum, String bTitle,String bContent);
	public void editEvent(int bNum, String bTitle,String bContent);
	public int totalNotice();
	public int totalEvent();
	public ArrayList<NoticeDto> listN();
	public ArrayList<EventDto> listE();
	public ArrayList<NoticeDto> pageListN(String pageNo);
	public ArrayList<EventDto> pageListE(String pageNo);



}
