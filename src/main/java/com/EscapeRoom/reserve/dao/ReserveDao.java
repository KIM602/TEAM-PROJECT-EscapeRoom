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

	// 예약자가 진짜 있는지 유무 체크
	@Override
	public String reserveFindCheck(ReserveDto dto) {
		String result = null;
		
		try {
			int res = sqlSession.selectOne("reserveFindCheck",dto);
			System.out.println("res"+res);
			if (res>0) {
				result="success";
			}
			else {
				result="failed";
			}
		}
		catch (Exception e) {
			e.getMessage();
			result="failed";
		}
		
		
			
		
		
		
		return result;
		
	}
	
}
