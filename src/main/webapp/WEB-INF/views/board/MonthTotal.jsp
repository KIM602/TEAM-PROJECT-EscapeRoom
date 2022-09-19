<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<title>월별 통계 페이지</title>

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

<style>

#calendar>* {
	font-size: 15px;
	font-family: 'GmarketSansBold';
}
</style>


<script>
var today = new Date();

function buildCalendar() {
	var row = null
	var cnt = 0;
	var calendarMonth = document.getElementById("calendar");
	var calendarMonthTitle = document.getElementById("calendarTitle");
	calendarMonthTitle.innerHTML = today.getFullYear()+"년 "+(today.getMonth()+1)+"월";
		
	clickedYear = today.getFullYear(); // 오늘년도
	clickedMonth = today.getMonth()+1; // 오늘월
	
	
	var firstDate = new Date(today.getF)
	
	
	console.log("clickedYear",clickedYear);
	console.log("clickedMonth",clickedMonth);
	
	clickedMonth = clickedMonth >= 10 ? clickedMonth : "0" + clickedMonth;
	clickedYM = clickedYear + "-" + clickedMonth;
	
	
	console.log("clickedMonth",clickedMonth);
	
	$(".monthNow").html(clickedMonth);
}


function nextCalendar() {
	today = new Date(today.getFullYear(), today.getMonth()+1);
	buildCalendar();
}
function prevCalendar() {
	today = new Date(today.getFullYear(), today.getMonth()-1);
	buildCalendar();
}


</script>



<script type="text/javascript">
	document.onload=buildCalendar();
</script>

</head>
<body>

<div class="container mt-5">
	<h3>월별 통계 페이지</h3>
	
	<div id="calendar">
		<div class="btn-group">
			<button type="button" class="btn btn-dark" onclick="prevCalendar()">◀</button>
			<button type="button" class="btn btn-dark" id="calendarTitle"></button>
			<button type="button" class="btn btn-dark" onclick="nextCalendar()">▶</button>
		</div>
	</div>
	<br/>
	<div style="border: 1px solid lightgrey; border-radius: 25px; padding: 30px; ">
		<div style="font-size: 18px; font-weight: bold;"><span class="monthNow">n</span>월 예약 건수</div><br/>
		<div id="mTotalCount">: 123</div>
		<hr/>
		
		<div style="font-size: 18px; font-weight: bold;"><span class="monthNow">n</span>월 매출 총액</div><br/>
		<div id="mTotalSales">: 456</div>
		<hr/>
		
		<div style="font-size: 18px; font-weight: bold;"><span class="monthNow">n</span>월 테마 예약 순위</div>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<hr/>
	</div>
</div>

<script>
$(document).ready(function() {
	$.ajax({
		url: "mTotalCount",
		type: "get",
		data: {ym:clickedYM},
		success: function(d) {
			$("#mTotalCount").html(d);
		},
		error : function() {				
			alert("에러");
		}
	});
});


</script>

</body>
</html>


