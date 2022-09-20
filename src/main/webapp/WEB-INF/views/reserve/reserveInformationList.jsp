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
<style type="text/css">
@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


tbody>tr>td{
	font-family: 'GmarketSansMedium';
	font-size : 0.5rem;
}
thead>tr>th{
	font-family: 'GmarketSansBold';
	font-size : 0.5rem;
}
</style>

</head>
<body>
<table id="searchTable" class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>예약일</th>
				<th>테마명</th>
				<th>시간</th>
				<th>성함</th>
				<th>인원</th>
				<th>비용</th>
				<th>기타</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reserveCheckData}" var="dto" varStatus="status">
			<tr>
				<td class="bid">${status.count}</td>
				<td>${dto.rDate}</td>
				<td>${dto.rThemeName}</td>
				<td>${dto.rTime}</td>
				<td>${dto.rName}</td>
				<td>${dto.rCount}명</td>
				<td>${dto.rPrice}</td>
				<td><a class="contentView" href="reserveFindMoreThan2DetailPage" data-value="${dto.rId}">자세히보기</a></td>
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