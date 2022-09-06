package com.EscapeRoom.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.EscapeRoom.board.dto.EventDto;
import com.EscapeRoom.board.dto.NoticeDto;

public class BoardDao implements IDao {
	private SqlSession sqlSession;
	
	/**
	 * 
	 */
	public BoardDao() {
		super();
	}
	
	public BoardDao(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	

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
