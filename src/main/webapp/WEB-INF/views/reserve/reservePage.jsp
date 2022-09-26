<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>JSP</title>
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
<!-- reservePage css -->
<link href='css/reserve/reservePage.css' rel='stylesheet' />

</head>
<body>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- nav 메뉴버튼 -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


<%@include file ="../main/menubar.jsp" %>
    
<div id="fullDiv">
	<div id="headerDiv">
		<div id="headerTitleDiv">
		<a href="TodayReserveAvailable">test용</a>
			<span class="reserve-title">화곡 RESERVATION</span>
			<span class="reserve-title1">경험해보고 싶었던 “새로운 세상”</span>
			<span class="reserve-title2">사실감 넘치는 인테리어와 신기하고 신선한 문제와 트릭 장치 그리고 전문작가의 흥미진진한 스토리까지!</span>
		</div>
		<div id="reserveCheckCancleDiv">
			<a class="step-btn2 hover1" type="button" id="reserveCheckCancle">
				예약확인/취소
			</a>
		</div>	
		
	</div>
	
		<div id="reserveRegion">			
			<div class="box-step">
				<dl class="date-choice">
					<dt>
						<a class="round">STEP 1 </a>
						시간
					</dt>
					<ddd id="includeCallendar">
						<jsp:include page="calendar.jsp"></jsp:include>
					</ddd>
				</dl>
				<dl class="theme-choice">
					<dt>
						<a class="round">STEP 2</a>
						테마
					</dt>
					<dd class="theme" id="indexListAjax">
					</dd>
				</dl>
				<dl class="time-choice">
					<dt>
						<a class="round">STEP 3</a>
						시간
					</dt>
					<dd class="time">
						<div class="bs-bb resscrolldesign clear-b" id="themeTimeWrap">
						</div>
					</dd>
				</dl>
				<dl class="poster-choice">
					<dt>
						<a class="round">STEP 4 </a>
						 사진
					</dt>
					<dd id="themeImage">
						
					</dd>
					
				</dl>
				
			</div>
				<div style="text-align: center">
					<a class="step-btn1 rounded-pill hover1" type="button" id="nextBtn">NEXT</a>
				</div>
			</div>	
		
	</div>
	<%@include file ="../main/footer.jsp" %>
	
	
	<script type="text/javascript">
	$(document).ready(function name() {
		$("#reserveCheckCancle").click(function name() {
			$.ajax({
				url : "reserveCheckCanclePage",
				type : "get",
				data : "",
				success : function name(d) {
					$("#reserveRegion").html(d);
					$("#reserveCheckCancle").text("예약하러 가기");
					$("#reserveCheckCancle").attr("href","reservePage");
				},
				error : function name() {
					alert("예약체크/확인실패");
				}
			})
		})
	})
	
	</script>
	
</body>

</html>