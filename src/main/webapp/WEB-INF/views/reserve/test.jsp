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
</head>
<body>
			<!--  테마 1 -->
			<div>
			
			</div>
					<img alt="" src="upimage/${todayCheck1.tPhoto}" style="width: 100% ; height:40vh ;">
					예약가능 목록
					
						<c:forEach var="i" begin="1" end="8" varStatus="status2">
							<c:set var="number" value ="todayCheck${status2.index}"/>
								<c:choose>
									<c:when test="${requestScope[number].rCheck eq 0}">
										${requestScope[number].tName} ${requestScope[number].rDate} 
										
										<img alt="" src="image/icon2_black.png">${requestScope[number].rTime}<br/>
									</c:when>
								</c:choose>
						</c:forEach>
						<!--  테마 2 -->
					<img alt="" src="upimage/${todayCheck11.tPhoto}" style="width: 100% ; height:40vh ;">
						<c:forEach var="i" begin="11" end="18" varStatus="status2">
							<c:set var="number" value ="todayCheck${status2.index}"/>
								<c:choose>
									<c:when test="${requestScope[number].rCheck eq 0}">
										즉시예약가능 ${requestScope[number].tName} ${requestScope[number].rDate} ${requestScope[number].rTime}<br/>
									</c:when>
								</c:choose>
						</c:forEach>
						<!--  테마 3 -->
					<img alt="" src="upimage/${todayCheck21.tPhoto}" style="width: 100% ; height:40vh ;">
						<c:forEach var="i" begin="21" end="28" varStatus="status2">
							<c:set var="number" value ="todayCheck${status2.index}"/>
								<c:choose>
									<c:when test="${requestScope[number].rCheck eq 0}">
										즉시예약가능 ${requestScope[number].tName} ${requestScope[number].rDate} ${requestScope[number].rTime}<br/>
									</c:when>
								</c:choose>
						</c:forEach>
						<!--  테마 4 -->
					<img alt="" src="upimage/${todayCheck31.tPhoto}" style="width: 100% ; height:40vh ;">
						<c:forEach var="i" begin="31" end="38" varStatus="status2">
							<c:set var="number" value ="todayCheck${status2.index}"/>
								<c:choose>
									<c:when test="${requestScope[number].rCheck eq 0}">
										즉시예약가능 ${requestScope[number].tName} ${requestScope[number].rDate} ${requestScope[number].rTime}<br/>
									</c:when>
								</c:choose>
						</c:forEach>
						<!--  테마 5 -->
					<img alt="" src="upimage/${todayCheck41.tPhoto}" style="width: 100% ; height:40vh ;">
						<c:forEach var="i" begin="41" end="48" varStatus="status2">
							<c:set var="number" value ="todayCheck${status2.index}"/>
								<c:choose>
									<c:when test="${requestScope[number].rCheck eq 0}">
										즉시예약가능 ${requestScope[number].tName} ${requestScope[number].rDate} ${requestScope[number].rTime}<br/>
									</c:when>
								</c:choose>
						</c:forEach>
						<!--  테마 6 -->
					<img alt="" src="upimage/${todayCheck51.tPhoto}" style="width: 100% ; height:40vh ;">
						<c:forEach var="i" begin="51" end="58" varStatus="status2">
							<c:set var="number" value ="todayCheck${status2.index}"/>
								<c:choose>
									<c:when test="${requestScope[number].rCheck eq 0}">
										즉시예약가능 ${requestScope[number].tName} ${requestScope[number].rDate} ${requestScope[number].rTime}<br/>
									</c:when>
								</c:choose>
						</c:forEach>
						<!--  테마 7 -->
					<img alt="" src="upimage/${todayCheck61.tPhoto}" style="width: 100% ; height:40vh ;">
						<c:forEach var="i" begin="61" end="68" varStatus="status2">
							<c:set var="number" value ="todayCheck${status2.index}"/>
								<c:choose>
									<c:when test="${requestScope[number].rCheck eq 0}">
										즉시예약가능 ${requestScope[number].tName} ${requestScope[number].rDate} ${requestScope[number].rTime}<br/>
									</c:when>
								</c:choose>
						</c:forEach>
						<!--  테마 8 -->
					<img alt="" src="upimage/${todayCheck71.tPhoto}" style="width: 100% ; height:40vh ;">
						<c:forEach var="i" begin="71" end="78" varStatus="status2">
							<c:set var="number" value ="todayCheck${status2.index}"/>
								<c:choose>
									<c:when test="${requestScope[number].rCheck eq 0}">
										즉시예약가능 ${requestScope[number].tName} ${requestScope[number].rDate} ${requestScope[number].rTime}<br/>
									</c:when>
								</c:choose>
						</c:forEach>
						<!--  테마 9 -->
					<img alt="" src="upimage/${todayCheck81.tPhoto}" style="width: 100% ; height:40vh ;">
						<c:forEach var="i" begin="81" end="88" varStatus="status2">
							<c:set var="number" value ="todayCheck${status2.index}"/>
								<c:choose>
									<c:when test="${requestScope[number].rCheck eq 0}">
										즉시예약가능 ${requestScope[number].tName} ${requestScope[number].rDate} ${requestScope[number].rTime}<br/>
									</c:when>
								</c:choose>
						</c:forEach>
						

</body>
</html>