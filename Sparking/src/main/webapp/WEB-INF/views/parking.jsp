<%@page import="com.mysql.fabric.xmlrpc.base.Array"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="kr.smhrd.entity.Parking" %>
<%@ page import="org.springframework.ui.Model"%>
  
  
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
<META HTTP-EQUIV="refresh" CONTENT="5">
<style>
.card{
	width: 205px;
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
<%-- ${list} --%>
<div class="container">
<br>
  <h2 style="text-align: center;"><%=request.getParameter("apt_dong") %>동 주차 현황</h2>
  <br><br>
   <div class="card-group" id="pl">  
   	<c:forEach var="i" begin="1" end="10" step="1" varStatus="ro" >
   	<c:set var="temp" value="0" />
		<c:forEach var="j" begin="0" end="10" step="1">
				<c:if test="${list[j].DVC_NUM == i}">
					<div class="card-body text-center bg-danger">
	  				<p class="card-text">${i } 번 자리</p>
		  			<p class="card-text">주차중</p>
			  		<%-- <p class="card-text">${list[j].CAR_NUM }</p> --%>
	  				</div>
	  				<c:set var="temp" value="1" />
		   		</c:if>
		   		
   		</c:forEach>
   				<c:if test="${temp==0 }">
	  				<div class="card-body text-center bg-success">
		  				<p class="card-text">${i } 번 자리</p>
			  			<p class="card-text">주차 가능</p>
		  			</div>
	  			</c:if>
   	</c:forEach>
  </div>  
  
	<%-- 
	<c:forEach var="PI" items="${list}" varStatus="stat">
		기기번호 :${PI.DVC_NUM}<br>
		
	</c:forEach>
	 --%>


</body>
</html>