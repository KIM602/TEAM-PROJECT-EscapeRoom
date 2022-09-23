<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>JSP</title>
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

<!--  -->
<link href='css/reserve/bootstrap.css' rel='stylesheet' />
<!--     <link href='css/ct-navbar.css' rel='stylesheet' /> -->
<link href='css/reserve/rotating-card.css' rel='stylesheet' />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

<link href="https://netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">

<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
<style type="text/css">

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
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#StartForm{
font-family: 'GmarketSansMedium';
font-size : 1.5rem;
}	
h3,h4,h5{
font-family: 'GmarketSansMedium';
}
	
 
      .navbar-default .navbar-nav > li > a{
          padding: 15px 15px;
          margin: 5px 0;
      }

      .navbar-default{
          padding: 10px 0;
          background-color: rgba(255, 255, 255, 0.95);
          border-color: transparent;
          box-shadow: 0 0px 13px rgba(0,0,0,.2);
      }
      .btn-info,
      .btn-info:hover,
      .btn-info:focus{
          color: #FFF !important;
          background-color: #00bbff !important;
          border-color: #00bbff !important;
      }

      .btn-info{
          opacity: .8;
          transition: all 0.1s;
          -webkit-transition: all 0.1s;
      }
      .btn-info:hover,
      .btn-info:focus{
          opacity: 1;
      }
      .hover2 {
    transition: transform 0.3s ease;
	}
	.hover2:hover {
	    transform: scale3d(0.9, 0.9, 1) rotate3d(0, 0, 1, -1deg);
	}
	
	.time-choice label span img{
	    width: 24px;
	    height: 24px;
	    margin-right: 4px;
	    margin-bottom: 4px;
	}
	
	.time-choice label {
	  	float: left;
	    position: relative;
	    display: block;
	    width: 47.5%;
	    margin-bottom: 0.521vw;
	    margin-right: 2.5%;
	    text-align: center;
	    cursor: pointer;
	}
	.time-choice label span {
	   display: block;
	   width: 100%;
	   height: 50px;
	   line-height: 50px;
	   padding: 0.1563vw;
	   -webkit-box-sizing: border-box;
	   box-sizing: border-box;
	   background-color: #ebebeb;
	   white-space: nowrap;
	   overflow: hidden;
	   text-overflow: ellipsis;
	   font-size: 1.1rem;
		   
		}
		
    </style>
</head>

<body>
<%@include file ="../main/menubar.jsp" %>

<div class="container" id="StartForm">
    
    
    
	    <div class="row">
	        <h1 class="title" style="text-align: center">
	            오늘 예약가능한 테마 
	        </h1>
	        <br/>    
	        <div class="col-sm-10 col-sm-offset-1">
	            <c:forEach var="i" begin="1" end="9" varStatus="status">
	            	<c:set var="TodayReserve" value="TodayReserve${status.index}"></c:set>
	            	<c:set var="ThemeList" value="ThemeList${status.index}"></c:set>
	            	<c:set var="bestList" value="bestList${status.index}"></c:set>
	            		<c:if test="${requestScope[TodayReserve] eq 'NotYet'}"> <!-- 8개의 시간 전부 예약이 덜된것만 출력 -->
					         
						         <div class="col-md-4 col-sm-6">
						             <div class="card-container">
						                <div class="card">
						                    <div class="front">
						                        <div class="cover">
						                            <img src="upimage/${requestScope[ThemeList].tPhoto}"/>
						                        </div>
						                        <div class="user">
						                            <img class="img-circle" src="upimage/${requestScope[ThemeList].tPhoto}"/>
						                        </div>
						                        <div class="content">
						                            <div class="main">
						                                <h3 class="name" style="font-family: 'GmarketSansMedium';font-size : 1.5rem;">${requestScope[ThemeList].tName}</h3>
						                                <p class="profession">${requestScope[ThemeList].tGenre}</p>
						                                <p class="text-center">${requestScope[ThemeList].tProfile}</p>
						                            </div>
						                        </div>
						                    </div> <!-- end front panel -->
						                    <div class="back">
						                        
						                        <div class="content">
						                            <div class="main">
						                           
							                               <h4 class="text-center">가능 시간대</h4>
							                               <div style="height: 200px">
							                            <c:choose>	
						                            		<c:when test="${i==1}">
						                            			<c:forEach begin="1" end="8" varStatus="status3">
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==2}">
						                            			<c:forEach begin="11" end="18" varStatus="status3">
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==3}">
						                            			<c:forEach begin="21" end="28" varStatus="status3">
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==4}">
						                            			<c:forEach begin="31" end="38" varStatus="status3">
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==5}">
						                            			<c:forEach begin="41" end="48" varStatus="status3">
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==6}">
						                            			<c:forEach begin="51" end="58" varStatus="status3">
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==7}">
						                            			<c:forEach begin="61" end="68" varStatus="status3">
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==8}">
						                            			<c:forEach begin="71" end="78" varStatus="status3">
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	<c:when test="${i==9}">
						                            			<c:forEach begin="81" end="88" varStatus="status3">
						                            				<c:set var="todayCheck" value="todayCheck${status3.index}"></c:set>
						                            				 <c:choose>
							                            				<c:when test="${requestScope[todayCheck].rCheck == 0}">
							                            				<div class="time-choice">
							                            					<label class="hover2" style="background-color:#FFFFFF">
																					<span>
																					<img alt="" src="image/icon2_black.png">${requestScope[todayCheck].rTime}</span>
																			</label>
								                               			</div>
								                               			</c:when>
							                               			</c:choose>
							                               			
							                            		</c:forEach>
						                                	</c:when>
						                                	
						                                	
														 </c:choose>
														 </div>   	
							                                <p class="text-center"></p>
							
							                                <div class="stats-container">
							                                    <div class="stats">
							                                        <h5>인기 순위</h5>
							                                        <p>
							                                            ${requestScope[bestList].rank}위
							                                        </p>
							                                    </div>
							                                    <div class="stats">
							                                        <h5>난이도</h5>
							                                        <p>
							                                            ${requestScope[ThemeList].tDifficulty}
							                                        </p>
							                                    </div>
							                                    <div class="stats">
							                                        <h5>PlayTime</h5>
							                                        <p>
							                                            ${requestScope[ThemeList].tTime}
							                                        </p>
							                                    </div>
							                                </div>
							                              
							                                
						                            </div>
						                            
						                            
						                            
						                        </div>
						                        <div class="footer">
						                            <div class="social-links text-center">
						                                
						                            </div>
						                        </div>
						                    </div> <!-- end back panel -->
						                </div> <!-- end card -->
						            </div> <!-- end card-container -->
						        </div>
						         <!-- end col sm 3 -->
						        </c:if>
						        </c:forEach>
						        
					        </div> <!-- end col-sm-10 -->
	   
	   </div>
</div>


<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<script type="text/javascript">
    $().ready(function(){
        $('[rel="tooltip"]').tooltip();

        $('a.scroll-down').click(function(e){
            e.preventDefault();
            scroll_target = $(this).data('href');
             $('html, body').animate({
                 scrollTop: $(scroll_target).offset().top - 60
             }, 1000);
        });

    });

    function rotateCard(btn){
        var $card = $(btn).closest('.card-container');
        console.log($card);
        if($card.hasClass('hover')){
            $card.removeClass('hover');
        } else {
            $card.addClass('hover');
        }
    }


</script>

</body>
</html>


</body>
</html>