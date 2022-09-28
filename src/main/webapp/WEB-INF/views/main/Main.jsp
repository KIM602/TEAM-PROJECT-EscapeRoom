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

<script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/top3.css">

<script src="https://codepen.io/Gthibaud/pen/dybzvNw.js"></script>

</head>
<body>
<!-- 메뉴바 -->
<%@include file ="../main/menubar.jsp" %>

	<h1> 
	<c:forEach items="${MainList}" var="dto">
		<img src="upimage/${dto.lImage}" alt="로고 샘플이미지" /> 
	</c:forEach>
	</h1>
	
    <div class="container">
        <section class="main-imgpage">
            <div class="img-box">
                <div class="img-inner">
		                <c:forEach items="${MainList}" var="dto">
		                    <img src="upimage/${dto.mImageNormal}" alt="자물쇠이미지"  onmouseenter="this.src='upimage/${dto.mImageEvent}'"  onmouseleave="this.src='upimage/${dto.mImageNormal}'">
		                </c:forEach>    
	                </div>
            </div>
            <div class="text-box">
                <p class="text"></p>
            </div>
        </section>
    </div>
    
    <a href="top3" id="top3bt" class="btn-resrvation" data-toggle="modal" data-target="#top3">
        <i class="fa-solid fa-trophy"></i>
    </a>
    <a href="TodayReserveAvailable" id="todayReserve" class="btn-resrvation1">
        <i class="fa-solid fa-calendar-check"></i>
    </a>
 
<!-- 예약top3 -->
<div id="top3" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content" id="mcontent">
			<!-- ajax로 예약 top3 가져옴 -->
		</div>
	</div>
</div>

<script src="js/main.js"></script>

<script>
$(document).ready(function(){
	$("#top3bt").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#top3bt").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mcontent").html(data);
			},
			error : function(data) {
				$("#mbody").text("실패!");
				$("#modal").trigger("click");
			}
		});
	}); 
});
</script>
</body>
</html>