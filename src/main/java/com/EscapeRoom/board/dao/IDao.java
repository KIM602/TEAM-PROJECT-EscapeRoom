package com.EscapeRoom.board.dao;

import java.util.ArrayList;

import com.EscapeRoom.board.dto.EventDto;
import com.EscapeRoom.board.dto.NoticeDto;
import com.EscapeRoom.reserve.dto.ReserveDto;

public interface IDao {
	
	//월별 예약 건수
	public String AdminMonthTotalCount(String ym);
	/*
	select count(*) from reserve
	where rdate between
	'2022-09-01' and '2022-09-30';
	 */
	
	//월별 매출액
	public ReserveDto AdminMonthTotalSales(ReserveDto dto);
	/*
	select sum(rprice) from reserve
	where rdate between
	'2022-09-01' and '2022-09-30';
	 */
	
	//월별 테마 예약 순위
	/*
	select count(rthemename) as cnt, rthemename
	from reserve
	where rdate between
	'2022-09-01' and '2022-09-30'
	group by rthemename
	order by count(rthemename) desc;
	 */
	
	
	
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
