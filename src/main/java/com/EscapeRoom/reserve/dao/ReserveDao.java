package com.EscapeRoom.reserve.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.reserve.dto.ReserveDto2;

import com.EscapeRoom.reserve.dto.ReserveDto3;

import com.EscapeRoom.reserve.dto.startNoRdate;


public class ReserveDao implements RdaoInterface {
	
	@Autowired //빈을 주입받는 어노테이션
	private SqlSession sqlSession;

	@Override
	public void insertReserve(ReserveDto dto) {
		sqlSession.insert("insertReserve",dto);
		
	}

	// 테마 시간 체크
	@Override
	public ReserveDto themeReserveTimeCheck(ReserveDto dto) {
		ReserveDto Rdto = sqlSession.selectOne("themeReserveTimeCheck",dto);
		return Rdto;
		
	}

	// 예약자가 진짜 있는지 유무 체크 및
	// 예약자 네임과 폰번호로 데이터 가져오기
	@Override
	public ArrayList<ReserveDto> reserveFindCheck(ReserveDto dto) {
			ArrayList<ReserveDto> Rdto = (ArrayList)sqlSession.selectList("reserveFindCheck",dto); // SelectOne메서드를 사용하여 가져온 2개의 정보로 쿼리 값을 가져옴
			System.out.println("Rdto값은 ? " + Rdto);
			return Rdto;
		
	}
	//예약삭제
	@Override
	public void deleteReserve(String rId) {
		sqlSession.delete("deleteReserve",rId);
		
	}

	@Override
	public ArrayList<ReserveDto2> reserveTop31(ReserveDto2 dto2) {
		ArrayList<ReserveDto2> result = (ArrayList)sqlSession.selectList("reserveTop31");
		return result;
	}
	
	@Override
	public ArrayList<ReserveDto> ReserverList() {
		ArrayList<ReserveDto> result = (ArrayList)sqlSession.selectList("reserveList");
		return result;
	}
	@Override
	public ArrayList<ReserveDto> CalendarChoiceReserverList(ReserveDto rdto) {
		ArrayList<ReserveDto> result = (ArrayList)sqlSession.selectList("calendarChoiceReserverList",rdto);
		return result;
	}
	@Override
	public ArrayList<ReserveDto> ReservePageList(String pageNo) {
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		ArrayList<ReserveDto> result = (ArrayList)sqlSession.selectList("reservePageList",startNo);
		return result;
		
	}
	@Override
	public ArrayList<ReserveDto> CalendarChoiceReserverPageList(String pageNo, String rDate) {
		int page = Integer.parseInt(pageNo);
		int startNo = (page - 1) * 10 + 1;
		
		startNoRdate snr = new startNoRdate(startNo, rDate);
		
		ArrayList<ReserveDto> result = (ArrayList)sqlSession.selectList("calendarChoiceReserverPageList",snr);
		return result;
	}
	
	//top3
	@Override
	public ArrayList<ReserveDto3> Top3(ReserveDto3 dto) {
		ArrayList<ReserveDto3> result = (ArrayList)sqlSession.selectList("Top3");
		return result;
	}
	@Override
	public int ReserveListTotal() {
		int result = sqlSession.selectOne("ReserveListTotal");
		return result;
	}
	@Override
	public int CalendarChoiceReserverListTotal(String ymd) {
		int result = sqlSession.selectOne("CalendarChoiceReserverListTotal",ymd);
		return result;
	}
}
