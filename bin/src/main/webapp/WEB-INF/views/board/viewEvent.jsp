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

<title>이벤트 게시판</title>

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

<link rel="stylesheet" href="css/footerStyle.css">

</head>
<body>

<!-- 로그인 id반환. var값인 user_id를 EL로 사용 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<div style="margin-top: 1.5rem;">
	<div class="container pt-0 pl-5 pr-5 pb-5 mb-3" style="height:450px; border: 1px solid lightgray; border-radius: 10px;">
		<br/><br/>
		<h4>${viewEvent.bTitle}</h4>
		<br/>
		<p>
			<b>${viewEvent.bWriter}</b><br/>
			<fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${viewEvent.bDate}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>조회</b>&nbsp;&nbsp;${viewEvent.bHit}
		</p>
		<hr/>
		<br/><br/><br/>
		<h6>${viewEvent.bContent}</h6>
	</div>
	
	<sec:authorize access="isAuthenticated()">
		<a id="editE" href="editEventForm?bNum=${viewEvent.bNum}" class="btn btn-warning float-right">수정</a>
	</sec:authorize>
	
	<a href="board" class="btn btn-secondary">목록보기</a>
</div>

<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<script>
$(document).ready(function() {
	/* 게시물 수정 Form ajax */
	$("a#editE").click(function(e) {
		e.preventDefault();
		$.ajax({
			url: $(e.target).attr("href"),
			type: "get",
			data: "",
			success: function(d) {
				$("a.tab").addClass('disabled');
				$("#osm").removeAttr('href');
				$("#eventTab").html(d);
			},
			error: function() {
				alert("에러");
			}
		});
	});
});
</script>

</body>
</html>