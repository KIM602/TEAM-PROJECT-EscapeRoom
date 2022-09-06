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
<meta id="_csfr" name="_csrf" content="${_csrf.token}"/> 
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

<style type="text/css">

@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

*{ font-family: 'GmarketSansBold';
}


#step2-table {
	width:100%;
    

}


#step2-table th {
    font-size: 1.2rem;
    font-weight: 300;
    width:15%;
    border: 0.052vw solid #f6f6f6;
    text-align: center;
    color:#fff;
}

#step2-table th:first-child {
	border: 0.052vw solid #000;
    background-color: #000;
    border-bottom-color: #fff;
    
   
}


#step2-table td {

    border: 0.052vw solid #000;
    font-size:1.2rem;
    width:80%;
    padding: 0.5vw;
}
#step2-table td p{
    margin-bottom:0;
}

#count-select{
  margin-bottom:0;
}
#count-select select {
    width: 100%;
    height: 1.646vw;
    border: 0.052vw solid #000;
    padding: 0 0.5vw;
    box-sizing: border-box;
    font-size: 1.2rem;
    box-sizing: border-box;
    font-family: 'GmarketSansBold'
}


#reserveOk{
text-align: center;

}


#checkboxform{
margin-bottom: 3%;
margin-top: 3%;
}

#checkboxform > #rTerms{
	width: 1.2rem;
    height: 1.2rem;
    cursor: pointer;
}
</style>
</head>
<script type="text/javascript">

function reserveCheck() {
	const form = document.reserveForm;
	//name check
	var namePattern = /^[가-힣]{2,6}$/;
	var name = form.rName.value;
	// 약관 동의
	var agree= form.rTerms.value;
	
	if(!check2(agree,"약관에 동의 해주세요")) {
		return false;
	}
	
	if(!check(namePattern, name, "유효하지 않은 이름입니다. 2글자이상의 한글만 입력 가능합니다.")){
		return false;
	}
	alert("예약완료")
	form.submit();
	
	
	
}

// 체크 메서드
function check(pattern, taget, message) {
	if(pattern.test(taget)) {
    	return true;
    }
    alert(message);
}
// 약관 동의 체크메서드
function check2(taget,message) {
	if(taget != 'noncheck'){
		return true;
	}
	alert(message);
}


// 가격 인원수 맞게 변환
$(document).ready(function name() {	
	$('#rCount').on('change',function(){
		var price1 = $(this).val()*22000;
		if($(this).val() >= 3) {
			price1 = 12000 + $(this).val() * 16000; 
		}		
		document.getElementById("price").innerHTML= price1 + "원";
		document.getElementById("price").setAttribute('value',price1);
		document.getElementById("inputprice").setAttribute('value',price1);
	})
})

// 약관 동의 체크박스 ajax

$(document).ready(function() {
$("#rTerms").on('click', function() {
      if ( $(this).prop('checked') ) {
        document.getElementById("rTerms").setAttribute("value", 'check');
      } else {
    	document.getElementById("rTerms").setAttribute("value", 'noncheck');
      }
    });
});


</script>



<body>
 		<form name="reserveForm" class="reserveForm"action="reserve" method="post">
 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> <!-- 안넣으려면 security-context.xml의 <csrf disabled="false"/> true로 변경  -->
			<table id="step2-table">
				<tbody>
					<tr>
						<th><a>예약일</a></th>
						<td>
							<a>${ymd}</a>
						<input type="hidden" name="rDate" value="${ymd}">
						</td>
					</tr>
					<tr>
						<th><a>테마명</a></th>
						<td>
							<a>${theme.tname}</a>
							<input type="hidden" name="tId" value="${theme.tid}">
						</td>
						
					</tr>
					<tr>
						<th><a>시간</a></th>
						<td>
							<a>${themeTime}</a>
							<input type="hidden" name="rTime" value="${themeTime}">
						</td>
						
					</tr>
					<tr>
						<th><a>성함</a></th>
						<td>
							<input type="text" name="rName" placeholder="이름을 입력해주세요." style="font-family: 'GmarketSansBold';font-size: 1.2rem">
							
						</td>
					</tr>
					<tr>
						<th><a>연락처</a></th>
						<td>
							<input type="text" name="rPhone" placeholder="숫자만 입력해주세요" style="font-family: 'GmarketSansBold';font-size: 1.2rem">
							
						</td>
					</tr>
					<tr>
						<th><a>인원</a></th>
						<td> 
							<label id="count-select">		
							<select name="rCount" id="rCount"> 
								<option value="2"selected>2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
								<option value="6">6명</option>
							</select>
							</label>
						</td>
						
					</tr>
					<tr>
						<th><a>비용</a></th>
						<td><input type="hidden" id="inputprice" name="rPrice" value="44000"> <a id="price">44000원</a></td>
					</tr>
					<tr>
						<th><a>주의사항</a></th>
						<td><p>예약해 주신 시간은 입장시간입니다.<br/>
							브리핑 및 짐 보관을 위해 15분전에 도착해주셔야합니다.<br/>
							늦으실 경우 늦은 시간만큼 시간이 차감됩니다.<br/>
							장치를 힘으로 억지로 열거나 작동시키려 할 경우 부상과 파손의 위험이 있습니다.<br/>
							소품 및 장치 파손 시 배상의 책임이 있습니다.<br/>
							테마 진행 및 이동시에는 장난을 치거나 뛰지 않도록 주의해 주세요.</p></td>
					</tr>
					
				</tbody>
				
			</table>
			<br/><br/>
			<div id="reserveOk">
				<div id="checkboxform" >
					<input type="checkbox" id="rTerms" name="rTerms" value="noncheck"><a style="font-size:2.5rem;"> 개인정보 처리방침 및 주의사항에 동의합니다.</a>
				</div>
				<input type="button" onclick="reserveCheck()" value="예약하기"  class="step-btn1 rounded-pill hover1" style="font-family: 'GmarketSansBold';"></input>
			</div>
		</form>
</body>



</html>