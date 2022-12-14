<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Parking View</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript"></script>
<style>
table.card{
	width: 150px;
	height: 200px;
	border: 1px solid #ccc;
	bgcolor: black;
}

</style>
</head>
<body> 



<nav class="navbar navbar-expand-sm navbar-light" style="background-color: gold;">
  <a class="navbar-brand" href="#">
     <img alt="logo" class="img-responsive" src="${pageContext.request.contextPath}/resources/images/sparking_logo.png">
  </a>
  <div class="navbar-text collapse navbar-collapse font-weight-bold">
    <ul class="navbar-nav mr-auto">
      <c:if test="${mvo.mem_Id=='admin'}">
      &emsp;
      <li class="nav-item">   
        관리자님 어서오세요
        &emsp;
       <a href="admin">관리자 페이지</a>
      </li>
      &emsp;
       </c:if>
       <c:if test="${mvo.mem_Id !='admin'}">
     <li>ooo님 어서요세요</li>
     &emsp;
     </c:if>
     <li class="nav-item">
       <a href="resident">동 페이지</a>
     </li>
    </ul>
    <span class="navbar-text font-weight-bold">
      &emsp;
      <a href="#">로그아웃</a>
    </span>
    &emsp;&emsp;&emsp;
  </div>
</nav>

<div class="bn_img" style="max-height: 300px; overflow: hidden;">
  <img src="${pageContext.request.contextPath}/resources/images/bn6.jpg" class="img w-100" alt="Sparking"
   style="width: 100%;max-height: initial; position:relative;">
</div>
<div class="title p-2 " style="left: 200px; width: 600px; bottom: 430px; font-size: 1.8em; font-weight: bold; position: absolute;">
     <h3 style="color: gold;"><strong>SMART PARKING</strong></h3>
     <h2 style="color: gold;"><strong>우리는 편리하고 편안한 주차를 꿈꿉니다</strong></h2>
</div>

${parking}
 
<div class="container">
<br>
  <h2 style="text-align: center;"><%=request.getParameter("apt_dong") %>동 주차 현황</h2>
  <br><br>
  <div class="card-group">  
 	<c:forEach var = "i" begin = "0" end = "19">
 		<table class = "card" id = "i" name = "parkingLine">
 			<tr>
 				<th scope="row"></th>
 			</tr>
 			<br><br>
 			
 		</table>
   <c:forEach var="vo" items="${list}" varStatus="status">
    <c:if test="${status.index<10}">
    <div class="card ${vo.DVC_STATE==1 ? 'bg-success'  : 'bg-danger'}">
      <div class="card-body text-center">    
            <br>
            <br>
          <p class="card-text">${vo.DVC_STATE==1 ? '빈상태'  : '주차중'}</p>        
             <br>
             <br>
      </div>
    </div>   
    </c:if> 
   </c:forEach>
   </c:forEach> 
   </div>
   <br/>
   <div class="card-group"> 
    <c:forEach var="vo" items="${list}" varStatus="status">
    <c:if test="${status.index>=10}">
    <div class="card ${vo.DVC_STATE==1 ? 'bg-success'  : 'bg-danger'}">
      <div class="card-body text-center">    
            <br>
            <br>
          <p class="card-text">${vo.DVC_STATE==1 ? '빈상태'  : '주차중'}</p>        
             <br>
             <br>
      </div>
    </div>   
    </c:if>  
 </c:forEach>
  </div>
  
  <br><br><br><br>
  
  <%-- <div class="card-group">
    <c:forEach var = "i" begin = "11" end = "21">
       
    <div class="card ${vo.DVC_STATE==1 ? 'bg-success'  : 'bg-danger'}">
      <div class="card-body text-center">    
            <br>
            <br>
          <p class="card-text">${vo.DVC_STATE==1 ? '빈상태'  : '주차중'}</p>        
             <br>
             <br>
      </div>
    </div>
   </c:forEach>
 </c:forEach> --%>
  </div>  
 

</body>
</html>