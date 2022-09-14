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
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<style type="text/css">
body{
    background-color: #39bbdb;
    color: #fff;
    padding-bottom: 0;
    min-height: 100%;
    font-family: 'Open Sans','Segoe UI';
    font-size: 13px;
}

.error-header {
  background: #fff;
  height: 180px;
}

.error-container {
  background: rgba(0,0,0,.05);
  text-align: center;
}

.error-container h1 {
  color: #39bbdb;
}

.error-container h1 {
  font-size: 110px;
  font-weight: 300;
  margin: -103px 0 0 0;
  text-align: center;
}

.error-divider {
  margin-top: -27px;
  padding: 30px 0;
}

.error-container h2 {
  font-size: 58px;
  font-weight: 300;
  margin: 0;
  text-transform: uppercase;
}

.error-container p.description {
  color: #e5e5e5;
  font-size: 40px;
  margin: 0;
}

.return-btn, .return-btn:hover {
  border: 1px solid rgba(255,255,255,.3);
  padding: 10px 15px;
  margin-top: 100px;
  margin-bottom: 30px;
  display: inline-block;
  -webkit-border-radius: 5px;
  -webkit-background-clip: padding-box;
  -moz-border-radius: 5px;
  -moz-background-clip: padding;
  border-radius: 5px;
  background-clip: padding-box;
  color: #fff;
  font-size: 16px;
  font-weight: 300;
}

a:hover{
    text-decoration:none;    
}

</style>
</head>
<body>
<div class="error-header"> </div>
<div class="container ">
    <section class="error-container text-center">
        <h1>404</h1>
        <div class="error-divider">
            <h2>PAGE NOT FOUND.</h2>
            <p class="description">잘못된 페이지 접근입니다.</p>
        </div>
        <a href="Homemain" class="return-btn"><i class="fa fa-home"></i>Home</a>
    </section>
</div>
</body>
</html>