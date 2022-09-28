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
			<c:forEach items="${themeNameList}" var="dto"> <!-- 모델키값 테마네임리스트 -->
				<label class="hover2">
					<input type="radio" name="themePK" value="${dto.tid}" ><!-- 라디오 선택 방식/ 선택시 해당하는 테마 ID값을 가짐-->
					<span>${dto.tname}</span> <!-- 테마 이름 -->
				</label>
			</c:forEach>

<script type="text/javascript">

$(document).ready(function name() {
	$('input[name=themePK]').click(function name(e) { // 테마 선택시
		var ymd = "${ymd}";		// 모델의 저장된 값을 가져와서 변수 ymd의 저장
		var value1 = $(this).val(); // 변수 value1은 선택한 테마 id값을 가짐
		$.ajax({
			url : "imageView",  // 실행할  url
			type : "post", // Post 방식
			data : {themevalue:value1,   // Json 형식 데이터 전달  {키값:데이터값} 의미
				ymd : ymd,
				${_csrf.parameterName}: "${_csrf.token}"   // 시큐리티 
				},
			success : function name(d) {  
					$("#themeImage").html(d);  // 상위노드인 themeImage태그의 성공 페이지를 불러옴
					$.ajax({   // 이중 ajax 처리
						url : "themeReserveTimeCheck",  
						type : "post",
						data : {themevalue:value1,  // json 형식 데이터 전달
							ymd : ymd,
							${_csrf.parameterName}: "${_csrf.token}"
							},
						success: function name(d1) {
							$("#themeTimeWrap").html(d1); // 상위노드인 themeTiemWrap태그의 성공페이지를 불러옴
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