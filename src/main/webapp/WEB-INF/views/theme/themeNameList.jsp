<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


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