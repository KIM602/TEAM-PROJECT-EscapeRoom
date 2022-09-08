<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>

<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!--fontawesome icon-->
<script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>

<link rel="stylesheet" href="style/theme.css" />

</head>
<body>

<!-- 메뉴 -->
<%@include file ="../main/menubar.jsp" %>

<!-- Swiper -->
	<div class="swiper mySwiper">
		<div class="container">
	    	<h1 class="title text-center mt-5">테마소개</h1>
	    	<button id="btn1" type="button" class="w-btn-outline w-btn-yellow-outline btn_reservation" onclick="location.href='reservePage'">예약하기</button>
	    </div>
	    
	    <div class="swiper-wrapper">  
	       	<c:forEach items="${themeList}" var="dto">
	       		<div class="swiper-slide">
					<button id="tDetailView" data-toggle="modal" data-target="#myModal${dto.tid}" value="${dto.tid}">
	        			<div class="imgbox"><img src="upimage/${dto.tphoto}" alt="${dto.tname}"/></div>
	        		</button>
				</div>
			</c:forEach>
	    </div>
	    
	    <div class="swiper-scrollbar"></div>
	</div>
	
<!-- modal -->
<c:forEach items="${themeList}" var="dto">
	<div id="myModal${dto.tid}" class="modal fade">
		<div class="modal-dialog modal-80size">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">${dto.tname}</h4>
					<a type="button" data-dismiss="modal" aria-hidden="true"><i class="fa-solid fa-x"></i></a>	
				</div>
				<div class="modal-body">
						<div>
							<img src="upimage/${dto.tphoto}" alt="사진" class="timage mx-auto img-responsive"/>
						</div>
						<div>
							<ul style="list-style: none;">
								<li>제목 : ${dto.tname}<li>
								<li>장르 : ${dto.tgenre}</li>
								<li>난이도 : ${dto.tdifficulty}</li>
								<li>소요시간 : ${dto.ttime}</li>
								<li>테마소개 : <br />
										${dto.tprofile}</li>
							</ul>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="w-btn-outline w-btn-yellow-outline btn_reservation" onclick="location.href='reservePage'">예약하기</button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

<script>
var swiper = new Swiper(".mySwiper", {
    mousewheel: true,
    breakpoints: {
        "@0.00": {
            slidesPerView: 1,
        },
        "@0.75": {
            slidesPerView: 2,
        },
        "@1.00": {
            slidesPerView: 3,
        },
        "@1.50": {
            slidesPerView: 4,
        }
    }
});
</script>

</body>
</html>