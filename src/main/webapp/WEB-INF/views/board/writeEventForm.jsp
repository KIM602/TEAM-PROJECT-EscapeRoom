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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/> <!-- 페이지 위조 요청 방지 -->

<title>이벤트 작성 페이지</title>

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

<script>
function conf() {
	var result = confirm("등록하시겠습니까?");
	return result;
}
function back() {
	var result = confirm("이동하시겠습니까? 저장되지 않은 내용은 모두 삭제됩니다.");
	return result;
}
</script>

</head>
<body>

<form id="eWriteForm" action="writeEvent" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div class="form-group">
		<label for="writer">작성자</label>
		<input type="text" name="bWriter" id="writer" value="관리자" class="form-control" required/>
		<br/>
		
		<label for="title">제목</label>
		<input type="text" name="bTitle" id="title" placeholder="제목을 입력하세요" class="form-control" required/>
		<br/>
		
		<label for="content">내용</label>
		<textarea name="bContent" id="content" rows="10" placeholder="내용을 입력하세요" class="form-control" required></textarea>
		<br/>
	</div>
	<a href="board" class="btn btn-secondary" onclick="return back()">목록보기</a>
	<button type="submit" class="btn btn-success float-right" onclick="return conf()">등록</button>
</form>

<script>
$(document).ready(function() {
	$("#eWriteForm").submit(function(e) {
		e.preventDefault();
		$.ajax({
			url: "writeEvent",
			type: "post",
			data: $("#eWriteForm").serialize(),
			success: function(data) {
				$("#eventTitle").text('이벤트');
				$("#eventTab").html(data);
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