<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page session="false" %>

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
<title>login</title>

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
<link rel="stylesheet" href="style/signup.css">
</head>
<body>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"></sec:authentication>
</sec:authorize>
 <div class="login-container d-flex align-items-center justify-content-center">
        <form class="login-form text-center"  action="login" method="post">
            <h1 class="mb-5 font-weight-light text-uppercase">Sign up</h1>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="fotm-group mb-3">
                <input type="text" name="pid"  id="userId" class="form-control rounded-pill form-control-lg" placeholder="아이디">
            </div>
            <div class="fotm-group">
                <input type="password" name="ppw" class="form-control rounded-pill form-control-lg" placeholder="비밀번호">
            </div>
            <div class="forget-link d-flex align-items-center justify-content-between mt-3">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="remember">
                    <label for="remember">아이디 저장</label>
                </div>
                <a href="#">비밀번호를 잊으셨나요?</a>
            </div>
            <button type="submit" class="mt-5 btn btn-warning btn-custom btn-block rounded-pill btn-lg">Sign Up</button>
            <p class="mt-3 font-weight-normal">회원이 아니시라면 <a href="AdminJoinView"><strong>여기를 눌러주세요</strong></a></p>
            
            <hr>
        </form>
    </div>

</body>
</html>