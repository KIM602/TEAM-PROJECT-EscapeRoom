<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- reservePage css -->
<link href='css/reserve/reserveForm.css' rel='stylesheet' />

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
	
	if(window.confirm("예약하시겠습니까?")) {
		alert("예약완료");
		form.submit(function name(e) {
			e.preventDefault();
			$.ajax({
				url : "reserveOK",
				type : "get",
				data : "",
				success : function name(d) {
					
					$("#reserveRegion").html(d);
				},
				error : function name() {
					alert("예약체크/확인실패");
				}
			})
		});
	}
	else{
		alert("최소")
	}
	
	
	
	
	
	
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
		<input type="hidden" name="tId" value="${theme.tid}"> 
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
							<input type="hidden" name="rThemeName" value="${theme.tname}">
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
					<input type="checkbox" id="rTerms" name="rTerms" value="noncheck"><a style="font-size:1.0rem;"> 개인정보 처리방침 및 주의사항에 동의합니다.</a>
				</div>
				<input type="button" onclick="reserveCheck()" value="예약하기"  class="step-btn1 rounded-pill hover1" style="font-family: 'GmarketSansBold';"></input>
			</div>
		</form>
</body>



</html>