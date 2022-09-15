<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 

<title>소개</title>

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

<script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>


<link rel="stylesheet" href="css/footerStyle.css">
<link rel="stylesheet" href="css/menubar.css">

<style>
@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


.scrollpage {
	font-family: 'GmarketSansMedium';
}

html, body {
    width: 100%;
	height: 100%;
}
.scrollpage {
    height: 100vh;
}

/* mobile */
@media only screen and (max-width:767px) {
    .nav-button { 
        right: 4%;
        top: 3%;
    }

    /* nav list */
    .nav-wrap {
        font-size: 5.6em;
    }
    .nav-box {
        width: 100%;
        padding: 30% 3%;
    }
    .nav-box li:nth-child(even){
        margin: 6% 0;
    }
    .mPrice {
    	padding-bottom: 8px;
    }
}

/* tab */
@media only screen and (min-width:768px) {
    /* img-box */
    section .img-box .img-inner {
        top: 24%;
        left: 33%;
    }
    /* text-box */
    section .text-box {
        bottom: 26%;
        left: 12%;
    }
    section .text-box .text {
        font-size: 3.5em;
    }
    /* btn-resrvation */
    a.btn-resrvation {
        right: 4%;
        bottom: 4%;
    }
}

/* pc */
@media only screen and (min-width:992px) {
    /* img-box */
    section .img-box .img-inner {
        left: 33%;
        top: 13%;
    }
    .mPrice {
    	padding-bottom: 37px;
    }

}


#notice p {
    font-size: 13px;
}
#notice {
	justify-content: space-around;
	text-align: center;
}
#notice i {
	font-size: 100px;
	margin: 20px;
}
ul, li {
	list-style: none;
}
/* ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
} */
#notice li {
	width: 350px;
    display: list-item;
    text-align: -webkit-match-parent;
    padding: 10px;
    margin-bottom: 20px;
/* 	border: 1px solid lightgray; */
	border-radius: 20px;
}
#demo ul li {
	width: 10px;
	height: 10px;
	border-radius: 50%;
	
}
.d-f {
	display: flex;
}
.fw-w {
	flex-wrap: wrap;
}
#div1 {
	color: #006666;
	font-size: 40px;
	font-weight: bold;
}
#demo, #about {
	width: 100%;
}

.carousel-inner img {
	width: 100%;
	max-height: 600px;
}
table#price {
	border-radius: 5px;
	box-shadow: 0px 3px 10px 2px lightyellow;
}
#price td, #price th {
	font-family: 'GmarketSansMedium';
	font-size: 1.2em;
	color: lightyellow;
}

.loader6{
  width: 12px;
  height: 12px;

  top: 46%;
  top: -webkit-calc(50% - 6px);
  top: calc(50% - 6px);
  left: 46%;
  left: -webkit-calc(50% - 6px);
  left: calc(50% - 6px);
  
  border-radius: 12px;
  background-color: #F9D142;
  -webkit-transform-origin:  50% 50%;
      transform-origin:  50% 50% ;
  -webkit-animation: loader6 1s ease-in-out infinite;
      animation: loader6 1s ease-in-out infinite;
}

.loader6:before {
  content: "";
  position: absolute;
  background-color: #F9D142;
  opacity: 0.5;
  top: 0px;
  left: -25px;
  height: 12px;
  width: 12px;
  border-radius: 12px;
}

.loader6:after {
  content: "";
  position: absolute;
  background-color: #F9D142;
  opacity: 0.5;
  top: 0px;
  left: 25px;
  height: 12px;
  width: 12px;
  border-radius: 12px;
}


@-webkit-keyframes loader6 {
    0% {-webkit-transform:rotate(0deg);}
    50% {-webkit-transform:rotate(180deg);}
    100% {-webkit-transform:rotate(180deg);}
}

@keyframes loader6 {
    0% {transform:rotate(0deg);}
    50% {transform:rotate(180deg);}
    100% {transform:rotate(180deg);}
}

</style>

</head>


