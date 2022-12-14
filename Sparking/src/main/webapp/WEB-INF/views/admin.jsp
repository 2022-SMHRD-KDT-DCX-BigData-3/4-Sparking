<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript">
  <!-- 회원정보 뿌려주기  -->
  $(document).ready(function(){
     $("#tabhome").click(function(){
       $.ajax({
          url : "infoList",
          type : "get",
          dataType : "json",
          success : listView,
          error : function(){ alert("error");}
       });     
     });
     
     $("#tabmenu1").click(function(){
        $.ajax({
           url : "updateInfo",
           type : "get",
           dataType : "json",
           success : infoView,
           error : function(){ alert("error");}
        });     
      });   
  });
  function yesFn(mem_Id){    
           $.ajax({
              url : "yesInfo",
              type : "get",
              data : {"mem_Id":mem_Id},           
              success : function(){ 
                 location.href="admin";                 
              },
              error : function(){ alert("error");}
           });  
  }
  
   function noFn(mem_Id){    
      $.ajax({
         url : "noInfo",
         type : "get",
         data : {"mem_Id":mem_Id},           
         success : function(){ 
            location.href="admin";                 
         },
         error : function(){ alert("error");}
      });  
} 
  
  
  
  function infoView(data){
     var html="<table class='table table-striped'>";
     html+="<thead class='thead-dark'>";
     html+="<tr>";
     html+="<th>user_id</th>";
             
            html += "<th>user_pw</th>";
            html += "<th>in</th>";
            html += "<th>out</th>";
            html += "<th>차량 번호</th>";
            html += "<th>승인</th>";
            html += "<th>거절</th>";
            html += "</tr>";
            html += "</thead>";
            html += "<tbody>";
            $.each(data, function(indxe, info) {
               html += "<tr>";
               html += "<td>" + info.mem_Id + "</td>";
               html += "<td>" + info.mem_Pw + "</td>";
               html += "<td>" + info.p_intime + "</td>";
               html += "<td>" + info.p_outtime + "</td>";
               html += "<td>" + info.car_num + "</td>";
               html += "<td><button onclick='yesFn("+info.mem_Id+")'>승인</button></td>";
               html += "<td><button onclick='noFn("+info.mem_Id+")'>거절</button></td>";
               html += "</tr>";

            });

            html += "</tbody>";
            html += "</table>";
            $("#menu1").html(html);
   }
  
  function listView(data){
     var html="<table class='table table-striped'>";
     html+="<thead class='thead-dark'>";
     html+="<tr>";
     html+="<th>user_id</th>";
             
            html += "<th>user_pw</th>";
            html += "<th>dong</th>";
            html += "<th>ho</th>";
            html += "<th>in</th>";
            html += "<th>out</th>";
            html += "<th>가입여부</th>";
            html += "<th>전화번호</th>";
            html += "<th>차량 번호</th>";
            html += "</tr>";
            html += "</thead>";
            html += "<tbody>";
            $.each(data, function(indxe, info) {
               html += "<tr>";
               html += "<td>" + info.mem_Id + "</td>";
               html += "<td>" + info.mem_Pw + "</td>";
               html += "<td>" + info.apt_dong + "</td>";
               html += "<td>" + info.apt_hnum + "</td>";
      <%-- <td>${fn:substring(info.p_intime,11,16)}</td> --%>
        
            html += "<td>" + info.p_intime + "</td>";
               html += "<td>" + info.p_outtime + "</td>";
               html += "<td>" + info.apt_num + "</td>";
               html += "<td>" + info.car_num + "</td>";
               html += "</tr>";

            });

            html += "</tbody>";
            html += "</table>";
            $("#home").html(html);
  }
  
  
     
</script>
</head>
<body>

<nav class="navbar navbar-expand-sm navbar-light" style="background-color: gold;">
  <a class="navbar-brand" href="#">
     <img alt="" src="${pageContext.request.contextPath}/resources/images/sparking_logo.png">
  </a>
  <div class="navbar-text collapse navbar-collapse font-weight-bold">
    <ul class="navbar-nav mr-auto">
      <c:if test="${mvo.mem_Id=='admin'}">
      &emsp;
      <li class="nav-item">   
        관리자님 어서오세요
        &emsp;
      </li>
      &emsp;
       </c:if>
       <c:if test="${mvo.mem_Id !='admin'}">
     <li>ooo님 어서요세요</li>
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

<div class="bn_img" style="max-height: 520px; overflow: hidden;">
  <img src="${pageContext.request.contextPath}/resources/images/bn5.jpg" class="img w-100" alt="Sparking"
   style="width: 100%;max-height: initial; position:relative;">
</div>
<div class="title p-2 " style="left: 150px; width: 600px; bottom: 270px; font-size: 1.8em; font-weight: bold; position: absolute;">
     <h3 style="color: orange;"><strong>SMART PARKING</strong></h3>
     <h2 style="color: gray;"><strong>우리는 편리하고 편안한 주차를 꿈꿉니다</strong></h2>
</div>

<br>
<br>

