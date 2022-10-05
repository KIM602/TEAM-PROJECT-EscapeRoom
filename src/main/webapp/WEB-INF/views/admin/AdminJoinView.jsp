<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"> <!-- 페이지 위조 요청을 방지한 태그 -->

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

<!--fontawesome icon-->
<script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="style/join.css">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            	  // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.               
                
                $("[name=poaddress]").val(data.zonecode);
                $("[name=paddress]").val(fullRoadAddr);
                
                document.getElementById('poaddress').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('paddress').value = fullRoadAddr;

            }
        }).open();
    }
</script>

</head>
<body>
	<div class="container join-container p-5">
        <h3 class="text-center">회원가입</h3>
        <form action="join" method="post" name="joinform" id="joinform">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="form-group pt-4">
                <label for="uId">아이디</label>
                <div class="d-flex">
	                <input type="text" id="uId" class="form-controlStyle" name="pid" placeholder="아이디 입력" required >
	                <button id="idcheck" type="button" class="btn btn-info">아이디 중복체크</button>
                </div>
			</div>
            	<p id="textalert"></p>
            <div class="form-group pt-3">
                <label for="uPw">비밀번호</label>
                <input type="password" id="uPw" class="form-control" name="ppw" placeholder="비밀번호 입력" required >
            </div>
            <div class="form-group pt-3">
                <label for="uName">상호명</label>
                <input type="text" id="uName" class="form-control" name="pname" placeholder="상호명" required>
            </div>
            
            <div class="form-group pt-3">
            	<label for="uAddress">주소</label><br />        
				<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="poaddress" id="uAddress" type="text" readonly="readonly" >
				<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
			</div>
			
			<div class="form-group">
			    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="paddress" id="paddress" type="text" readonly="readonly" />
			</div>
			
			<div class="form-group">
			    <input class="form-control" placeholder="상세주소" name="pdetailaddress" id="pdetailaddress" type="text"  />
			</div>

            <div class="form-group pt-4 pb-4">
                <label for="uNumber">사업자 등록 번호</label>
                <input type="text" id="uNumber" class="form-control" name="pnumber" placeholder="사업자등록번호 10자리 입력" maxlength="12" required numberOnly>
            </div>
            <button type="submit" class="btn btn-success">회원가입</button>
            <a href="AdminLoginView" class="btn btn-danger">취소</a>
           <!-- <a href="AdminLoginView" class="btn btn-primary" >로그인</a> -->
        </form>
    </div>
    
    <script>
    	$(document).ready(function(){	
    		$("#idcheck").click(function(){
    			let pid=$('#uId').val();
    			$.ajax({
    				url : "idcheck",
    				type : "get",
    				data : {"pid" : pid},
    				success : function(data){
    					if(data.search("idcheck-success") > -1){
    						$("#textalert").text("사용 가능한 아이디입니다.").css({'color':'green','font-size':'0.8rem'})
    					}
    					else {
    						$("#textalert").text("중복된 아이디입니다.").css({'color':'red','font-size':'0.8rem'})
    					}
    				},
    				error : function() {
    					alert("서버 접속실패");
    				}
    			});
    		});
    	});
    	// 숫자 및 하이픈만 입력가능
    	$(document).on("keyup", "input[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9-]/gi,"") );});
    </script>
</body>
</html>