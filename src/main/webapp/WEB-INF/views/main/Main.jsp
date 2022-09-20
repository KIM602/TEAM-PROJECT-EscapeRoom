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

<script src="https://fonts.googleapis.com/css?family=Questrial"></script>
<script src="https://codepen.io/Gthibaud/pen/dybzvNw.js"></script>

<style>
/* font */
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
  color:black;
  font-family: 'GmarketSansMedium';
  background-size: 60px 60px;
  background-position: 0 0;
  animation: slide 4s infinite linear;
}

@keyframes slide {
  from {
    background-position: 0 0;
  }

  to {
    background-position: -120px 60px;
  }
}
.modal {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: auto;
  height: 75%;
  display: block;
  flex-direction: column;
  align-items: center;
  padding: 1.6rem 3rem;
  border: 3px solid black;
  border-radius: 5px;
  background: white;
  box-shadow: 8px 8px 0 rgba(0, 0, 0, 0.2);
}

.message {
  font-family: 'GmarketSansBold';
  font-size: 2rem;
  margin-bottom: 1.6rem;
  margin-top: 0;
}

.btn {
  color:inherit;
  font-family:inherit;
  font-size: inherit;
  background: white;
  padding: 0.3rem 3.4rem;
  border: 3px solid black;
  margin-right: 2.6rem;
  box-shadow: 0 0 0 black;
  transition: all 0.2s;
}

.btn:last-child {
  margin: 0;
}

.btn:hover {
  box-shadow: 0.4rem 0.4rem 0 black;
  transform: translate(-0.4rem, -0.4rem);
}

.btn:active {
  box-shadow: 0 0 0 black;
  transform: translate(0, 0);
}

.options {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

ul,li {
	list-style: none;
}

.polaroid {
  position: relative;
}
 
.polaroid img {
  width: 300px;
  border: 10px solid #fff;
  border-bottom: 45px solid #fff;
  -webkit-box-shadow: 3px 3px 3px #777;
     -moz-box-shadow: 3px 3px 3px #777;
          box-shadow: 3px 3px 3px #777;
}

.top3img {
	display: flex;
}

.top3img > li > img {
	width: 300px;
	margin: 30px;
}

.top3name {
	display: flex;
	justify-content: space-around;
}

.name {
	width: 30%;
	text-align: center;
	font-size: 32px;
}

.modal-dialog {
    max-width: 100%;
    margin: 1.75rem auto;
}

.modal-content {
	border: none;
}

.modal-open .modal {
    overflow-x: hidden;
    overflow-y: hidden;
}
</style>
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
        <i class="fa-solid fa-key"></i>
    </a>

<!-- 예약top3 -->
<div id="top3" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content" id="mcontent">
			<!-- ajax로 예약 top3 가져옴 -->
			<button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
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