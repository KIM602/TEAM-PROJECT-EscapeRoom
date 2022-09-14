<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


</head>
	<body>
			<c:forEach items="${themeNameList}" var="dto">
				<label class="hover2">
					<input type="radio" name="themePK" value="${dto.tid}" >
					<span>${dto.tname}</span>
				</label>
			</c:forEach>

<script type="text/javascript">

$(document).ready(function name() {
	$('input[name=themePK]').click(function name(e) {
		var ymd = "${ymd}";		
		var value1 = $(this).val();
		$.ajax({
			url : "imageView",
			type : "post",
			data : {themevalue:value1,
				ymd : ymd,
				${_csrf.parameterName}: "${_csrf.token}"
				},
			success : function name(d) {
					$("#themeImage").html(d);
					$.ajax({
						url : "themeReserveTimeCheck",
						type : "post",
						data : {themevalue:value1,
							ymd : ymd,
							${_csrf.parameterName}: "${_csrf.token}"
							},
						success: function name(d1) {
							$("#themeTimeWrap").html(d1);
						},	
						error: function name() {
							alert("테마시간리스트 체크 하기전에 실패")
						}	
					})
					
					
			},
			error : function name() {
				alert("테마가기도 전에 실패")
			}
		
		})
	})
})
	
</script>		
			
</body>

</html>