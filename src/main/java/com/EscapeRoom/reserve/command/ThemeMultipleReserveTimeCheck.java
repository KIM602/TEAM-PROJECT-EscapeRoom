package com.EscapeRoom.reserve.command;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.EscapeRoom.reserve.dao.ReserveDao;
import com.EscapeRoom.reserve.dto.ReserveDto;
import com.EscapeRoom.reserve.dto.ReserveDto4;
import com.EscapeRoom.reserve.dto.TodayReserveCheckDto;
import com.EscapeRoom.reserve.dto.TodayReserveTidDto;
import com.EscapeRoom.reserve.dto.startNoRdate;
import com.EscapeRoom.theme.dao.ThemeDao;
import com.EscapeRoom.theme.dto.ThemeDto;
import com.EscapeRoom.util.Constant;

public class ThemeMultipleReserveTimeCheck implements ReserveCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		
		ReserveDao rdao = Constant.rdao;
		ThemeDao tdao = Constant.tdao;
		
		// 오늘 날짜 구하기
		Date today= new Date(); 
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = simpleDateFormat.format(today);
		
		
		// 기존 모델값 'themeList' 에서 tid값,tname,tphoto,tprofile 추출 작업
		HashMap<String, Object> map = (HashMap)model.asMap();
		ArrayList<ThemeDto> tList = (ArrayList)map.get("themeList");
		String tid = null;
		String tname = null;
		String tphoto = null;
		String tprofile = null;
		String ttime = null;
		String tdifficulty =null;
		String tgenre = null;
		
		
		
		for(int j=0;j<tList.size();j++ ) {
			// 추출작업
			tid = "tid" + j;
			tname = "tname" + j;
			tphoto = "tphoto" + j;
			tprofile = "tprofile" + j;
			ttime = "ttime" + j;
			tdifficulty = "tdifficulty" + j;
			tgenre = "tgenre" + j;
			request.setAttribute(tid, tList.get(j).getTid());
			request.setAttribute(tname, tList.get(j).getTname());
			request.setAttribute(tphoto, tList.get(j).getTphoto());
			request.setAttribute(tprofile, tList.get(j).getTprofile());
			request.setAttribute(ttime, tList.get(j).getTtime());
			request.setAttribute(tdifficulty, tList.get(j).getTdifficulty());
			request.setAttribute(tgenre, tList.get(j).getTgenre());
			
			// 변수에 저장
			String tId = (String) request.getAttribute(tid);
			String tName = (String) request.getAttribute(tname);
			String tPhoto = (String) request.getAttribute(tphoto);
			String tProfile = (String) request.getAttribute(tprofile);
			String tTime = (String) request.getAttribute(ttime);
			String tDifficulty = (String) request.getAttribute(tdifficulty);
			String tGenre = (String) request.getAttribute(tgenre);
			
			String rtime; //테마 예약 시간 저장용
			String todayCheck; // 모델명 저장용
			
			for(int i=1; i<9;i++) {   // 시간등록 
				if(i%2==1) {//i=1 / 10:20분, i=3 / 13:20분 ,i=5 /16:20분  ,i=7 / 19:20분 
					rtime = "1"+ ((i-1)*3/2) +":20";
					if(j==0) {
						todayCheck = "todayCheck"+i;
						// 예약되어있는지 체크 있으면 rCheck 1반환
						ReserveDto rdto = new ReserveDto(strToday,tId,rtime);
						ReserveDto rdtoSu = rdao.themeReserveTimeCheck(rdto);
						TodayReserveCheckDto trcDto;
						if(rdtoSu==null) { // rCheck 없는경우
							trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, 0);
						}
						else { //rCheck 있는 경우
							trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, rdtoSu.getrCheck());
						}
						model.addAttribute(todayCheck,trcDto);
						System.out.println("todayCheck값" + todayCheck);
					}
					else {
						todayCheck = "todayCheck"+j+i;
						ReserveDto rdto = new ReserveDto(strToday,tId,rtime);
						ReserveDto rdtoSu = rdao.themeReserveTimeCheck(rdto);
						TodayReserveCheckDto trcDto;
						if(rdtoSu==null) { // rCheck 없는경우
							trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, 0);
						}
						else { //rCheck 있는 경우
							trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, rdtoSu.getrCheck());
						}
						model.addAttribute(todayCheck,trcDto);
						System.out.println("todayCheck값" + todayCheck);
					}
					
				}
				
				else if(i%2==0) {
					if(i==8) { // i=8일때 20:50분
						if(j==0) {
							rtime = "20:50";
							todayCheck = "todayCheck"+i;
							ReserveDto rdto = new ReserveDto(strToday,tId,rtime);
							ReserveDto rdtoSu = rdao.themeReserveTimeCheck(rdto);
							TodayReserveCheckDto trcDto;
							if(rdtoSu==null) { // rCheck 없는경우
								trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, 0);
							}
							else { //rCheck 있는 경우
								trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, rdtoSu.getrCheck());
							}
							model.addAttribute(todayCheck,trcDto);
							System.out.println("todayCheck값" + todayCheck);
						}
						else {
							rtime = "20:50";
							todayCheck = "todayCheck"+j+i;
							ReserveDto rdto = new ReserveDto(strToday,tId,rtime);
							ReserveDto rdtoSu = rdao.themeReserveTimeCheck(rdto);
							TodayReserveCheckDto trcDto;
							if(rdtoSu==null) { // rCheck 없는경우
								trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, 0);
							}
							else { //rCheck 있는 경우
								trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, rdtoSu.getrCheck());
							}
							model.addAttribute(todayCheck,trcDto);
							System.out.println("todayCheck값" + todayCheck);
						}
						
					}
					
					else { 
						if(j==0) {
							// i=2 / 11:50, i=4 / 14:50, i=6 / 17:50;
							rtime = "1"+ ((i-1)*3/2) + ":50";
							todayCheck = "todayCheck"+i; 
							ReserveDto rdto = new ReserveDto(strToday,tId,rtime);
							ReserveDto rdtoSu = rdao.themeReserveTimeCheck(rdto);
							TodayReserveCheckDto trcDto;
							if(rdtoSu==null) { // rCheck 없는경우
								trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, 0);
							}
							else { //rCheck 있는 경우
								trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, rdtoSu.getrCheck());
							}
							model.addAttribute(todayCheck,trcDto);
							System.out.println("todayCheck값" + todayCheck);
						}
						else {
							// i=2 / 11:50, i=4 / 14:50, i=6 / 17:50;
							rtime = "1"+ ((i-1)*3/2) + ":50";
							todayCheck = "todayCheck"+j+i;
							
							ReserveDto rdto = new ReserveDto(strToday,tId,rtime);
							ReserveDto rdtoSu = rdao.themeReserveTimeCheck(rdto);
							TodayReserveCheckDto trcDto;
							if(rdtoSu==null) { // rCheck 없는경우
								trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, 0);
							}
							else { //rCheck 있는 경우
								trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, rtime, strToday, tTime, tDifficulty, tGenre, rdtoSu.getrCheck());
							}
							model.addAttribute(todayCheck,trcDto);
							System.out.println("todayCheck값" + todayCheck);
						}
					
					}
				}
			
			}
			
			//테마리스트8개 제목및 설명 추출용도
			String ThemeList = "ThemeList" + (j+1); // 테마리스트 추출
			TodayReserveCheckDto trcDto = new TodayReserveCheckDto(tId, tName, tPhoto, tProfile, null, strToday, tTime, tDifficulty, tGenre, 0);
			model.addAttribute(ThemeList,trcDto);
		
			
			String TodayReserve = "TodayReserve"+ (j+1);
			// 테마id별 당일 예약이 되어있는지 확인용
			TodayReserveTidDto Trdt = new TodayReserveTidDto(strToday, null, tId);
			int result = rdao.todayReservethemeCheck(Trdt);
			
			
			// 하루의 한 테마는 8개의 시간표가 존재함 
			if(result == 8) { // 8개의 결과값이 뜨면 해당 테마는 모두 예약 종료된상태임
				String rCheckFinish = "finish";
				model.addAttribute(TodayReserve,rCheckFinish);
			}
			else {
				String rCheckFinish = "NotYet";
				model.addAttribute(TodayReserve,rCheckFinish);
			}
	
		}
	}

}