<body>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<!-- nav 메뉴버튼 -->
<%@include file="../main/menubar.jsp" %>

<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


<div>
	<!-- 1 -->
	<!-- 1 -->
	<!-- 1 -->
    <div class="scrollpage">
		<div style="font-family: 'GmarketSansMedium'; background-color: #0C3338; color: lightyellow;">
    	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<!-- 소개 타이틀 -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<div id="about" class="container mb-4">
				<br/><br/><br/><br/><div class="loader6"></div>
				<h1><b><span style="text-shadow: 1px 1px 7px lightyellow; color:#292826;">ABOUT </span> OSM WORLD</b></h1>
				<br/>
				<h3><b>경험해보고 싶었던 “<span class="text-info">새로운 세상</span>”</b></h3>
				<div style="font-size: 1.2rem;">사실감 넘치는 인테리어와 신기하고 신선한 문제와 트릭 장치 그리고 전문작가의 흥미진진한 스토리까지!</div>
				<br/>
			</div>
			
			
			
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<!-- 이미지 캐러셀 -->
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			
			<div id="demo" class="container carousel slide mb-5" data-ride="carousel">
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
					<li data-target="#demo" data-slide-to="3"></li>
				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="image/001.jpg" alt="001"/>
						<div class="carousel-caption">
							<h4>_(:3」∠)_</h4>
						</div>
					</div>
					<div class="carousel-item">
						<img src="image/002.jpg" alt="002"/>
						<div class="carousel-caption">
							<h4>∠( ᐛ 」∠)＿</h4>
						</div>
					</div>
					<div class="carousel-item">
						<img src="image/003.png" alt="003"/>
						<div class="carousel-caption">
							<h4>ヾ(:3ﾉｼヾ)ﾉｼ</h4>
						</div>
					</div>
					<div class="carousel-item">
						<img src="image/004.png" alt="004"/>
						<div class="carousel-caption">
							<h4>∠( ᐛ 」∠)＿</h4>
						</div>
					</div>
				</div>
				
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a>
				<a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
   		</div>
    </div>
    <!-- 2 -->
    <!-- 2 -->
    <!-- 2 -->
    <div class="scrollpage">
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<!-- 소개글 -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<div class="text-center p-5" style="background-color: #F9D142;">
			<div id="div1">당신의 상상력, 판단력, 추리 능력은?</div>
			<br/>
			<div style="font-size: 18px;">
				<b style="color: #006666; font-size: 24px;">OSM Escape Room</b>은<br/>
				참가자가 실제 상황을 방불케 하는 특별한 테마 룸에 갇힌 채<br/>
				제한시간 이내에 주어진 미션을 해결하여 탈출하는 신개념 문화/여가 시설입니다.<br/>
				<br/>
				테마 룸 입장 후 주어진 시나리오에 따라 출입구는 봉쇄되며,<br/>
				여러분의 명석한 두뇌로 주어진 퀴즈를 해결해 탈출하세요.
			</div>
		</div>
		
		
		
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<!-- 요금 안내 -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<div class="mPrice" style="background-color: #0C3338;">
			<div class="container" style="width:70%; max-width: 700px; color: lightyellow;">
				<br/><br/>
				<h3><i class="fas fa-bullhorn" style="color: lightyellow;"></i>&nbsp;&nbsp;이용요금안내</h3>
				<table id="price" class="table text-center">
				<!-- table-bordered클래스를 추가하면 수직 테두리선이 추가됨 -->
				<!-- table-dark클래스는 배경색을 검정, 글자는 흰색인 테이블로 함 -->
					<thead>
						<tr>
							<th style="width: 30%">시간</th>
							<th>인원</th>
							<th>이용요금</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="3" style="vertical-align: middle;">60분</td>
							<td>2인</td>
							<td>44,000원</td>
						</tr>
						<tr>
							<td>3인</td>
							<td>66,000원</td>
						</tr>
						<tr>
							<td>4인</td>
							<td>80,000원</td>
						</tr>
						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡ -->
						<tr>
							<td rowspan="5" style="vertical-align: middle;">70분</td>
							<td>2인</td>
							<td>50,000원</td>
						</tr>
						<tr>
							<td>3인</td>
							<td>75,000원</td>
						</tr>
						<tr>
							<td>4인</td>
							<td>90,000원</td>
						</tr>
						<tr>
							<td>5인</td>
							<td>120,000원</td>
						</tr>
						<tr>
							<td>6인</td>
							<td>140,000원</td>
						</tr>
					</tbody>
					<tfoot class="text-left">
						<tr><td colspan="3">※ 각종 할인은 <a href="board2" class="text-warning"><b>EVENT 게시판</b></a>에서 확인해주세요.</td></tr>
					</tfoot>
				</table>
			</div>
		</div>
    </div>
    <!-- 3 -->
    <!-- 3 -->
    <!-- 3 -->
    <div class="scrollpage">
    	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<!-- 주의사항 -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		
		<div class="container text-center" style="margin-top: 100px;">
			<p style="font-size: 60px;"><b>NOTICE</b></p>
			<br/>
			<h5 class="text-danger"><b>이것만 꼭 지켜주세요!</b></h5>
			<br/><br/><br/>
		</div>
		
		<div class="container pb-5">
			<ul class="d-f fw-w" id="notice">
				<li>
					<div>
						<i class="far fa-calendar-check"></i>
						<h4 class="text-info">방문전 예약 필수</h4>
						<p>
							사이트(모바일,웹)를 통해 사전예약하세요.<br/>
							미 방문시엔 반드시 예약을 취소해주시기 바랍니다.
						</p>
					</div>
				</li>
				<li>
					<div>
						<img src="image/time.png" style="width:100px; height:100px; margin:20px;"/>
						<h4 class="text-info">시작시간 10분 전까지 도착</h4>
						<p>
							원활한 진행을 위하여 게임에 관한 안내가 이루어 집니다.<br/>
							늦게 도착하시면 플레이 시간에서 차감될 수 있습니다.
						</p>
					</div>
				</li>
				<li>
					<div>
						<i class="fas fa-user-times"></i>
						<h4 class="text-info">이용 제한</h4>
						<p>
							음주 후에는 카페를 이용하실 수 없습니다.<br/>
							일부 자극적이거나 선정적인 테마의 경우<br/>
							노약자, 임산부, 어린이 등의 참여가 제한될 수 있습니다.
						</p>
					</div>
				</li>
				<li>
					<div>
						<i class="fas fa-microphone-slash"></i>
						<h4 class="text-info">사진촬영 및 스포일러 제한</h4>
						<p>
							휴대폰 및 전자기기를 포함한 개인소지품은<br/>
							시작 전 직원의 안내에 따라 캐비닛에 보관하여 주세요.<br/>
							발각될 경우 카페 이용에 불이익이 발생할 수 있습니다.
						</p>
					</div>
				</li>
				<li>
					<div>
						<i class="fas fa-exclamation-triangle"></i>
						<h4 class="text-info">소품 파손 시 손해배상 청구</h4>
						<p>
							모든 문제는 작은 힘으로도 충분히 해결하실 수 있습니다.<br/>
							높은 곳, 소화기 등에는 단서가 숨겨져 있지 않습니다.
						</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>

<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<%@include file="../main/footer.jsp" %>

<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<script src="js/footerJs.js"></script>


<script>
window.addEventListener("wheel", function(e){
	e.preventDefault();
},{passive : false});

var $html = $("html");
var page = 1;
var lastPage = $(".content").length;

$html.animate({scrollTop:0},10);

$(window).on("wheel", function(e){
	if($html.is(":animated")) return;
	if(e.originalEvent.deltaY > 0){
		if(page== lastPage) return;
		page++;
	}
	else if(e.originalEvent.deltaY < 0){
		if(page == 1) return;
		page--;
	}
	var posTop = (page-1) * $(window).height();
	$html.animate({scrollTop : posTop});
});

</script>

</body>
</html>








