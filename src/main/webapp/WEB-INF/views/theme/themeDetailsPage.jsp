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

<link rel="stylesheet" href="css/theme/themeDetailsPage.css" />

<style>
.full-line {
  border-image: linear-gradient(0deg,#0C3338 5px,#0000 0) fill 0//0 100vw 0 0;
  padding: 10px 0;
}
</style>
</head>

<body>
<section>
  <h1 class="full-line">${tDetails.tname}</h1>
  	<div class="container">
		<img src="upimage/${tDetails.tphoto}" alt="포스터" style="max-width:100%; height:400px;"/>
		<ul class="detail">
			<li>장르 : ${tDetails.tgenre}</li>
			<li>난이도 : ${tDetails.tdifficulty}</li>
			<li>소요시간 : ${tDetails.ttime}</li>
			<li>테마내용 : <br /> 
				${tDetails.tprofile}</li>
		</ul>
	</div>
	<br />
	<div class="text-center">
		<a data-value="${tDetails.tid}" id="contentEdit" class="btn btn-secondary">수정</a>
		<a data-value="${tDetails.tid}" id="contentDel" class="btn btn-secondary">삭제</a>
		<a id="listback" class="btn btn-dark">목록으로</a>
	</div>
</section>

<script>
$(document).ready(function(){
	$("#contentEdit").click(function(event){
		event.preventDefault();
		let ceo = $(event.target);
		let val = ceo.attr('data-value');
		$.ajax({
			url : "themeEdit",
			type : "post",
			data : {
				tid : val,
				${_csrf.parameterName}: "${_csrf.token}",
			},
			success : function(data) {
				$(".main-page").html(data);
			},
			error : function(data) {
				alert("땡!");
			}
		});
	});
	
	$("#listback").click(function(event){
		event.preventDefault();
		let ceo = $(event.target);
		$.ajax({
			url : "themeListPage",
			type : "post",
			data : {
				${_csrf.parameterName}: "${_csrf.token}",
			},
			success : function(data) {
				$(".main-page").html(data);
			},
			error : function(data) {
				alert("땡!");
			}
		});
	});
	
	$("#contentDel").click(function(event){
		event.preventDefault();
		let ceo = $(event.target);
		let val = ceo.attr('data-value');
		$.ajax({
			url : "delete",
			type : "post",
			data : {
				tid : val,
				${_csrf.parameterName}: "${_csrf.token}",
			},
			success : function(data) {
				$(".main-page").html(data);
			},
			error : function(data) {
				alert("땡!");
			}
		});
	});
});
</script>
</body>
</html>
