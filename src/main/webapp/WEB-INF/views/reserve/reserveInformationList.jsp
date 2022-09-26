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
<table id="searchTable" class="table table-bordered table-hover">
		<thead>
			<tr>
				<th><a>번호</a></th>
				<th><a>예약일</a></th>
				<th><a>테마명</a></th>
				<th><a>시간</a></th>
				<th><a>성함</a></th>
				<th><a>인원</a></th>
				<th><a>비용</a></th>
				<th><a>기타</a></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reserveCheckData}" var="dto" varStatus="status">
			<tr>
				<td class="bid"><a>${status.count}</a></td>
				<td><a>${dto.rDate}</a></td>
				<td><a>${dto.rThemeName}</a></td>
				<td><a>${dto.rTime}</a></td>
				<td><a>${dto.rName}</a></td>
				<td><a>${dto.rCount}명</a></td>
				<td><a>${dto.rPrice}원</a></td>
				<td><a class="contentView" href="reserveFindMoreThan2DetailPage" data-value="${dto.rId}" style="color: #F9D142">자세히보기</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
<script type="text/javascript">
$(document).ready(function name() {

	$("a.contentView").click(function name(e) {
		e.preventDefault();
		let ceo = $(e.target);
		let val = ceo.attr('data-value');
		$.ajax({
			url : ceo.attr("href"),
			type : "post",
			data :{ rId : val,
				${_csrf.parameterName}: "${_csrf.token}",
				
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