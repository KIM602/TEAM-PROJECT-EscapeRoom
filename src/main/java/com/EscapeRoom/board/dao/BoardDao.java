package com.EscapeRoom.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.EscapeRoom.board.dto.EventDto;
import com.EscapeRoom.board.dto.NoticeDto;
import com.EscapeRoom.reserve.dto.ReserveDto4;
import com.EscapeRoom.theme.dto.ThemeDto;

public class BoardDao implements IDao {
	
	//빈을 주입받는 어노테이션
	@Autowired
	private SqlSession sqlSession;
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 예약 통계 관련
	
	@Override
	public String AdminMonthTotalCount(String ym) {
		String rdto = sqlSession.selectOne("AdminMonthTotalCount", ym);
		return rdto;
	}
	
	@Override
	public int AdminMonthTotalSales(String ym) {
		String rdto = sqlSession.selectOne("AdminMonthTotalSales", ym);
		int result;
		if(rdto == null) {
			result = 0;
		}
		else {
			result = Integer.parseInt(rdto);
		}
		System.out.println("result값 : " + result);
		return result;
	}
	
	@Override
	public ArrayList<ReserveDto4> AdminMonthBest(ReserveDto4 dto) {
		ArrayList<ReserveDto4> dtos = (ArrayList)sqlSession.selectList("AdminMonthBest", dto);
		return dtos;
	}
	
	//월별 top3용 이미지 가져오기
	@Override
	public ThemeDto AdminMonthBestImg(String tid) {
		ThemeDto dto = sqlSession.selectOne("AdminMonthBestImg", tid);
		return dto;
	}
	@Override
	public ArrayList<ReserveDto4> AdminMonthTop3(ReserveDto4 dto) {
		System.out.println("top3 dto값 : " + dto);
		ArrayList<ReserveDto4> result = (ArrayList)sqlSession.selectList("AdminMonthTop3", dto);
		
		System.out.println("dao result크기 : " + result.size());
		
		return result;
	}
	
	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	@Override
	public void writeNotice(String bTitle, String bContent, String bWriter) {
		NoticeDto dto = new NoticeDto(bTitle, bContent, bWriter);
		sqlSession.insert("writeNotice", dto);
	}

	@Override
	public void writeEvent(String bTitle, String bContent, String bWriter) {
		EventDto dto = new EventDto(bTitle, bContent, bWriter);
		sqlSession.insert("writeEvent", dto);
	}

	@Override
	public ArrayList<NoticeDto> listNotice() {
		ArrayList<NoticeDto> result = (ArrayList)sqlSession.selectList("listNotice");
		return result;
	}

	@Override
	public ArrayList<EventDto> listEvent() {
		ArrayList<EventDto> result = (ArrayList)sqlSession.selectList("listEvent");
		return result;
	}

	@Override
	public void deleteNotice(int bNum) {
		sqlSession.delete("deleteNotice", bNum);
	}

	@Override
	public void deleteEvent(int bNum) {
		sqlSession.delete("deleteEvent", bNum);
	}

	@Override
	public NoticeDto viewNotice(int bNum) {
		NoticeDto result = sqlSession.selectOne("viewNotice", bNum);
		return result;
	}

	@Override
	public EventDto viewEvent(int bNum) {
		EventDto result = sqlSession.selectOne("viewEvent", bNum);
		return result;
	}

	@Override
	public void countNotice(int bNum) {
		NoticeDto dto = new NoticeDto(bNum);
		sqlSession.update("countNotice", dto);
	}

	@Override
	public void countEvent(int bNum) {
		EventDto dto = new EventDto(bNum);
		sqlSession.update("countEvent", dto);
	}

	@Override
	public void editNotice(int bNum, String bTitle, String bContent) {
		NoticeDto dto = new NoticeDto(bNum, bTitle, bContent);
		sqlSession.update("editNotice", dto);
	}

	@Override
	public void editEvent(int bNum, String bTitle, String bContent) {
		EventDto dto = new EventDto(bNum, bTitle, bContent);
		sqlSession.update("editEvent", dto);
	}

	@Override
	public int totalNotice() {
		return sqlSession.selectOne("totalNotice");
	}

	@Override
	public int totalEvent() {
		return sqlSession.selectOne("totalEvent");
	}

	
	
	@Override
	public ArrayList<NoticeDto> listN() {
		ArrayList<NoticeDto> dtos = (ArrayList)sqlSession.selectList("listN");
		return dtos;
	}

	@Override
	public ArrayList<EventDto> listE() {
		ArrayList<EventDto> dtos = (ArrayList)sqlSession.selectList("listE");
		return dtos;
	}

	@Override
	public ArrayList<NoticeDto> pageListN(String pageNo) {
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		ArrayList<NoticeDto> result = (ArrayList)sqlSession.selectList("pageListN", startNo);
		return result;
	}

	@Override
	public ArrayList<EventDto> pageListE(String pageNo) {
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		ArrayList<EventDto> result = (ArrayList)sqlSession.selectList("pageListE", startNo);
		return result;
	}

	
}
