<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel="stylesheet" href="css/reserve/reserveForm.css" />


</head>
<body>
	<form action="reserveFind">
		<div class="box-step2">
			
			<div class="box-step2-div1">
				<h3 class="box-step2-h3"><i class="fa-solid fa-pen-nib"></i>&nbsp;결과</h3>
				<div class="box-step2-div1-div">
					<p class="message"><i class="fa-solid fa-user-large-slash"></i><br/>성공적으로 삭제 되었습니다.</p>
									
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