package com.EscapeRoom.reserve.dao;

import com.EscapeRoom.reserve.dto.ReserveDto;

public interface RdaoInterface {
	// 추상메서드
	public void insertReserve(ReserveDto dto);
	public ReserveDto themeReserveTimeCheck(ReserveDto dto);
	public ReserveDto reserveFindCheck(ReserveDto dto);
	
}
