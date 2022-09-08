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
</head>
<body>
	<div class="container mt-5">
		
		<form action="themeInsert" name="insertForm" method="post">
			<div class="form-group">
				<label for="uThemeName">테마명</label>
				<input type="text" class="form-control" id="uThemeName" required="required" name="ThemeName">
			</div>
			<div class="form-group">
				<label for="uGenre">장르</label>
				<input type="text" class="form-control" id="uGenre" required="required" name="Genre">
			</div>
			<div class="form-group">
				<label for="udifficulty">난이도</label>
				<select name="difficulty" id="udifficulty">
						<option value="1"selected>1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
			</div>
			<div class="form-group">
				<label for="uTimeTaken">테마시간</label>
				<input type="text"  class="form-control" id="uTimeTaken" required="required" name="TimeTaken">
			</div>
			<div class="form-group">
				<label for="uThemeProfile">테마설명:</label>
				<textarea rows="10" cols="" id="uThemeProfile" name="ThemeProfile" class="form-control" required="required"></textarea>

			</div>
		
			<button type="submit" class="btn btn-success">테마등록</button>&nbsp;&nbsp;
		</form>
	</div>


</body>
</html>