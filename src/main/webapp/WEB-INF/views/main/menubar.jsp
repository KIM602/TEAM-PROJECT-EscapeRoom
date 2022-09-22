<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="css/menubar.css">
</head>
<body>
<div class="nav-button">
        <a href="#" onclick="navButton(this)">
            <div class="hamburger hamburger-Ani">
                <div class="bar bar1"></div>
                <div class="bar bar2"></div>
                <div class="bar bar3"></div>
                <div class="bar bar4"></div>
            </div>
        </a>
    </div>
    <div class="nav-wrap">
        <nav class="nav-box">
            <ul class="nav-ul-padding">
                <li><a href="about">소개</a></li>
           	 	<li><a href="themePage">테마소개</a></li>
            	<li><a href="reservePage">예약확인/취소</a></li>
          		<li><a href="board1">공지사항</a></li>
            	<li><a href="map">오시는길</a></li>
            	<li class="formain"><a href="Homemain"><i class="fa-solid fa-house"></i></a></li>
            </ul>
        </nav>
    </div>
    
<script src="js/menubar.js"></script>
</body>
</html>