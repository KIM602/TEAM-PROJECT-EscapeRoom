<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>map</title>

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
<%@include file="../main/menubar.jsp" %>
    <section id="sec1">
    <article class="wrap" id="wrap">
		<h1 class="title2" style="text-shadow:1px 1px 1px #fff;">오시는 길</h1>

		<div id="map">
			<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d940.541868418093!2d126.83810537025047!3d37.54108701914674!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x3e349d96540c9f16!2z7J207KCg7Lu07ZOo7YSw7JWE7Lm0642w66-4IO2ZlOqzoey6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1659599894859!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
	</article>
    </section>
<%@include file="../main/footer.jsp" %>
<script src="js/map.js"></script>
<script>
	$(document).ready(function(){
		
	});
</script>
</body>
</html>