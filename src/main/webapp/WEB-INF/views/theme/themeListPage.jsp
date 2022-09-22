<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>테마목록</title>
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

<link rel="stylesheet" href="css/theme/themeListPage.css" />

</head>
<body>
<div id="mainRegion" class="container mt-3">
	<h1 class="text-center mt-5">현재테마목록</h1>
		<br /><br />
		<div class="row mb-4" >
			<c:forEach items="${themeList}" var="dto">
				<div class="col-md-4" style="height:auto;">
					<div id="box" class="card">
						<img class="card-img-top" src="upimage/${dto.tphoto}" alt="Card image" style="width:100%; height:100%; margin:auto;"/>
						<div class="card-body">
							<h5 class="card-title text-center">제목 : ${dto.tname}</h5>
							<a href="themeDetailsPage?tid=${dto.tid}" class="themeDetailsPage btn btn-dark stretched-link">자세히보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
</div>

<script>
$(document).ready(function(){
	//상세정보 보기
	$("a.themeDetailsPage").click(function(event){
		event.preventDefault();
		let ceo = $(event.target);
		$.ajax ({
			url : ceo.attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$(".main-page").html(data);
			},
			error : function() {
				alert("땡!");
			}
		});
	});
});
</script>
</body>
</html>
