<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 

<title>이벤트 게시판</title>

<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 -->
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<!-- 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
 -->
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- 페이지처리 js 임포트 -->
<script src="js/jquery.twbsPagination.js"></script>


<style>
.pagination > li > a
{
    background-color: white;
    color: #20B2AA;
}

.pagination > li > a:focus,
.pagination > li > a:hover,
.pagination > li > span:focus,
.pagination > li > span:hover {
    color: 	#008080;
    background-color: #FFFFE0;
    border-color: #ddd;
}

.pagination > .active > a {
    color: #FFFFE0 !Important;
    background-color: #008080 !Important;
    border: solid 1px #008080 !Important;
}

.pagination > .active > a:hover {
    background-color: #008080 !Important;
    border: solid 1px #008080;
}
</style>

</head>
<body>

<!-- 로그인 id반환. var값인 user_id를 EL로 사용 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<h4 id="eventTitle" style="margin-top: 40px; margin-bottom: 20px; font-weight: bold;">이벤트</h4>

<div id="eTop">
	<i class="fa fa-list" aria-hidden="true"></i>&nbsp;총 게시물&nbsp;&nbsp;<b>${totalEvent}</b> 개&nbsp;&nbsp;&nbsp;( <b id="cur" class="text-primary">1</b><b id="tot">/ e</b> 페이지 )
	
	<sec:authorize access="isAuthenticated()">
		<a id="writeEventForm" href="writeEventForm" class="btn btn-info">글 작성하기</a>
	</sec:authorize>
</div>


<div id="admin_eventTab"></div>
<button type="button" id="page1btn" hidden=""></button>


<!-- 페이지 표시 -->
<nav aria-label="Page navigation" class="container" style="position: fixed; float: revert; bottom: 8%;"> 
	<ul class="pagination justify-content-center" id="paginationE" style="margin:20px 0;"></ul>
</nav>


<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<script>
$(document).ready(function() {
	$(function() {
		window.pagObj = $("#paginationE").twbsPagination({
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
						purl = "admin_plistE?pageNo=" + pageNo;
					}
					else if(pageNo == ">") {
						pageA = $("li.active > a"); //li에 active클래스가 있고 a에 페이지 번호가 있음
						pageNo = pageA.text(); //페이지 번호
						pageNo1 = parseInt(pageNo); //페이지 번호를 1 더해야 하므로 정수로 변환
						pageNo2 = pageNo1 + 1;
						cur = pageNo2;
						purl = "admin_plistE?pageNo=" + pageNo2;
					}
					else if(pageNo == "<") {
						pageA = $("li.active > a"); //li에 active클래스가 있고 a에 페이지 번호가 있음
						pageNo = pageA.text(); //페이지 번호
						pageNo1 = parseInt(pageNo); //페이지 번호를 1 더해야 하므로 정수로 변환
						pageNo2 = pageNo1 - 1;
						cur = pageNo2;
						purl = "admin_plistE?pageNo=" + pageNo2;
					}
					else if(pageNo == "<<") {
						cur = 1;
						purl = "admin_plistE?pageNo=" + 1;
					}
					else if(pageNo == ">>") {
						cur = 35;
						purl = "admin_plistE?pageNo=" + 35;
					}
					else {
						return;
					}
					$.ajax({
						url : purl,
						type : "get",
						data : "",
						success : function(data) {
							$("b#cur").text(cur);
							$("#eTotal").removeClass('d-none');
							$("#admin_eventTab").html(data);
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
		var tot = $("#paginationE").twbsPagination("getTotalPages");
		$("b#tot").text(' / ' + tot);
	});
			
	$("#page1btn").on('click', function() {
		$.ajax({
			url : "admin_plistE?pageNo=1",
			type : "get",
			data : "",
			success : function(d) {
				$("#admin_eventTab").html(d);
			},
			error : function() {
				alert("에러");
			}
		});
	});
	$("#page1btn").trigger("click");
	
	/* 작성 버튼 ajax */
	$("#writeEventForm").click(function(e) {
		e.preventDefault();
		$.ajax({
			url: "writeEventForm",
			type: "get",
			data: "",
			success: function(data) {
				$("#eventTitle").text('이벤트 작성 페이지');
				$("#eTop").addClass('d-none');
				$("#paginationE").addClass('d-none');
				$("a.tab").addClass('disabled');
				$("#osm").removeAttr('href');
				$("#admin_eventTab").html(data);
			},
			error: function() {
				alert("에러");
			}
		});
	});
});

</script>

</body>
</html>