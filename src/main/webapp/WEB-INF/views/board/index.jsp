<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>

    <!-- RWD -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- MS -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- propper jquery -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- latest javascript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="css/indexStyle.css">
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
        <ul class="">
            <li><a href="about">소개</a></li>
            <li><a href="#">테마소개</a></li>
            <li><a href="#">예약확인/취소</a></li>
            <li><a href="board">공지사항</a></li>
            <li><a href="#">오시는길</a></li>
        </ul>
    </nav>
</div>
<div class="container">
    <section class="main-imgpage">
        <div class="img-box">
            <div class="img-inner">
                <img src="image/locked.png" alt="자물쇠이미지" onmouseenter="this.src='image/unlocked.png'" onmouseleave="this.src='image/locked.png'">
            </div>
        </div>
        <div class="text-box">
            <p class="text"></p>
        </div>
    </section>
</div>
<a href="#none" class="btn-resrvation">
    <i class="fa-solid fa-key"></i>
</a>

<script src="js/index.js"></script>


</body>
</html>