<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<script src="js/jquery.twbsPagination.js"></script>

<link rel="stylesheet" href="css/reserve/admin/ReserveCheck.css" />
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
		totalPages: Math.ceil(${ReserveListTotal}/10), //총 페이지 수
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
					cur = Math.ceil(${ReserveListTotal}/10);
					purl =  Math.ceil(${ReserveListTotal}/10);
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