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

<link rel="stylesheet" href="css/footerModify.css" />

</head>
<body>
<h3 class="text-center text-titleSize">회사 정보 수정</h3>
	<div class="container form-containerSize">
		<form action="footerModify?${_csrf.parameterName}=${_csrf.token}"  method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="logoImg" class="text-labelSize">&#9656; 로고 이미지 수정</label>
				<input type="file" id="logoImg" name="fImg" class="form-inputStyle"  placeholder="로고 이미지 수정"/>
			</div>
			<div class="form-group form-group-margin">
				<label for="businessName" class="text-labelSize">&#9656; 상호</label>
				<input type="text" id="businessName" name="fBusiness" class="form-inputStyle"  placeholder="상호명을 입력하세요"/>
			</div>
			<div class="form-group form-group-margin">
				<label for="fname" class="text-labelSize">&#9656; 대표자명</label>
				<input type="text" id="fname" name="fName" class="form-inputStyle"  placeholder="대표자명을 입력하세요"/>
			</div>
			<div class="form-group form-group-margin">
				<label for="femail" class="text-labelSize">&#9656; 이메일</label>
				<input type="text" id="femail" name="fEmail" class="form-inputStyle"  placeholder="대표 이메일을 입력하세요"/>
			</div>
			<div class="form-group form-group-margin">
				<label for="faddress" class="text-labelSize">&#9656; 주소</label>
				<input type="text" id="faddress" name="fAddress" class="form-inputStyle"  placeholder="주소를 입력하세요"/>
			</div>
			<div class="form-group form-group-margin">
				<label for="fnumber" class="text-labelSize">&#9656; 사업자 등록번호</label>
				<input type="text" id="fnumber" name="fNumber" class="form-inputStyle"  placeholder="사업자 등록 번호를 입력하세요"/>
			</div>
			<div class="form-group form-group-margin">
				<label for="ftel" class="text-labelSize">&#9656; 고객센터 전화번호</label>
				<input type="text"  id="ftel" name="fTel" class="form-inputStyle"  placeholder="고객센터 전화번호를 입력하세요"/>
			</div>
			
			<div class="btn-box">
				<button type="submit" class="btn btn-success">등록</button>
				<button type="reset" class="btn btn-danger">취소</button>
			</div>
		</form>
	</div>
</body>
</html>