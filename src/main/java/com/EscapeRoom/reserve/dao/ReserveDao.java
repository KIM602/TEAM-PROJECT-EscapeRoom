package com.EscapeRoom.reserve.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.EscapeRoom.reserve.dto.ReserveDto;

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
		ReserveDto Rdto = sqlSession.selectOne("reserveFindCheck",dto);

		if (Rdto == null ) {
			return null;
		}
		else {
			System.out.println("dad에서 Rdto값은요?" + Rdto);
			return Rdto;
		}
		
		
	}
	
}
