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

<title>공지사항 수정</title>

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
	var result = confirm("수정을 완료하시겠습니까?");
	return result;
}
function rst() {
	var result = confirm("확인을 누르면 수정 전으로 초기화됩니다.");
	return result;
}
</script>

</head>
<body>

<form id="nEditForm" action="editNotice" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div class="form-group">
		<input type="hidden" name="bNum" value="${viewNotice.bNum}"/>
		<label for="nWriter">작성자</label>
		<input type="text" class="form-control" id="nWriter" name="bWriter" value="${viewNotice.bWriter}" readonly/>
		<br/>
		<label for="nTitle">제목</label>
		<input type="text" class="form-control" id="nTitle" name="bTitle" value="${viewNotice.bTitle}" required/>
		<br/>
		<label for="nContent">내용</label>
		<textarea class="form-control" id="nContent" name="bContent" rows="10" required>${viewNotice.bContent}</textarea>
		<br/>
		<button type="submit" class="btn btn-success float-right" onclick="return conf()">저장</button>
		<button type="reset" class="btn btn-warning float-right mr-1" onclick="return rst()">리셋</button>
		<input type="button" class="btn btn-danger float-right mr-5" onclick="del()" value="삭제"/>
		<input type="button" class="btn btn-secondary" onclick="back()" value="목록보기"/>
	</div>
</form>

<script>
$(document).ready(function() {
	/* 수정완료 후 이동 ajax */
	$("#nEditForm").submit(function(e) {
		e.preventDefault();
		$.ajax({
			url: "editNotice",
			type: "post",
			data: $("#nEditForm").serialize(),
			success: function(data) {
				$("#admin_noticeTab").html(data);
			},
			error: function() {
				alert("에러");
			}
		});
	});
});

function del() {
	if(window.confirm("정말 삭제하시겠습니까? 삭제시 모든 내용이 사라집니다.")) {
		$.ajax({
			url: "deleteNotice?bNum=${viewNotice.bNum}",
			type: "get",
			data: "",
			success: function(d) {
				$(".main-page").html(d);
			},
			error: function() {
				alert("에러");
			}
		});
	}
	else {
		console.log("삭제 취소");
	}
}

function back() {
	if(window.confirm("이동하시겠습니까? 저장되지 않은 내용은 모두 삭제됩니다.")) {
		$.ajax({
			url: "admin_board1",
			type: "get",
			data: "",
			success: function(d) {
				$(".main-page").html(d);
			},
			error: function() {
				alert("에러");
			}
		});
	}
	else {
		console.log("목록보기 취소");
	}
}
</script>

</body>
</html>