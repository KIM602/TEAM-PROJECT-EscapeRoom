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

<table id="searchTable" class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>예약자</th>
				<th>테마명</th>
				<th>날짜</th>
				<th>시간대</th>
				<th>인원수</th>
				<th>연락처</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ReserveListContent}" var="dto" varStatus="status">
			<tr>
				<td class="bid">${status.count}</td>
				<td>${dto.rName}</td>
				<td>${dto.rThemeName}</td>
				<td>${dto.rDate}</td>
				<td>${dto.rTime}</td>
				<td>${dto.rCount}명</td>
				<td>${dto.rPhone}</td>
				<td><a class="contentView" href="AdminReserveDelete" data-value="${dto.rId}">삭제하기</a></td>
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
			data :{ reserveid : val,
				${_csrf.parameterName}: "${_csrf.token}",
				
			},
			success : function name(d) {
				window.location.href = "main";
			},
			error : function name() {
				alert("실해");
			}
		})
		
	})
})
</script>	
</html>