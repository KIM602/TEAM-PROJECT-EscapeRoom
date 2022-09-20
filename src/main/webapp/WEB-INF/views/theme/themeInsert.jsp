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
<meta id="_csfr" name="_csrf" content="${_csrf.token}"/> 
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
<style>
.text-center {
	font-size: 2.3rem;
	font-weight: bold;
}
.form-control {
	height: calc(2em + 0.75rem + 2px);
}
a {
	display:block;
	color:#333;
}
</style>
</head>
<body>
<div class="container mt-5">
	<h3 class="text-center">테마 등록</h3>
	<br />
	<form action="inserttheme?${_csrf.parameterName}=${_csrf.token}" method="post" id="frm1" name="frm1" enctype="multipart/form-data">
		<div class="form-group">
			<label for="uphoto">테마포스터</label>
			<input type="file" class="form-control" id="uphoto" placeholder="테마포스터" name="tphoto" required/>
		</div>
		<div class="form-group">
			<label for="uName">테마명</label>
			<input type="text" placeholder="테마명 입력" class="form-control" id="uName" required="required" name="tname">
		</div>
		<div class="form-group">
			<label for="uGenre">장르</label>
			<input type="text" placeholder="장르 입력" class="form-control" id="uGenre" required="required" name="tgenre">
		</div>
		<div class="form-group">
			<label for="uDifficulty">난이도</label>
			<select name="tdifficulty" id="uDifficulty">
						<option value="1"selected>1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
		</div>
		<div class="form-group">
			<label for="uTime">테마시간</label>
			<input type="text" placeholder="ㅇㅇ분" class="form-control" id="uTime" required="required" name="ttime">
		</div>
		<div class="form-group">
			<label for="uProfile">테마설명</label>
			<textarea rows="10" cols="" placeholder="테마 설명" id="uProfile" name="tprofile" class="form-control" required="required"></textarea>
		</div>
		
		<button type="submit" class="btn btn-success">등록</button>&nbsp;&nbsp;
		<a href="DashBoardMain" class="btn btn-danger">취소</a>
	</form>
</div>
</body>
</html>
