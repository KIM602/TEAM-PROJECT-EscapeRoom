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
<h3 class="text-center">회사 정보 수정</h3>
	<div class="container">
		<form action="footerModify?${_csrf.parameterName}=${_csrf.token}"  method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="logoImg">로고 이미지 수정</label>
				<input type="file" id="logoImg" name="fImg" placeholder="로고 이미지 수정"/>
			</div>
			<div class="form-group">
				<label for="businessName">&#9656; 상호</label>
				<input type="text" id="businessName" name="fBusiness" placeholder="상호명을 입력하세요"/>
			</div>
			<div class="form-group">
				<label for="fname">&#9656; 대표자명</label>
				<input type="text" id="fname" name="fName" placeholder="대표자명을 입력하세요"/>
			</div>
			<div class="form-group">
				<label for="femail">&#9656; 이메일</label>
				<input type="text" id="femail" name="fEmail" placeholder="대표 이메일을 입력하세요"/>
			</div>
			<div class="form-group">
				<label for="faddress">&#9656; 주소</label>
				<input type="text" id="faddress" name="fAddress" placeholder="주소를 입력하세요"/>
			</div>
			<div class="form-group">
				<label for="fnumber">&#9656; 사업자 등록번호</label>
				<input type="text" id="fnumber" name="fNumber" placeholder="사업자 등록 번호를 입력하세요"/>
			</div>
			<div class="form-group">
				<label for="ftel">&#9656; 고객센터 전화번호</label>
				<input type="text"  id="ftel" name="fTel" placeholder="고객센터 전화번호를 입력하세요"/>
			</div>
			
			<div class="btn-box">
				<button type="submit" class="btn btn-success">등록</button>
				<button type="reset" class="btn btn-danger">취소</button>
			</div>
		</form>
	</div>
</body>
</html>