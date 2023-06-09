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

<!--  -->
<link href='css/reserve/bootstrap.css' rel='stylesheet' />
<!--     <link href='css/ct-navbar.css' rel='stylesheet' /> -->
<link href='css/reserve/rotating-card.css' rel='stylesheet' />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

<link href="https://netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">

<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
<style type="text/css">


		
		
		
    </style>
</head>

<body>
<%@include file ="../main/menubar.jsp" %>

<div class="container" id="StartForm">
    
    
    
	    <div class="row">
	        <h1 class="title" style="text-align: center">
	            오늘 예약가능한 테마 
	        </h1>
	        <br/>    
	        <div class="col-sm-10 col-sm-offset-1">
	            <c:forEach var="i" begin="1" end="10" varStatus="status"> 
	            	<c:set var="TodayReserve" value="TodayReserve${status.index}"></c:set> <!-- 예약판단 유무 -->
	            	<c:set var="ThemeList" value="ThemeList${status.index}"></c:set> <!-- 테마 별 정보 -->
	            	<c:set var="bestList" value="bestList${status.index}"></c:set> <!-- 테마순위 추출 -->
	            		<c:if test="${requestScope[TodayReserve] eq 'NotYet'}"> <!-- 8개의 시간 전부 예약이 덜된것만 출력 -->
					         
						         <div class="col-md-4 col-sm-6">
						             <div class="card-container">
						                <div class="card">
						                    <div class="front">
						                        <div class="cover">
						                            <a style="background-color: red;"></a>
						                        </div>
						                        <div class="user">
						                            <img class="img-circle" src="upimage/${requestScope[ThemeList].tPhoto}"/>
						                        </div>
						                        <div class="content">
						                            <div class="main">
															<div class="profile" style="height: 92px;">
							                                    <div class="stats">
							                                        
							                                        <h5>이름</h5>
							                                        <p>
							                                            ${requestScope[ThemeList].tName}
							                                        </p>
							                                    </div>
							                                    <div class="stats">
							                                        <h5>장르</h5>
							                                        <p>
							                                            ${requestScope[ThemeList].tGenre}
							                                        </p>
							                                    </div>
							                                    <div class="stats">
							                                        <h5>인기 순위</h5>
							                                        <p>
							                                            ${requestScope[bestList].rank}위
							                                        </p>
							                                    </div>
							                        		</div>
						                                <div style="width:100%;display: inline-block;">
							                            <c:choose>	
						                            		<c:when test="${i==1}">  <!-- 첫번째 테마를 의미 -->
						                            			<c:forEach begin="1" end="8" varStatus="status3">  <!-- 테마의 예약시간은 8개가 존재 -->
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==2}"> <!-- 두번째 테마를 의미 -->
						                            			<c:forEach begin="11" end="18" varStatus="status3"> <!-- 테마의 예약시간은 8개가 존재 -->
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==3}"> <!-- 세번째 테마를 의미 -->
						                            			<c:forEach begin="21" end="28" varStatus="status3"> <!-- 테마의 예약시간은 8개가 존재 -->
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==4}"> <!-- 네번째 테마를 의미 -->
						                            			<c:forEach begin="31" end="38" varStatus="status3"> <!-- 테마의 예약시간은 8개가 존재 -->
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==5}"> <!-- 다섯번째 테마를 의미 -->
						                            			<c:forEach begin="41" end="48" varStatus="status3"> <!-- 테마의 예약시간은 8개가 존재 -->
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==6}"> <!-- 여섯번째 테마를 의미 -->
						                            			<c:forEach begin="51" end="58" varStatus="status3"> <!-- 테마의 예약시간은 8개가 존재 -->
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==7}">  <!-- 일곱번째 테마를 의미 -->
						                            			<c:forEach begin="61" end="68" varStatus="status3"> <!-- 테마의 예약시간은 8개가 존재 -->
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==8}"> <!-- 여덟번째 테마를 의미 -->
						                            			<c:forEach begin="71" end="78" varStatus="status3"> <!-- 테마의 예약시간은 8개가 존재 -->
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==9}"> <!-- 아홉번째 테마를 의미 -->
						                            			<c:forEach begin="81" end="88" varStatus="status3"> <!-- 테마의 예약시간은 8개가 존재 -->
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==10}"> <!-- 열번째 테마를 의미 -->
						                            			<c:forEach begin="91" end="98" varStatus="status3"> <!-- 테마의 예약시간은 8개가 존재 -->
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	
						                                	
														 </c:choose>
														 </div>  
						                            </div>
						                        </div>
						                    </div> <!-- end front panel -->
						                    
						                </div> <!-- end card -->
						            </div> <!-- end card-container -->
						        </div>
						         <!-- end col sm 3 -->
						        </c:if>
						        </c:forEach>
						        
					        </div> <!-- end col-sm-10 -->
	   
	   </div>
</div>




<script type="text/javascript">

</script>

</body>
</html>

