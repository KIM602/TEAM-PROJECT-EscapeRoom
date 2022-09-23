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
	  			<c:choose>
					<c:when test="${not empty theme1.tphoto}">
						<li style="margin: 20px;">
							<img class="gold" src="image/gold.png"/>
							<div class="polaroid">
								<img src="upimage/${theme1.tphoto}"/>
								<p>${rlist[0].rthemename}</p>
							</div>
						</li>
					</c:when>
					<c:otherwise>
						<li style="margin: 20px;">
							<img class="gold" src="image/gold.png"/>
							<div class="polaroid">
								<img src="image/WhiteEmptyBox.jpg"/>
							</div>
						</li>
					</c:otherwise>
	  			</c:choose>
	  			<c:choose>
					<c:when test="${not empty theme2.tphoto}">
						<li style="margin: 20px;">
							<img class="silver" src="image/silver.png"/>
							<div class="polaroid">
								<img src="upimage/${theme2.tphoto}"/>
								<p>${rlist[1].rthemename}</p>
							</div>
						</li>
					</c:when>
					<c:otherwise>
						<li style="margin: 20px;">
							<img class="silver" src="image/silver.png"/>
							<div class="polaroid">
								<img src="image/WhiteEmptyBox.jpg"/>
							</div>
						</li>
					</c:otherwise>
	  			</c:choose>
	  			<c:choose>
					<c:when test="${not empty theme3.tphoto}">
			  			<li style="margin: 20px;">
				  			<img class="bronze" src="image/bronze.png"/>
				  			<div class="polaroid">
				  				<img src="upimage/${theme3.tphoto}"/>
				  				<p>${rlist[2].rthemename}</p>
				  			</div>
			  			</li>
					</c:when>
					<c:otherwise>
						<li style="margin: 20px;">
							<img class="bronze" src="image/bronze.png"/>
							<div class="polaroid">
								<img src="image/WhiteEmptyBox.jpg"/>
							</div>
						</li>
					</c:otherwise>
	  			</c:choose>
  			</ul>
  			<!-- 
  			<div class="top3name">
  				<c:forEach items="${rlist}" var="dto1"><p class="name">${dto1.rthemename}</p></c:forEach>
			</div>
  			 -->
			<br/>
			<br/>
			<button class="btn btn-secondary" type="button" data-dismiss="modal">CLOSE</button>
		</div>
</body>
</html>
