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
<title>예약자 정보 페이지</title>
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

*{ font-family: 'GmarketSansBold';
}


#step2-table {
	width:100%;
    margin-top: 3%;

}


#step2-table th {
    font-size: 1.2rem;
    font-weight: 300;
    width:15%;
    border: 0.052vw solid #f6f6f6;
    text-align: center;
    color:#fff;
}

#step2-table th:first-child {
	border: 0.052vw solid #000;
    background-color: #000;
    border-bottom-color: #fff;
    
   
}


#step2-table td {

    border: 0.052vw solid #000;
    font-size:1.2rem;
    width:80%;
    padding: 0.5vw;
}
#step2-table td p{
    margin-bottom:0;
}

.step-btn3{
	text-align: center;
    line-height: 3vw;
    width: 11%;
    margin-left: 45%;
    margin-top: 2%;
    margin-bottom: 2%;
    font-size:1.5rem;
    border: 1px solid;
    border-color: #F9D142;
    background: #F9D142;
    color: #292826;
    font-family: 'GmarketSansBold';
}
</style>

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
						<th><a>주의사항</a></th>
						<td><p>예약해 주신 시간은 입장시간입니다.<br/>
							브리핑 및 짐 보관을 위해 15분전에 도착해주셔야합니다.<br/>
							늦으실 경우 늦은 시간만큼 시간이 차감됩니다.<br/>
							장치를 힘으로 억지로 열거나 작동시키려 할 경우 부상과 파손의 위험이 있습니다.<br/>
							소품 및 장치 파손 시 배상의 책임이 있습니다.<br/>
							테마 진행 및 이동시에는 장난을 치거나 뛰지 않도록 주의해 주세요.</p></td>
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