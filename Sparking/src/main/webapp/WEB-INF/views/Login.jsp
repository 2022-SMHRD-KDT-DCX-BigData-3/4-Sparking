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
 userid=$("#memId").val();
 var passwd=$("#memPw").val(); if(userid == ""){
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
<div class="container col-sm-6 col-md-6 col-lg-10">
<div class="container col-sm-6 col-md-6 col-lg-10">
  <img src="${pageContext.request.contextPath}/resources/images/sp02.png" class=" mx-auto d-block rounded" alt="Sparking" width="960" height="240"> 
</div>

<br>
<div class="container col-sm-8 col-md-8 col-lg-6">
  <h2>Sparking Login</h2>
  <p>홈페이지 간단 소개글 작성하기</p>
  <form action="Login" method = "post" class="needs-validation" novalidate>
  <!-- <form action="form1" method = "post" class="needs-validation" novalidate> -->
  <div class="form-group">
      <label for="uname">ID:</label>
      <input type="text" class="form-control" id="memId" placeholder="Enter username" name="memId" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="memPw" placeholder="Enter password" name="memPw" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group form-check">
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
  <c:if test="${!empty mvo}">
로그인이 성공
<form action = 'Login' name="form2" method="post">
   <button type="button" id="btnLogout">로그아웃</button>
</form>
<c:if test="${mvo.memId=='admin'}">
<form action="admin" method="get">
	<button type = "submit" id="admin">관리자 페이지로 이동</button>
</form>
</c:if>
<c:if test="${mvo.memId!='admin'}">
<form action="resident" method="get">
	<button type = "submit" id="resident">입주민 페이지로 이동</button>
</form>

</c:if>
</c:if>
  <!-- 헌 디자인  -->

<%-- <form name="form1" method="post">
<table border="1" style="width: 400px">
<tr>
 <td>아이디</td>
 <td><input id="memId" name="memId"></td>
</tr>
<tr>
 <td>비밀번호</td>
 <td><input type="password" id="memPw" name="memPw"></td>
</tr>
<tr>
 <td colspan="2" align="center">
 <button type="button" id="btnLogin">로그인 </button>
<!--  <button type="button" class="btn btn-default" onclick = "location.href = 'joinForm'">회원가입</button> -->
</td>
</tr> 
</table>
</form>
</c:if>
<c:if test="${!empty mvo}">
로그인이 성공
<form action = 'Login' name="form2" method="post">
   <button type="button" id="btnLogout">로그아웃</button>
</form>
<c:if test="${mvo.memId=='admin'}">
<form action="admin" method="get">
	<button type = "submit" id="admin">관리자 페이지로 이동</button>
</form>
</c:if>
<c:if test="${mvo.memId!='admin'}">
<form action="resident" method="get">
	<button type = "submit" id="resident">입주민 페이지로 이동</button>
</form>

</c:if>
</c:if>
 --%>
</body>
</html>





