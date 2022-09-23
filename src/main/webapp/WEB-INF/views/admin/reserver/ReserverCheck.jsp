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
<script src="js/jquery.twbsPagination.js"></script>
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



.box-step {
    overflow: hidden;
    width: 100%;
    margin: 50px 0;
    border: 0.5px solid #d6d6d6;
    border-top: none;
    font-size: 15px;
    display : flex;
    margin-top: 7%;
}
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
	font-size : 0.9rem;
	text-align: center;
}
thead>tr>th{
	font-family: 'GmarketSansBold';
	font-size : 0.9rem;
	text-align: center;
}
</style>


</head>
<body>

<div style="width: 100%;">

		<div id="reserveRegion">			
				<div class="box-step">
					<dl class="date-choice" style="margin-left: 3%;">
						<dt>
							선택 날짜
						</dt>
						<ddd id="includeCallendar">
							<jsp:include page="calendar.jsp"></jsp:include>
						</ddd>
						<p style="text-align: center">날짜를 클릭</p>
					</dl>
					<dl class="contentView" style="width:75%">
						<dt id="ajaxlist">
							총 예약자 내역
						</dt>
						<dd id="ddListAjax">
						<i class="fa fa-list" aria-hidden="true"></i>&nbsp;총 게시물&nbsp;&nbsp;<b>${ReserveListTotal}</b> 개&nbsp;&nbsp;&nbsp;( <b id="cur" class="text-primary">1</b><b id="tot">/ n</b> 페이지 )
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
										<c:forEach items="${rlist}" var="dto" varStatus="status">
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
	
	$("a.contentView").click(function name(e) {
		e.preventDefault();
		let ceo = $(e.target);
		let val = ceo.attr('data-value');

		$.ajax({
			url : ceo.attr("href"),
			type : "post",
			data :{ reserveid : val,
				${_csrf.parameterName}: "${_csrf.token}"
				
			},
			success : function name(d) {
				window.location.href = "main";
			},
			error : function name() {
				alert("실해");
			}
		})
		
	})
	
	
	
	window.pagObj = $("#pagination").twbsPagination({
		totalPages: 35, //총 페이지 수
		visiblePages: 5, //보여지는 페이지 수
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
				let cur;
				if(pageNo != "<<" && pageNo != "<" && pageNo != ">" && pageNo != ">>") {
					cur = pageNo;
					purl =  pageNo;
				}
				else if(pageNo == ">") {
					pageA = $("li.active > a"); //li에 active클래스가 있고 a에 페이지 번호가 있음
					pageNo = pageA.text(); //페이지 번호
					pageNo1 = parseInt(pageNo); //페이지 번호를 1 더해야 하므로 정수로 변환
					pageNo2 = pageNo1 + 1;
					cur = pageNo2;
					purl =  pageNo2;
				}
				else if(pageNo == "<") {
					pageA = $("li.active > a"); //li에 active클래스가 있고 a에 페이지 번호가 있음
					pageNo = pageA.text(); //페이지 번호
					pageNo1 = parseInt(pageNo); //페이지 번호를 1 더해야 하므로 정수로 변환
					pageNo2 = pageNo1 - 1;
					cur = pageNo2;
					purl =  pageNo2;
				}
				else if(pageNo == "<<") {
					cur = 1;
					purl = 1;
				}
				else if(pageNo == ">>") {
					cur = 35;
					purl =  35;
				}
				else {
					return;
				}
				$.ajax({
					url : "ReservePageList",
					type : "post",
					data : { pageNo : purl,
						${_csrf.parameterName}: "${_csrf.token}",
					},
					success : function(data) {
						
						
						
						$("b#cur").text(cur);
						
						$("#indexListAjax").html(data);
					},
					error : function() {				
						alert("에러");
					}
				}); //ajax
			}); //page-link onclick
		} //onPageClick
	}) //window.pagObj
	.on('page', function(event, page) { //chaining방식
		console.info(page + ' (from event listening)');
	});
	
	// 전체 페이지 개수
	var tot = Math.ceil(${ReserveListTotal}/10);
	$("b#tot").text(' / ' + tot);
});

</script>

</body>
</html>