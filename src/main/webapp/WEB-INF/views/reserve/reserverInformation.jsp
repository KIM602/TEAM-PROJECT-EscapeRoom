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
			<table id="step2-table">
				<tbody>
					<tr>
						<th><a>예약일</a></th>
						<td>
							<a>${reserveCheckData.get(0).rDate}</a>
						</td>
					</tr>
					<tr>
						<th><a>테마명</a></th>
						<td>
							<a>${reserveCheckData.get(0).rThemeName}</a>
						</td>
						
					</tr>
					<tr>
						<th><a>시간</a></th>
						<td>
							<a>${reserveCheckData.get(0).rTime}</a>
						</td>
						
					</tr>
					<tr>
						<th><a>성함</a></th>
						<td>
							<a>${reserveCheckData.get(0).rName}</a>
							
						</td>
					</tr>	
					<tr>
						<th><a>인원</a></th>
						<td> 
							<a>${reserveCheckData.get(0).rCount}</a>
						</td>
						
					</tr>
					<tr>
						<th><a>비용</a></th>
						<td><a>${reserveCheckData.get(0).rPrice}</a></td>
					</tr>
					<tr>
						<th style="border-bottom-color: #000; "><a>주의사항</a></th>
						<td><a style="display: block">예약해 주신 시간은 입장시간입니다.<br/>
							브리핑 및 짐 보관을 위해 15분전에 <br/>도착해주셔야합니다.<br/>
							늦으실 경우 늦은 시간만큼 시간이 차감됩니다.<br/>
							장치를 힘으로 억지로 열거나 작동시키려 할 경우 부상과 파손의 위험이 있습니다.<br/>
							소품 및 장치 파손 시 배상의 책임이 있습니다.<br/>
							테마 진행 및 이동시에는 장난을 치거나 뛰지 않도록 주의해 주세요.</a></td>
					</tr>
					
				</tbody>
				
			</table>
			<br/><br/>
			<button class="step-btn3 rounded-pill hover1" id="reserveDeleteBtn"type="button">
				예약취소
			</button>
		
		
<script type="text/javascript">
$(document).ready(function name() {
	var themeid = '${reserveCheckData.get(0).rId}'
	console.log(themeid);
	$("#reserveDeleteBtn").click(function name(e) {
		$.ajax({
			url : "reserveDelete",
			type : "post",
			data : {reserveid : '${reserveCheckData.get(0).rId}',
				${_csrf.parameterName}: "${_csrf.token}"
				},
			success : function name(d) {
				$("#reserveRegion").html(d);
			},
			error : function name() {
				alert("실해");
			}
		})
		
	})
})
		
</script>
</body>
</html>