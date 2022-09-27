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
<script src="https://kit.fontawesome.com/31d5c7a19f.js" crossorigin="anonymous"></script>
	
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


<link rel="stylesheet" href="css/reserve/reserveCheckFail.css">


</head>
<body>
	<form action="reserveOK">
		<div class="box-step2">
			
			<div class="box-step2-div1">
				<h3 class="box-step2-h3"><i class="fa-solid fa-pen-nib"></i>&nbsp;결과</h3>
				<div class="box-step2-div1-div">
					<p class="message"><i class="fa-solid fa-user-large-slash"></i><br/>예약 완료되었습니다.</p>
									
				</div>
			</div>
			<a class="step-btn3 rounded-pill hover1" type="button" id="reserveCheckCancleBack">
				뒤로가기
			</a>
		</div>
	</form>

</body>
<script type="text/javascript">
	$(document).ready(function name() {
		$("#reserveCheckCancleBack").click(function name() {
			$.ajax({
				url : "reserveCheckCanclePage",
				type : "get",
				data : "",
				success : function name(d) {
					$("#reserveRegion").html(d);
					$("#reserveCheckCancle").text("예약하러 가기");
					$("#reserveCheckCancle").attr("href","reservePage");
				},
				error : function name() {
					alert("예약체크/확인실패");
				}
			})
		})
	})
</script>


</html>