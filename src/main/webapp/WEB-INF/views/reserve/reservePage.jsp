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




<style type="text/css">
@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

*{ font-family: 'GmarketSansBold';
}

.reserve-title {
    position: relative;
    text-align: left;
    font-size: 40px;
    font-weight: 700;
    padding-top: 40px;
}
.reserve-title1 {
    position: relative;
    text-align: left;
    font-size: 30px;
    font-weight: 600;
}
.reserve-title2 {
    position: relative;
    text-align: left;
    font-size: 15px;
    font-weight: 400;
}
.box-step {
    overflow: hidden;
    width: 100%;
    margin: 50px 0;
    border: 0.5px solid #d6d6d6;
    border-top: none;
    font-size: 15px;
    background: white;
    display : flex;
}
.box-step dl {
    width: 25%;
    
    border-top: 1px solid #e0e0e0;
}
.box-step>dl>dd {
 
    padding: 19px 30px;
    border-left: ;

}
.box-step>dl>ddd {
   
    padding: 19px 30px;
    border-left: ;
}
.box-step>dl>dt {
    padding: 18px 30px 18px;
    background: #fff;
    color: #000;
    text-align:center;
    font-size: 1.5rem;
    border:;
}
.round {
    display: inline-block;
    padding: 0px 20px;
    border-radius: 10px;
    background: #F9D142;
    color: #292826;
    font-size: 1.5rem;
    vertical-align: middle;
}

.theme-choice>.theme {
    overflow-y: scroll;
    height: 23vw;
    padding-right: 0.521vw;
}
.date-choice>.includeCallendar {
    overflow-y: scroll;
    
    padding-right: 0.521vw;
}
.theme-choice>label {
    position: relative;
    display: block;
    width: 100%;
    margin-bottom: 0.521vw;
    cursor: pointer;
}

.theme-choice input {
	position: absolute;
    width: 0;
    height: 0;
    opacity: 0;
}

.theme-choice input:checked+span {
    background-color: #F9D142;
    color: #292826;
}

.theme-choice label span {
    display: block;
    width: 100%;
    height: 2.802vw;
    line-height: 2.802vw;
    padding: 0 1.563vw;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    background-color: lightgrey;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 1.5rem;
    border-radius: 8px 8px;
}

.theme-choice label {
    position: relative;
    display: block;
    width: 100%;
    margin-bottom: 0.521vw;
    cursor: pointer;
}

.hover2 {
    transition: transform 0.3s ease;
}
.hover2:hover {
    transform: scale3d(0.9, 0.9, 1) rotate3d(0, 0, 1, -1deg);
}
.hover1:hover {
    transform: scale3d(0.9, 0.9, 1) rotate3d(0, 0, 1, -1deg);
}
.hover1 {
    transition: transform 0.3s ease;
}


.time-choice>.time {
    overflow-y: scroll;
    padding-right: 0.521vw;
    
}
.time-choice label {
    float: left;
    position: relative;
    display: block;
    width: 48.5%;
    margin-bottom: 0.521vw;
    margin-right: 1.5%;
    text-align: center;
    cursor: pointer;
}

.time-choice input {
    position: absolute;
    width: 0;
    height: 0;
    opacity: 0;
}

.time-choice input:checked+span {
    background-color: #F9D142;
    color: #292826;
}

.time-choice label span {
    display: block;
    width: 100%;
    height: 3.802vw;
    line-height: 3.802vw;
    padding: 0.1563vw;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    background-color: #ebebeb;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 1.1rem;
   
}
.time-choice label span img{
    width: 2vw;
    height: 2vh;
}

.time-choice label {
    float: left;
    position: relative;
    display: block;
    width: 48.5%;
    margin-bottom: 0.521vw;
    margin-right: 1.5%;
    text-align: center;
    cursor: pointer;
}


.poster-choice>#themeImage {
    overflow-y: scroll;
    padding-right: 0.521vw;
    height: 23vw;
    
}
.reserve-title{
font-size: 4rem;}
.reserve-title1{
font-size: 3rem;}
.reserve-title2{
font-size: 2rem;}

.resscrolldesign{
scrollbar-track-color:#f6f6f6;
scrollbar-base-color:#f6f6f6;
scrollbar-face-color:#000;
scrollbar-shadow-color:#000;
scrollbar-arrow-color:#f6f6f6;
scrollbar-3dlight-color:#f6f6f6;
scrollbar-highlight-color:#f6f6f6;
-ms-overflow-style:scrollbar}
::-webkit-scrollbar{
width:.938vw}
::-webkit-scrollbar-thumb{
background-color:#F9D142;border-radius:.521vw}
::-webkit-scrollbar-track{
background-color:white;border-radius:.521vw}

.step-btn1 {
    width: 16%;
    height: 10vh;
    font-size: 2.5rem;
    line-height: 5vw;
    font-weight: 700;
    border: 1px solid;
    border-color: #F9D142;
    background: #F9D142;
    color: #292826;
    text-align: center;
}


.step-btn2 {
    width: 80%;
    height: 8vh;
    font-size: 2.0rem;
    line-height: 5vw;
    font-weight: 700;
    border: 1px solid;
    border-color: #F9D142;
    background: #F9D142;
    color: #292826;
    text-align: center;
}


.step2-table th:first-child {
    background-color: #000;
    color: #fff;
    border-bottom-color: #fff;
}
body {
    width: 100%;
    height: 100vh;
    /* background-color: rgb(255, 144, 144); */
    
}



</style>


</head>
<body>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- nav 메뉴버튼 -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


<%@include file ="../main/menubar.jsp" %>
    
<div style="width: 100%;">
	<div style="width: 70%; margin:auto; ">
		<div style="float:left; width:70%; margin:auto; ">
	
			<h3 class="reserve-title">화곡 RESERVATION</h3>
			<h4 class="reserve-title1">경험해보고 싶었던 “새로운 세상”</h4>
			<h5 class="reserve-title2">사실감 넘치는 인테리어와 신기하고 신선한 문제와 트릭 장치 그리고 전문작가의 흥미진진한 스토리까지!</h5>
		</div>
		<div style="float:right;width:30%; margin-top:10% ;margin-bottom:2%;text-align: center;">
			<a class="step-btn2 hover1" type="button" id="" style="text-align: center; line-height: 4vw;">
				예약확인/취소
			</a>
		</div>	
		
	</div>
	
	
		<div id="reserveRegion" style="width: 70%; margin:auto">			
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
	
</body>

</html>