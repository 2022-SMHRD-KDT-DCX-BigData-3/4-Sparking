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
  });
  
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
					html += "<td>" + info.memId + "</td>";
					html += "<td>" + info.memPw + "</td>";
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
  
  
  	// 가입 승인 및 거절하는 ajax
  	$('.appro').click(function () {
		const successid = $(this).data("userid");
		console.log(successid);
		// 0 가입대기, 1 가입승인, 2 가입거절
		
		$.ajax({
			type : 'post'
			url : '<c:url value = "/admin/successid"/>',
			data : {
				id : successid,
			},
			success : function(data) {
			}, error : function (status, error) {
				console.log('에러발생!!');
				
				console.log(status, error);
			}
		});
		$('.modal_approve').fadein(500);	
	});
  	
  	// 가입 여부 버튼 클릭시 요청 삭제
  	$('./deni').click(function () {
		console.log('회원가입 거부!');
  	});
  	
  	$('userDrop').click(function () {
		const dropid = $(this).data("userid");
		console.log(dropid);
		$.ajax({
			type : 'post'
			url : '<c:url value = "/admin/dropid" />',
			data : {
			id : dropid,
			},
			success : function (data) {
			}, error : function (status, error) {
						console.log('에러발생!!')
						
						console.log(status, error);
			}
			
		});
		
	});  //???? 왜 이게 하나 남는거지....???
  
  
  
  
  
		</script>
</head>
<body>

<div class="container-fluid col-12">
  <br>
  <h3>Sparking</h3>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top col-12">
  <a class="navbar-brand" href="#">Logo</a>
  <span class="navbar-text justify-content-end">
    Navbar text
  </span>
</nav>
<br>
<br>

<div class="col-sm-1 col-md-1 col-lg-2"></div>
<div class="container mt-3 col-sm-10 col-md-10 col-lg-8">
  <h2>Toggleable Tabs</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a id="tabhome" class="nav-link active" data-toggle="tab" href="#home">회원정보</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">회원정보 수정</a>
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
         <th>전화번호</th>
         <th>차량 번호</th>
         </tr>
       </thead>
       <tbody>
       <c:forEach var="info" items = "${list}">
         <tr>
            <td>${info.memId}</td>
            <td>${info.memPw}</td>
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

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">sign in</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          
          <div class="p-2">
          *아파트 선택
            <form action="/action_page.php">
              <select name="apt" class="custom-select mb-3">
                <option selected>apt</option>
                <option value="1">test1</option>
                <option value="2">test2</option>
                <option value="3">test3</option>
              </select>
            </form>
          </div>
          <br><br>
          
          <div>
          *동 <input type="text"></input>
          *호수 <input type="text"></input>
          </div>
          
          <div class="p-2"><button type="button" class="btn-primary btn-sm">중복확인</button></div>
          
          <div class="p-2">
           *비밀번호<input type="password">
          </div>
          
          <div class="p-2">
           *전화번호<input type="text">
          </div>
          
          <div class="p-2">
           *차량번호<input type="text">
           <button type="button" class="btn-primary">추가</button>
          </div>
          
          <div class="p-2">
          *선호 주차 시간
            <form action="/action_page.php">
              <select name="time" class="custom-select mb-3 w-25">
                <option selected>time</option>
                <option value="1">01</option>
                <option value="2">02</option>
                <option value="3">03</option>
              </select>
              
              <select name="minute" class="custom-select mb-3 w-25">
                <option selected>minute</option>
                <option value="1">01</option>
                <option value="2">02</option>
                <option value="3">03</option>
              </select>
            </form>
          </div>
          
          <div class="p-2">
          *선호 외출 시간
            <form action="/action_page.php">
              <select name="time" class="custom-select mb-3 w-25">
                <option selected>time</option>
                <option value="1">01</option>
                <option value="2">02</option>
                <option value="3">03</option>
              </select>
              
              <select name="minute" class="custom-select mb-3 w-25">
                <option selected>minute</option>
                <option value="1">01</option>
                <option value="2">02</option>
                <option value="3">03</option>
              </select>
            </form>
          </div>
          
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">가입</button>
        </div>
        
      </div>
    </div>
  </div>
    
    
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
     <table class=" table table-striped">
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
            <td>${mvo.memId}</td>
           <td>${mvo.memPw}</td>
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
    </div>
  </div>
  <div class="col-sm-1 col-md-1 col-lg-2"></div>
  
</div>

</body>
</html>


</body>
</html>