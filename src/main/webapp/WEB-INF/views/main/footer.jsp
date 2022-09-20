<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>

<script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/footerStyle.css">
 

</head>
<footer class="bg-light p-1">	
        <div class="f-wrap">
            <div class="f-menu">
                <ul>
                    <li><a href="#">개인정보취급방침</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">지점소개</a></li>
                </ul>
            </div>
            <div class="f-main">
            	<c:forEach items="${FooterList}" var="dto">
	            	<h4><img src="upimage/${dto.fImg}" alt="로고 이미지" /></h4>
	                <ul>
	                    <li>상호 : ${dto.fBusiness}</li>
	                    <li>대표 : ${dto.fName}</li>
	                    <li>이메일 : ${dto.fEmail} </li>
	                    <li>주소 : ${dto.fAddress} </li>
	                    <li>사업자등록번호 : ${dto.fNumber} </li>
	                </ul>
	                <p>고객센터<br/>
	                    <span>${dto.fTel}</span>
	                </p>
            	</c:forEach>
                
            </div>
            <div class="f-snsicon">
                <ul>
                    <li><a href="#"><i class="fa-brands fa-instagram-square"></i></a></li>
                    <li><a href="#"><i class="fa-brands fa-facebook-square"></i></a></li>
                    <li><a href="#"><i class="fa-brands fa-twitter-square"></i></a></li>
                </ul>
            </div>
        </div>
</footer>  	
</html>