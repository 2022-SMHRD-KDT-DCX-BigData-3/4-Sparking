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
</head>
<body> 
${parking}
 
<div class="container">
  <h2>Parking Information</h2>
  <br><br><br>
  <div class="card-group">  
 
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