<div class="col-sm-1 col-md-1 col-lg-2"></div>
<div class="container mt-3 col-sm-10 col-md-10 col-lg-8">
  <h2 style="text-align: center;">관리자 페이지</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a id="tabhome" class="nav-link active" data-toggle="tab" href="#home">회원정보</a>
    </li>
    <li class="nav-item">
      <a id="tabmenu1" class="nav-link" data-toggle="tab" href="#menu1">회원정보 수정</a>
      
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">외부주차 현황</a>
    </li>
  </ul>
  
  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
    
    <table class=" table table-striped">
       <thead class="thead-dark ">
         <tr>
         <th>user_id</th>
         <th>user_pw</th>
         <th>dong</th>
         <th>ho</th>
         <th>in</th>
         <th>out</th>
         <th>가입여부</th>
         <!-- <th>전화번호</th> -->
         <th>차량 번호</th>
         </tr>
       </thead>
       <tbody>
       <c:forEach var="info" items = "${list}">
         <tr>
            <td>${info.mem_Id}</td>
            <td>${info.mem_Pw}</td>
            <td>${info.apt_dong}</td>
            <td>${info.apt_hnum}</td>
            <%-- <td>${fn:substring(info.p_intime,11,16)}</td> --%>
            <td>${info.p_intime}</td>
            <td>${info.p_outtime}</td>
            <td>${info.apt_num}</td>
            <td>${info.car_num}</td>
         </tr>
         </c:forEach>
         
       </tbody>
     </table>
    <br>
    
    
    <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    회원추가
  </button>
  <br><br>
  <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
  </nav>

<!-- 회원가입 할 모달창  -->
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">회원가입</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
         <form id="formTag" action="/controller/join" method = "post">
        <!-- Modal body -->
        <div class="modal-body">
          
          <div class="p-2">
          *아파트 선택
            <!-- <form action="/action_page.php"> -->
              <select name="apt" class="custom-select mb-3">
                <option selected>아파트</option>
                <option value="1" ></option>
                <option value="2"></option>
                <option value="3" ></option>
              </select>
            </form>
          </div>
          <br><br>
          
          <div>
          아이디 <input type="text" class="form-control w-25" value="${mvo.mem_Id}" name="mem_Id" />
          </div>
          
           <div>
          *동 <input type="text" class="form-control w-25" value="${mvo.apt_dong}" name="apt_dong" />
          *호수 <input type="text" class="form-control w-25" value="${mvo.apt_hnum}" name="apt_hnum" />
          </div>
          
          <div class="p-2"><button type="button" class="btn-primary btn-sm">중복확인</button></div>
          
            <div class="p-2">
           *비밀번호<input type="password"value="${mvo.mem_Pw}" name="mem_Pw"/>
          </div>
          
          
          <div class="p-2">
           *차량번호<input type="text" value = "${mvo.car_num}", name = "car_num">
           <button type="button" class="btn-primary">추가</button>
          </div>
          
          <div class="p-2">
          *선호 주차 시간
           <input type = "time" value = "${mvo.p_intime}" name = "p_intime"/>
          </div>
          
          
          <div class="p-2">
          *선호 외출 시간
            <input type = "time" value = "${mvo.p_outtime}" name = "p_outtime"/>
          </div>
          
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <input id="join" type="submit" class="btn btn-primary" value="가입" />
        </div>
        </form>
      </div>
    </div>
  </div>
    
    
    </div>
    <div id="menu1" class="container tab-pane fade">
    
    <%--  <table class=" table table-striped">
     <thead class="thead-dark ">
         <tr>
            <th>user_id</th>
            <th>user_pw</th>
            <th>dong</th>
            <th>ho</th>
            <th>in</th>
            <th>out</th>
            <th>전화번호</th>
            <th>승인</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td>${mvo.mem_Id}</td>
           <td>${mvo.mem_Pw}</td>
            <td>${mvo.apt_dong}</td>
            <td>${mvo.apt_hnum}</td>
            <td>${mvo.p_intime}</td>
            <td>${mvo.p_outtime}</td>
            <td>010-1234-5678</td>
            <td>
              <button data-user-id ="$[vo.userid]" type="button" class="btn btn-primary" value = "승인" class = "appro">승인</button>
            <button data-user-id ="$[vo.userid]" type="button" class="btn btn-danger" value = "거부" class = "deni">거절</button>
            </td>
         </tr>
        </tbody>
      </table>
      <br><br>
      <nav aria-label="Page navigation example">
     <ul class="pagination">
       <li class="page-item">
         <a class="page-link" href="#" aria-label="Previous">
           <span aria-hidden="true">&laquo;</span>
         </a>
       </li>
       <li class="page-item"><a class="page-link" href="#">1</a></li>
       <li class="page-item"><a class="page-link" href="#">2</a></li>
       <li class="page-item"><a class="page-link" href="#">3</a></li>
       <li class="page-item">
         <a class="page-link" href="#" aria-label="Next">
           <span aria-hidden="true">&raquo;</span>
         </a>
       </li>
     </ul>
     </nav> --%>
      
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
      <table class=" table table-striped">
    <thead class="thead-dark ">
      <tr>
        <th>차량번호</th>
        <th>동</th>
        <th>기기번호</th>
        <th>주차시간</th>
        <th>비고</th>
        <th>관리자 확인</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>101</td>
        <td>201</td>
        <td>7</td>
        <td>
         <button type="button" class="btn btn-primary">확인</button>
        </td>
      </tr>
     </tbody>
     </table>
     <br><br>
     <nav aria-label="Page navigation example">
     <ul class="pagination">
       <li class="page-item">
         <a class="page-link" href="#" aria-label="Previous">
           <span aria-hidden="true">&laquo;</span>
         </a>
       </li>
       <li class="page-item"><a class="page-link" href="#">1</a></li>
       <li class="page-item"><a class="page-link" href="#">2</a></li>
       <li class="page-item"><a class="page-link" href="#">3</a></li>
       <li class="page-item">
         <a class="page-link" href="#" aria-label="Next">
           <span aria-hidden="true">&raquo;</span>
         </a>
       </li>
     </ul>
     </nav>
     
    </div>
  </div>
  <div class="col-sm-1 col-md-1 col-lg-2"></div>
  
</div>
<script>
/* 가입버튼 안먹혀서 제이쿼리 이용  */
const join = document.getElementById("join")
const formTag = document.getElementById("formTag")
join.addEventListener("click", ()=>{
   formTag.submit();
}
)
</script>

</body>

</html>