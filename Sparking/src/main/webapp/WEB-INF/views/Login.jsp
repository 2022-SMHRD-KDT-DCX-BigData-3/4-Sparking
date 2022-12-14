<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
/* 아이디 입력 요청하는 창 */
$(function(){
$("#btnLogin").click(function(){
 userid=$("#mem_Id").val();
 var passwd=$("#mem_Pw").val(); if(userid == ""){
  alert("아이디를 입력하세요");
  $("#memId").focus(); //입력포커스 이동

  return; //함수 종료
}
if(passwd==""){
 alert("비밀번호를 입력하세요"); 
 $("#memPw").focus();
  return;
}
//폼 내부의 데이터를 전송할 주소
 document.form1.action= "Login";
 document.form1.submit(); //제출
 });
 
$("#btnLogout").click(function(){
    document.form2.action= "Logout";
    document.form2.submit(); //제출
 });
});
</script>
</head>
<body>
<!-- 로그인 실패시 나오는 창 -->
<c:if test="${message == 'error'}">
 <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
 </div>
</c:if>
<c:if test="${message == 'logout'}">
 <div style="color:red;"> 로그아웃되었습니다.
 </div>  
</c:if>
<c:if test="${message == 'login'}">
 <div style="color:red;"> 로그인에 성공했습니다.
 </div>  
</c:if>

<c:if test="${empty mvo}">
</c:if>
<div class="wrap">
<img src="${pageContext.request.contextPath}/resources/images/bn3.jpg" class="img w-100" alt="Sparking"
   style="width: 100%; height: 100vh; filter: brightness(90%); position:relative; background-image: url("image-url");
   background-repeat: no-repeat; background-size: cover; background-position: center;">
  <div class="title p-2 " style="left: 150px; width: 600px; bottom: 180px; font-size: 1.8em; font-weight: bold; position: absolute;">
     <h2 style="color: orange;"><strong>SMART PARKING</strong></h2>
     <h1 style="color: white;"><strong>주차전쟁의 새로운 지평</strong></h1>
     <h1 style="color: white;"><strong>미리 알아보고 주차하는 편리함</strong></h1>
  </div>

  <div class="login_box p-2" style="left: 62%; width: 400px; bottom: 30px; font-size: 1.8em; font-weight: bold; position: absolute;">
     <div class="container-fluid rounded" style="width: 550px; height: 650px; background-color: white; background-color: rgba( 255, 255, 255, 0.5 );">
      <br><br><br>
      <img alt="logo" class="img-responsive" src="${pageContext.request.contextPath}/resources/images/sparking_logo.png" >
      
       <form action="Login" method = "post" class="needs-validation" novalidate style="">
  <!-- <form action="form1" method = "post" class="needs-validation" novalidate> -->
  <div class="form-group font-weight-normal" style="font-size: medium;">
      <label for="uname">ID:</label>
      <input type="text" class="form-control" id="mem_Id" placeholder="Enter username" name="mem_Id" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group font-weight-normal" style="font-size: medium;">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="mem_Pw" placeholder="Enter password" name="mem_Pw" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group form-check font-weight-normal" style="font-size: medium;">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" required> 로그인 유지
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check this checkbox to continue.</div>
      </label>
    </div>
    <button type="submit" method="post" class="btn btn-primary btn-block" id="btnLogin" >로그인</button>
  </form>
       
     </div>
  </div>
</div>


</body>
</html>

