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
<style>
/* modal button */
@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }

@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
    
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
    
    body {
 	width: 100%;
    height: 100%;
	background: #F9D142;
	margin: 0;
	padding: 0;
	font-family: "GmarketSansBold";
   	}

.w-btn-outline {
    position: relative;
    padding: 6px 13px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-yellow-outline {
    border: 3px solid #fce205;
    color: #6e6e6e;
}

.w-btn-yellow-outline:hover {
    background-color: #fce205;
    color: #6e6e6e;
}

.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline:active {
    transform: scale(1.5);
}

.btn_reservation {
	font-size: small;
}

.btn_close {
	font-size: small;
}

/* 모달창 */
.timage {
	width: 100%;
	height: 400px;
}

.modal-80size {
	width: 80%;
	height: 80%;
	margin: 10% auto;
	padding: 0;
}
</style>
<body>

<!-- 메뉴 -->
	<%@include file ="../main/menubar.jsp" %>
<!-- Swiper -->
	<div class="swiper mySwiper">
	
	    <h1 class="title text-center">테마소개</h1>
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
<%@include file ="../main/menubar.jsp" %>
	
<!-- modal -->
<c:forEach items="${themeList}" var="dto">
	<div id="myModal${dto.tid}" class="modal fade">
		<div class="modal-dialog modal-80size">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">${dto.tname}</h4>
					<button type="button" data-dismiss="modal" aria-hidden="true">&times;</button>	
				</div>
				<div class="modal-body">
						<div class="container row">
							<div class="col-sm-6">
								<img src="upimage/${dto.tphoto}" alt="사진" class="timage mx-auto img-responsive"/>
							</div>
							<div class="col-sm-6">
								<h3 class="text-center">${dto.tname}</h3>
								<h5 class="text-center">${dto.tgenre}</h5>
								<h5 class="text-center">${dto.tdifficulty}</h5>
								<h5 class="text-center">${dto.ttime}</h5>
								<h5 class="text-center">${dto.tprofile}</h5>
								<br />
							</div>
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