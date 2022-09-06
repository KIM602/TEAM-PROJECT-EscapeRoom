<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>

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
    
    <link rel="stylesheet" href="css/map.css">
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
                <li><a href="#">소개</a></li>
                <li><a href="#">테마소개</a></li>
                <li><a href="#">예약확인/취소</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">오시는길</a></li>
            </ul>
        </nav>
    </div>

    <section id="sec1">
    <article class="wrap" id="wrap">
		<h1 class="title2" style="text-shadow:1px 1px 1px #fff;">오시는 길</h1>

		<div id="map">
			<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d940.541868418093!2d126.83810537025047!3d37.54108701914674!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x3e349d96540c9f16!2z7J207KCg7Lu07ZOo7YSw7JWE7Lm0642w66-4IO2ZlOqzoey6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1659599894859!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
	</article>
    </section>

    <footer>
        <div class="f-wrap">
            <div class="f-menu">
                <ul>
                    <li><a href="#">개인정보취급방침</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">지점소개</a></li>
                </ul>
            </div>
            <div class="f-main">
                <h4>logo 이미지 출력구간</h4>
                <ul>
                    <li>상호 : EL </li>
                    <li>대표 : EL</li>
                    <li>이메일 : EL </li>
                    <li>주소 : EL </li>
                    <li>사업자등록번호 : EL </li>
                </ul>
                <p>고객센터<br/>
                    <span>EL</span>
                </p>
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
<script src="js/map.js"></script>
</body>
</html>