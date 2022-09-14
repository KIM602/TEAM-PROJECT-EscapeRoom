package com.EscapeRoom.reserve.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.reserve.dto.ReserveDto2;

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
	public ReserveDto reserveFindCheck(ReserveDto dto) {
			ReserveDto Rdto = sqlSession.selectOne("reserveFindCheck",dto); // SelectOne메서드를 사용하여 가져온 2개의 정보로 쿼리 값을 가져옴
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
		ArrayList<ReserveDto> result = (ArrayList)sqlSession.selectList("ReserveList");
		return result;
	}
	@Override
	public ArrayList<ReserveDto> CalendarChoiceReserverList(ReserveDto rdto) {
		ArrayList<ReserveDto> result = (ArrayList)sqlSession.selectList("CalendarChoiceReserverList",rdto);
		return result;
	}


	
}
