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

<link rel="stylesheet" href="css/menubar.css">

<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
a#nTitle {
	color : #008080;
}
a#nTitle:hover {
	color : #004d4d;
}
</style>

</head>
<body>


<table class="table table-hover"
		style="font-family: 'GmarketSansMedium'; font-size: 12px;">
	<colgroup>
		<col style="width:10%">
		<col style="width:55%">
		<col style="width:15%">
		<col style="width:10%">
		<col style="width:10%">
	</colgroup>
	<thead class="thead-light">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${nPage}" var="ndto">
			<tr>
				<td>${ndto.bNum}</td>
				<td><a id="nTitle" href="viewNotice?bNum=${ndto.bNum}">${ndto.bTitle}</a></td>
				<td>${ndto.bWriter}</td>
				<td><fmt:formatDate pattern="yyyy.MM.dd" value="${ndto.bDate}"/></td>
				<td>${ndto.bHit}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot></tfoot>
</table>

<script>
$(document).ready(function() {	
	
	/* 게시물 자세히보기 ajax */
	$("a#nTitle").click(function(e) {
		e.preventDefault();
		$.ajax({
			url: $(e.target).attr("href"),
			type: "get",
			data: "",
			success: function(data) {
				$("#nTop").addClass('d-none');
				$("#paginationN").addClass('d-none');
				$("#noticeTab").html(data);
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