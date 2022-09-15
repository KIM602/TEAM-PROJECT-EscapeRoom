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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/> 
<title>JSP</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
-->
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="js/jquery.twbsPagination2.js"></script>
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

*{ font-family: 'GmarketSansBold';
}

.box-step {
    overflow: hidden;
    width: 100%;
    margin: 50px 0;
    border: 0.5px solid #d6d6d6;
    border-top: none;
    font-size: 15px;
    display : flex;
}
.box-step dl {
    width: 25%;
 
    border-top: 1px solid #e0e0e0;
}


.box-step>dl>dd {
 
    padding: 19px 30px;
    border-left: ;

}
.box-step>dl>ddd {
   
    padding: 19px 30px;
    border-left: ;
}
.box-step>dl>dt {
    padding: 18px 30px 18px;
    color: #000;
    text-align:center;
    font-size: 1.5rem;
    border:;
}
.round {
    display: inline-block;
    padding: 0px 20px;
    border-radius: 10px;
    background: #F9D142;
    color: #292826;
    font-size: 1.5rem;
    vertical-align: middle;
}

.date-choice>.includeCallendar {
    
    padding-right: 0.521vw;
}


body {
    width: 100%;
    height: 100vh;
    /* background-color: rgb(255, 144, 144); */
    
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

<div style="width: 100%;">

		<div id="reserveRegion">			
				<div class="box-step">
					<dl class="date-choice">
						<dt>
							선택 날짜
						</dt>
						<ddd id="includeCallendar">
							<jsp:include page="calendar.jsp"></jsp:include>
						</ddd>
						<p style="text-align: center">날짜를 클릭</p>
					</dl>
					<dl class="theme-choice" style="width:75%">
						<dt id="ajaxlist">
							총 예약자 내역
						</dt>
						<dd class="theme">
							<div id="indexListAjax">
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
									<tbody >
										<c:forEach items="${rlist}" var="dto">
										<tr>
											<td class="bid">${dto.rId}</td>
											<td>${dto.rName}</td>
											<td>${dto.rThemeName}</td>
											<td>${dto.rDate}</td>
											<td>${dto.rTime}</td>
											<td>${dto.rCount}명</td>
											<td>${dto.rPhone}</td>
											<td><a class="contentView" href="AdminReserveDelete?reserveid=${dto.rId}">삭제하기</a></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
					<nav aria-label="Page navigation"> <!-- aria-label은 라벨표시가 안되는 것 예방 -->
						<ul class="pagination justify-content-center" id="pagination" style="margin:20px 0;">
							</ul>
					</nav>
						</dd>
					</dl>
				</div>
				
			
			</div>	
	</div>
	
	
	
<script type="text/javascript">
	$(function() {
		window.pagObj = $("#pagination").twbsPagination({
			totalPages: 35, //총 페이지 수
			visiblePages: 10, //보여지는 페이지 수
			onPageClick: function(event, page) {
				console.info(page + ' (from options)');
				$(".page-link").on("click", function(event) { //클래스 page-link는 BS4의 pagination의 링크 A
					event.preventDefault();
					let peo = $(event.target);
					let pageNo = peo.text();
					let purl;
					let pageA;
					let pageNo1;
					let pageNo2;
					if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
						purl = "ReservePageList?pageNo=" + pageNo;
					}
					else if(pageNo == "Next"){
						pageA = $("li.active > a") ; // li에 active클래스가 있고 a에 페이지 번호가 있음
						pageNo = pageA.text();
						pageNo1 = parseInt(pageNo); // 페이지 번호를 1더해야 하므로 정수로 변환
						pageNo2 = pageNo1 + 1;
						purl = "ReservePageList?pageNo="+pageNo2;
					
					}
					else if(pageNo == "Previous"){
						pageA = $("li.active > a") ; // li에 active클래스가 있고 a에 페이지 번호가 있음
						pageNo = pageA.text();
						pageNo1 = parseInt(pageNo); // 페이지 번호를 1더해야 하므로 정수로 변환
						pageNo2 = pageNo1 - 1;
						purl = "ReservePageList?pageNo="+pageNo2;
					
					}
					else if(pageNo=="First"){
						purl = "ReservePageList?pageNo=" + 1;
					}
					else if(pageNo=="Last"){
						purl = "ReservePageList?pageNo=" + 35;
						
					}
					else {
						return;
					}
					$.ajax({
						url : purl,
						type : "get",
						data : "",
						success : function(data) {

							$("#indexListAjax").html(data);
						//	let parent = $(peo).parent(); //page-link의 부모인 page-item에 추가
						//	$(parent).addClass("active");
						},
						error : function() {				
							alert("실패");
							
						}
					}); //ajax
				}); //page-link onclick
			} //onPageClick
		}) //window.pagObj
		.on('page', function(event, page) { //chaining방식
			console.info(page + ' (from event listening)');
		});
	});	
</script>

</body>
</html>