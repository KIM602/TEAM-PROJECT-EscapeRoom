<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<body>
<!-- 10시20분 -->
<c:choose>
	<c:when test="${not empty theme1.rCheck}"> <!-- 예약되어 있는 값이 있을경우 아래로직 실행 -->
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="10:20" disabled >
			<span style="background-color:#FFFFFF">
				<img alt="" src="image/icon1_black.png">10시 20분</span>
	</label>
	</c:when>
	<c:otherwise> <!-- 예약되어 있는 값이 없을경우 아래로직 실행 -->
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="10:20">
			<span>
			<img alt="" src="image/icon2_black.png">10시 20분</span>
		</label>
	</c:otherwise>
</c:choose>
<!-- 11시50분 -->
<c:choose>
	<c:when test="${not empty theme2.rCheck}">
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="11:50" disabled >
			<span style="background-color:#FFFFFF">
				<img alt="" src="image/icon1_black.png">11시 50분</span>
	</label>
	</c:when>
	<c:otherwise>
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="11:50">
			<span>
			<img alt="" src="image/icon2_black.png">11시 50분</span>
		</label>
	</c:otherwise>
</c:choose>
<!-- 13시 20분 -->
<c:choose>
	<c:when test="${not empty theme3.rCheck}">
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="13:20" disabled >
			<span style="background-color:#FFFFFF">
				<img alt="" src="image/icon1_black.png">13시 20분</span>
	</label>
	</c:when>
	<c:otherwise>
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="13:20">
			<span>
			<img alt="" src="image/icon2_black.png">13시 20분</span>
		</label>
	</c:otherwise>
</c:choose>
<!-- 14시 50분 -->
<c:choose>
	<c:when test="${not empty theme4.rCheck}">
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="14:50" disabled >
			<span style="background-color:#FFFFFF">
				<img alt="" src="image/icon1_black.png">14시 50분</span>
	</label>
	</c:when>
	<c:otherwise>
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="14:50">
			<span>
			<img alt="" src="image/icon2_black.png" >14시 50분</span>
		</label>
	</c:otherwise>
</c:choose>
<!-- 16시 20분 -->
<c:choose>
	<c:when test="${not empty theme5.rCheck}">
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="16:20" disabled >
			<span style="background-color:#FFFFFF">
				<img alt="" src="image/icon1_black.png">16시 20분</span>
	</label>
	</c:when>
	<c:otherwise>
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="16:20">
			<span>
			<img alt="" src="image/icon2_black.png">16시 20분</span>
		</label>
	</c:otherwise>
</c:choose>
<!-- 17시 50분 -->
<c:choose>
	<c:when test="${not empty theme6.rCheck}">
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="17:50" disabled >
			<span style="background-color:#FFFFFF">
				<img alt="" src="image/icon1_black.png">17시 50분</span>
	</label>
	</c:when>
	<c:otherwise>
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="17:50">
			<span>
			<img alt="" src="image/icon2_black.png">17시 50분</span>
		</label>
	</c:otherwise>
</c:choose>
<!-- 19시 20분 -->
<c:choose>
	<c:when test="${not empty theme7.rCheck}">
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="19:20" disabled >
			<span style="background-color:#FFFFFF">
				<img alt="" src="image/icon1_black.png">19시 20분</span>
	</label>
	</c:when>
	<c:otherwise>
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="19:20">
			<span>
			<img alt="" src="image/icon2_black.png">19시 20분</span>
		</label>
	</c:otherwise>
</c:choose>
<!-- 20시 50분 -->
<c:choose>
	<c:when test="${not empty theme8.rCheck}">
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="20:50" disabled >
			<span style="background-color:#FFFFFF;">
				<img alt="" src="image/icon1_black.png"/>20시 50분</span>
	</label>
	</c:when>
	<c:otherwise>
	<label class="hover2" style="background-color:#FFFFFF">
		<input type="radio"  name="reservationTime" value="20:50">
			<span>
			<img alt="" src="image/icon2_black.png">20시 50분</span>
		</label>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
$(document).ready(function() {
	$('input[name=reservationTime]').click(function name(e) {
			var ymd = "${ymd}"; // 날짜데이터 저장
			var themevalue = "${themevalue}"; // 테마id 저장
			var themeTime = $(this).val(); // 시간대 저장
			$("#nextBtn").on('click',function name(e1) { // Next 버튼 클릭시 예약 Form으로 이동함
				e1.preventDefault();
					$.ajax({
						url : "reserveForm",  // url 실행
						type : "post",
						data : { "ymd" : ymd,  // Json 형식 데이터 전송 
							"themevalue" : themevalue,
							"themeTime" : themeTime,
							${_csrf.parameterName}: "${_csrf.token}"
						},
						success: function name(d) {
							$("#reserveRegion").html(d);
						},
						error : function name() {
							alert("넥스트버튼에서 실패");
						}
						
					})
		})
	})
});

</script>


</body>


</html>