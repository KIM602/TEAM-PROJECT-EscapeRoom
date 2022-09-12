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
			ReserveDto Rdto = sqlSession.selectOne("reserveFindCheck",dto); // SelectOne메서드를 사용하여 가져온 2개의 정보로 쿼리 값을 가져옴
			System.out.println("Rdto값은 ? " + Rdto);
			return Rdto;
		
	}

	@Override
	public void deleteReserve(String rId) {
		sqlSession.delete("deleteReserve",rId);
		
	}
	
	// 예약삭제
	
	
}
