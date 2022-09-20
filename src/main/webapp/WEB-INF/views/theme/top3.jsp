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
</head>
<body>
	<p class="message text-center"><i class="fa-solid fa-crown"></i>&nbsp;예약 TOP 3</p>
	  	<div class="modalimgbox">
	  			<ul class="top3img">
		  			<li style="margin: 20px;"><img class="gold" src="image/gold.png" /><div class="polaroid"><img src="upimage/${theme1.tphoto}" ></div></li>
		  			<li style="margin: 20px;"><img class="silver" src="image/silver.png"/><div class="polaroid"><img src="upimage/${theme2.tphoto}" ></div></li>
		  			<li style="margin: 20px;"><img class="bronze" src="image/bronze.png"/><div class="polaroid"><img src="upimage/${theme3.tphoto}" ></div></li>
	  			</ul>
	  	
  			<div class="top3name">
  				<c:forEach items="${rlist}" var="dto1"><p class="name">${dto1.rthemename}</p></c:forEach>
			</div>
			<br />
			<br />
			<button class="btn btn-secondary" type="button" data-dismiss="modal">CLOSE</button>
		</div>
</body>
</html>
