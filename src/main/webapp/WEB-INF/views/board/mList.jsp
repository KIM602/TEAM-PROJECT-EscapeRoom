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

<title>Insert Title</title>

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
body {
	background-color: #F9D142;
	overflow: hidden;
}

#mlist {
	color: #EE7600;
	font-size: 20px;
	margin-top: 4px;
}

.tImgs {
	display:flex;
	justify-content: space-around;
}

.polaroid .poster {
	z-index: 0;
	width: 200px;
	border: 10px solid #fff;
	border-bottom: 45px solid #fff;
	-webkit-box-shadow: 3px 3px 3px #777;
	-moz-box-shadow: 3px 3px 3px #777;
	box-shadow: 3px 3px 3px #777;
}

.gold {
	width: 60px;
	height: 60px;
	position: absolute;
	z-index: 2;
	right: 90%;
}

.silver {
	width: 60px;
	height: 60px;
	position: absolute;
	z-index: 2;
	right: 58%;
}

.bronze {
	width: 60px;
	height: 60px;
	position: absolute;
	z-index: 2;
	right: 26%;
}

.polaroid p {
	position: absolute;
	text-align: center;
	width: 200px;
	bottom: -10px;
	font-size: 22px;
}
</style>

</head>
<body>

<c:choose>
	<c:when test="${not empty theme1.tphoto && empty theme2.tphoto && empty theme3.tphoto}">
		<style>.gold{right:58%;}</style>
	</c:when>
	<c:when test="${not empty theme1.tphoto && not empty theme2.tphoto && empty theme3.tphoto}">
		<style>.gold{right:82%;} .silver{right:34%;}</style>
	</c:when>
</c:choose>

<div class="row">
	<div class="col-8 tImgs">
		<c:if test="${not empty theme1.tphoto}">
			<img class="gold" src="image/gold.png"/>
			<div class="polaroid">
				<img class="poster" src="upimage/${theme1.tphoto}" onerror="this.style.display='none'"/>
				<p>${rlist[0].rThemeName}</p>
			</div>
		</c:if>
		<c:if test="${not empty theme2.tphoto}">
			<img class="silver" src="image/silver.png"/>
			<div class="polaroid">
				<img class="poster" src="upimage/${theme2.tphoto}" onerror="this.style.display='none'"/>
				<p>${rlist[1].rThemeName}</p>
			</div>
		</c:if>
		<c:if test="${not empty theme3.tphoto}">
			<img class="bronze" src="image/bronze.png"/>
			<div class="polaroid">
				<img class="poster" src="upimage/${theme3.tphoto}" onerror="this.style.display='none'"/>
				<p>${rlist[2].rThemeName}</p>
			</div>
		</c:if>
	</div>
	<div class="col-4">
		<c:forEach items="${mList}" var="dto" varStatus="status">
			<div id="mlist">${status.count}위&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;${dto.cnt}건&nbsp;&nbsp;-&nbsp;${dto.rThemeName}</div>
		</c:forEach>
	</div>
</div>
<!-- 
<div class="row">
	<div class="col-8 tName">
		<c:forEach items="${rlist}" var="dto">
			<span>${dto.rThemeName}</span>
		</c:forEach>
	</div>
</div>
 -->



</body>
</html>