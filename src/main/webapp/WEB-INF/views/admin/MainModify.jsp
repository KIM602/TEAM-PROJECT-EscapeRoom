<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page session="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"> <!-- 페이지 위조 요청을 방지한 태그 -->

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

</head>
<body>
<h3 class="text-center">main 이미지 수정</h3>
<div class="container">
	<form action="mainModify?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="mainLR">메인 로고 수정</label><br />
			<input type="file" id="mainLR" name="lImage" placeholder="메인 로고 수정"/>
		</div>
		<div class="form-group">
				<label for="mainNR">기본 이미지 수정</label><br/>
				<input type="file" id="mainNR" name="mImageNormal" placeholder="기본 이미지 수정"/>
			</div> 
			<div class="form-group">
				<label for="mainER">마우스 올렸을때, 바뀔 이미지 수정</label><br/>
				<input type="file" id="mainER" name="mImageEvent" placeholder="조건이 충족될 시 변경되는 이미지 수정"/>
			</div>
			
			<button type="submit" class="btn btn-success">이미지 등록</button>
			<button type="reset" class="btn btn-danger">취소</button>
	</form>
</div>
</body>
</html>