<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/> 
<title>JSP bean 사용</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">

@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#caledar>tbody>tr>td:checked {
    background-color: #ff3f3e;
    color: #fff;
}

#calendar {
    margin-left:auto; 
    margin-right:auto;
    border-spacing: 0.8vw;
  	border-collapse: separate;
}

#calendar>tbody>tr>td {
	font-size : 1.5rem;
	  width: 30px;
	  font-family: 'GmarketSansBold'
    
};


</style>


<script type="text/javascript">
var absolutetoday = new Date(); //미사용
var today = new Date();
var ymd = null
function buildCalendar() {
	var row = null
	var cnt = 0;
	var calendarTable = document.getElementById("calendar");
	var calendarTableTitle = document.getElementById("calendarTitle");
	calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
	var firstDate = new Date(today.getFullYear(), today.getMonth(),1);
	var lastDate = new Date(today.getFullYear(), today.getMonth()+1,0);

	console.log("퍼스트",firstDate);	
	console.log("라스트",lastDate);	
	//var day = ('0' + today.getDate());
	//console.log(day);
	
	
	while(calendarTable.rows.length > 2){
		calendarTable.deleteRow(calendarTable.rows.length-1);
	}
	
	row = calendarTable.insertRow(); // 열 추가
	// 달의 첫달 빈칸 생성
	for(i=0; i<firstDate.getDay(); i++) { // getDay() 주7일을 숫자로 리턴 (일:0,월:1 ...)
		cell = row.insertCell(); // 셀 추가 
		cnt += 1;
	}
	
	// 달력에 요일 채우기
	for(i=1; i<= lastDate.getDate();i++){ // getDate() 로컬타임의 일 수를 숫자로 리턴 31일이면 31리턴
		cell = row.insertCell(); // 셀 추가 
		cnt += 1; 
		
		// 행이 늘어남 id 1씩.. id2 =2 id3=3 씩늘어남
		cell.setAttribute("id",i);   // 속성 추가 id와 i값
		cell.innerHTML = i; // id값의 i를 부여
		cell.align = "center";  // 중앙정렬
	
		
		// 특수효과 누르면 값 출력
		cell.onclick = function() {
			
			var s = document.getElementsByName("choice");
		
			for(var i=0; i<s.length; i++) {
				s[i].removeAttribute('style');
			}
			
			this.style.backgroundColor='#F9D142'; // 색상 부여
		    this.style.padding='1px';
		    this.style.borderRadius='5px';
		    this.style.color='#292826';
			
			this.setAttribute('name', 'choice')  // 구분을 위한 네임값 부여
			
			
			clickedYear = today.getFullYear(); // 오늘년도
			clickedMonth = today.getMonth()+1; // 오늘월
			clickedDate = this.getAttribute("id");
			console.log("clickedYear",clickedYear);
			console.log("clickedMonth",clickedMonth);
			console.log("clickedDate",clickedDate);
			
			clickedDate = clickedDate >= 10 ? clickedDate : "0" + clickedDate; // 한자리 수는 0을 붙여줌
			clickedMonth = clickedMonth >= 10 ? clickedMonth : "0" + clickedMonth; // 위와 같음
			clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate; // 값을 yyyy-mm-dd 식으로 나타내기 위함
		
			console.log("clickedDate",clickedDate);
			console.log("clickedMonth",clickedMonth);
			console.log("clickedYMD",clickedYMD);
			
			ymd = clickedYMD; 

			$.ajax({
				url : "themeNameList", // 날짜값을 넘겨줄곳
				type : "get",
				data : {ymd:ymd}, // Json객체 방식으로 넘김
				contentType : "application/json; charset=utf-8;",
				success: function(data){
					$("#indexListAjax").html(data); // 성공시 바뀔 로딩될 페이지 부분
				},
				error:function(data){
					alert("어림없지"); 
				}
			})
			
		}
		
		// cnt가 7이 되면 즉 = 마지막요일이되면
		if(cnt % 7 == 0 ){ 
			row = calendar.insertRow(); // 열을 추가하여 다음 열로 진입 
		}
		
		// 일요일 빨강
		if (cnt % 7 == 1) {
			cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
		}  
	 	// 토요일 파랑 효과
		if (cnt % 7 == 0){
			cell.innerHTML = "<font color=skyblue>" + i + "</font>";
			row = calendar.insertRow();
		}
		
	}
	
	// 달력의 마지막날 빈칸 행으로 채우기
	if(cnt % 7 != 0) { //cnt가 7이 아닌경우
		for(i = 0; i<7- (cnt%7); i++) { 
			cell = row.insertCell(); // 열을 추가하여 다음열로 진입
		}
	}	
	
}
function nextCalendar() { // 다음 달
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());

	buildCalendar();
}
function prevCalendar() { // 이전 달
	

		today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());

		buildCalendar();

}




</script>
</head>

<body onload="buildCalendar()">
<table id="calendar">
	<tr>
		<td><label onclick="prevCalendar()"> ◀ </label></td>
		<td colspan="5" id="calendarTitle" style="text-align:center">yyyy년 m월</td>
		<td><label onclick="nextCalendar()"> ▶ </label></td>
	</tr>
	<tr>
		<td><font color ="#F79DC2">일</font></td>
		<td>월</td>
		<td>화</td>
		<td>수</td>
		<td>목</td>
		<td>금</td>
		<td><font color ="skyblue">토</font></td>
	</tr>
		
		
</table>



</body>
</html>