<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="css/reserve/reserveForm.css" />
</head>
<body>
	<form action="reserveFind">
		<div class="box-step2">
			
			<div class="box-step2-div1">
				<h3 class="box-step2-h3"><i class="fa-solid fa-pen-nib"></i>&nbsp;예약확인/취소</h3>
				<div class="box-step2-div1-div">
					<table>
						<tbody>
							<tr>
								<th><p style="width:70px">이름</p></th>
								<td><input id="rName"class="formSt" type="text" placeholder="이름을 입력하세요"></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input id="rPhone"class="formSt" type="text" placeholder="Ex) 010-1234-1234"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<a class="step-btn3 rounded-pill hover1" type="button" id="reserveFind">
				예약찾기
			</a>
		</div>
	</form>

<script type="text/javascript">
$(document).ready(function name() {
	$(reserveFind).click(function name() {            // ReserveFind 버튼 클릭시 작동 함수
		let name = $("#rName");          
		sessionStorage.setItem("이름값",name[0].value);   // 세션스토리지에 키값,Value 저장
		let phone = $("#rPhone");
		sessionStorage.setItem("폰값",phone[0].value);

		
		let namekey = "이름값" ;                          // 고정 키값명 설정
		let phonekey = "폰값" ;                                

		
		jsonName1 = sessionStorage.getItem(namekey);     // 변수에 세션의 저장된 값을 가짐
		jsonPhone1 = sessionStorage.getItem(phonekey);

		let json = {                                     // 객체형식 값을 받음
			nameKey : jsonName1,
			phoneKey : jsonPhone1,
			${_csrf.parameterName}: "${_csrf.token}"	// 시크릿활용을 위한 토큰값 기재(없을시,Post로 보낼수없음)
		};
		$.ajax({
			url : "reserveFind", 	                    // ajax를 이용하여 reserveFind 호출
			type: "post",
			data : json,
			success : function(data){					// 성공시 페이지를 변환시켜줌
					$("#reserveRegion").html(data);
			},
			error : function name() {
				alert("서버접속 실패");
			}
		});
	});
})	
</script>
	
	
	
	
</body>
</html>