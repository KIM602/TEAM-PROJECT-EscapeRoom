package com.EscapeRoom.reserve.dao;

import com.EscapeRoom.reserve.dto.ReserveDto;

public interface RdaoInterface {
	// 추상메서드
	public void insertReserve(ReserveDto dto);
	public ReserveDto themeReserveTimeCheck(ReserveDto dto);
	public String reserveFindCheck(ReserveDto dto);
	public ReserveDto reserveFindCheck1(ReserveDto dto);
	
}
