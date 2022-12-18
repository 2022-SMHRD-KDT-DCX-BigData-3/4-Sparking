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
<META HTTP-EQUIV="refresh" CONTENT="5">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>주차 공간</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/css/styles.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
  
   $(document).ready(function() {
        $('.btnAdd').click (function () {                                        
              $('.buttons').append (                        
                  '<input type="text" name="txt"> <input type="button" class="btnRemove" value="Remove"><br>'                    
              ); // end append                            
              $('.btnRemove').on('click', function () { 
                  $(this).prev().remove (); // remove the textbox
                  $(this).next ().remove (); // remove the <br>
                  $(this).remove (); // remove the button
              });
          }); // end click   
   });
  
  </script>
  
<style>
.card{
   width: 205px;
   height: 200px;
   border: 1px solid #ccc;
   bgcolor: black;
}
</style>
  
</head>
<body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav" >
            <div class="container">
                <a class="navbar-brand" href="#page-top">
                <h1>Sparking</h1>
                </a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                       <c:if test="${mvo.mem_Id=='admin'}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="admin">관리자 페이지</a></li>
                       </c:if>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#myModal" data-toggle="modal">회원정보 수정</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="resident">동 선택</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#">로그아웃</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
                <!-- 회원정보 수정페이지 시작  -->
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">회원정보 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
         <form action="update" method="post">
         <input type="hidden" value="${mvo.mem_Id}" name="mem_Id"/>
        <!-- Modal body -->
        <div class="modal-body">
          
          <div class="p-2">
          *아파트 선택           
              <select name="apt" class="custom-select mb-3">
                <option selected>apt</option>
                <option value="1">test1</option>
                <option value="2">test2</option>
                <option value="3">test3</option>
              </select>       
          </div>
          <br><br>
          <div class="container-fluid justify-content-center align-items-start">
          *동 <input type="text" class="form-control w-25" value="${mvo.apt_dong}" name="apt_dong"/>
          *호수 <input type="text" class="form-control w-25" value="${mvo.apt_hnum}" name="apt_hnum"/>
          <button type="button" class="btn-primary btn-sm">중복확인</button>
          </div>
          <div class="p-2">
           *비밀번호<input type="password" value="${mvo.mem_Pw}" name="mem_Pw"/>
          </div>
          
          <%-- <div class="p-2">
           *전화번호<input type="id" value = "${mvo.mem_Id}" name="mem_Id"/>
          </div> --%>
          
          *차량번호
           <!-- <button type="button" id="addButton" class="btn-primary">추가</button>
           <button type="button" id="rmvButton" class="btn-primary">삭제</button> -->
          <div id="add" class="p-2">
           <input type="text" value="${mvo.car_num}" name="car_num"/>
          </div>
          <div class="buttons">            
        <input type="text" name="txt"> <input type="button" class="btnAdd" value="Add"><br>        
        </div>  
          <div class="p-2">
          *선호 주차 시간
            <input type = "time" value = "${mvo.p_intime}" name="p_intime" />  
          </div>
          <div class="p-2">
          *선호 외출 시간       
             <input type = "time" value = "${mvo.p_outtime}" name="p_outtime"/>           
          </div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-primary">수정</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <!-- 회원정보 수정페이지 끝  -->
        
        
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center" 
        style="background-image: url('${pageContext.request.contextPath}/resources/images/bn6.jpg'); 
        background-repeat: no-repeat; background-size : cover; height: 500px;">
            <div class="container d-flex align-items-center flex-column">

            </div>
        </header>
        
  <br><br>
  
<div class="container">

  <h2 style="text-align: center;"><%=request.getParameter("apt_dong") %>동 주차 현황</h2>
                <!-- Icon Divider-->
      <div class="divider-custom">
         <div class="divider-custom-line"></div>
         <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
         <div class="divider-custom-line"></div>
      </div>
   <div class="card-group" id="pl">  
      <c:forEach var="i" begin="1" end="10" step="1" varStatus="ro" >
      <c:set var="temp" value="0" />
      <c:forEach var="j" begin="0" end="10" step="1">
            <c:if test="${list[j].DVC_NUM == i}">
               <div class="card-body text-center bg-danger">
                 <p class="card-text">${i } 번 자리</p>
                 <p class="card-text">주차중</p>
                 <p class="card-text">${list[j].CAR_NUM }</p> 
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

</div>

<br><br><br>
   <%-- 
   <c:forEach var="PI" items="${list}" varStatus="stat">
      기기번호 :${PI.DVC_NUM}<br>
      
   </c:forEach>
    --%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
       <!--  <script type="text/javascript">divreload()</script> -->

</body>
</html>