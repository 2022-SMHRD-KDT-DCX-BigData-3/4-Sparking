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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/test.css">
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
<body style="background-image: url('${pageContext.request.contextPath}/resources/images/bn3.jpg');">
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
<div class="container">
   <div class="d-flex justify-content-center h-100">
      <div class="card">
         <div class="card-header">
            <img alt="logo" class="img-responsive" src="${pageContext.request.contextPath}/resources/images/sparking_logo.png" >
            <div class="d-flex justify-content-end social_icon">
               <span><i class="fab fa-facebook-square"></i></span>
               <span><i class="fab fa-google-plus-square"></i></span>
               <span><i class="fab fa-twitter-square"></i></span>
            </div>
         </div>
         <div class="card-body">
            <form action="Login" method = "post" class="needs-validation" novalidate style="">
           <!-- <form action="form1" method = "post" class="needs-validation" novalidate> -->
           <div class="form-group" style="font-size: medium;">
               <label for="uname">ID:</label>
               <div class="input-group">
               <div class="input-group-prepend">
                 <span class="input-group-text">
                   <img alt="id_icon" class="img-responsive" src="${pageContext.request.contextPath}/resources/images/id.png" >
                 </span>
               </div>
               <input type="text" class="form-control" id="mem_Id" placeholder="아이디를 입력하세요" name="mem_Id" required>
               </div>
               <div class="valid-feedback">Valid.</div>
               <div class="invalid-feedback">Please fill out this field.</div>
             </div>
             <div class="form-group font-weight-normal" style="font-size: medium;">
               <label for="pwd">Password:</label>
               <div class="input-group">
               <div class="input-group-prepend">
                 <span class="input-group-text">
                   <img alt="id_icon" class="img-responsive" src="${pageContext.request.contextPath}/resources/images/pw.png" >
                 </span>
               </div>
               <input type="password" class="form-control" id="mem_Pw" placeholder="비밀번호를 입력하세요" name="mem_Pw" required>
               </div>
               <div class="valid-feedback">Valid.</div>
               <div class="invalid-feedback">Please fill out this field.</div>
             </div>
             <div class="form-group form-check" style="font-size: medium;">
               <label class="form-check-label">
                 <div class="remember custom-control custom-switch">
                  <input type="checkbox" class="custom-control-input" id="switch1" name="example">
                  <label class="custom-control-label" for="switch1">로그인 유지</label>
                </div>
               </label>
               <div class="form-group">
              <input type="submit" value="Login" class="btn float-right login_btn">
            </div>
             </div>
             
           </form>
         </div>
         <div class="card-footer">
            
         </div>
      </div>
   </div>
</div>


</body>
</html>




