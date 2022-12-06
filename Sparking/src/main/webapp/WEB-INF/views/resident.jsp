<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>입주민 및 관리자 동페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
  
</head>
<body style="height:1500px">

<div class="container-fluid">
  <br>
  <h3>Sparking</h3>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top ">
  <a class="navbar-brand" href="#">Logo</a>
  <span class="navbar-text justify-content-end">
  <c:if test="${mvo.memId=='admin'}">
    <a href="admin">관리자 페이지</a>
  </c:if>
    &emsp;
    <a href="#myModal" data-toggle="modal">회원정보 수정</a>

  </span>  
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
         <input type="hidden" value="${mvo.memId}" name="memId"/>
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
           *비밀번호<input type="password" value="${mvo.memPw}" name="memPw"/>
          </div>
          
          <div class="p-2">
           *전화번호<input type="id" value = "${mvo.memId}" name="memId"/>
          </div>
          
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
  
<br>
<br>
<br>
<br>
<div class="container">
  <div class="card-columns">
    <div class="card bg-success">
      <a href="" >   
        <div class="card-body text-center">
           <p class="card-text"><a href="parking" class="text-body"><h3>101동</h3></a></p>
         </div>
      </a>
    </div>
    <div class="card bg-warning">
      <div class="card-body text-center">
        <p class="card-text"><a href="parking" class="text-body"><h3>102동</h3></a></p>
      </div>
    </div>
    <div class="card bg-success">
      <div class="card-body text-center">
        <p class="card-text"><a href="parking" class="text-body"><h3>103동</h3></a></p>
      </div>
    </div>
    <div class="card bg-danger">
      <div class="card-body text-center">
        <p class="card-text"><a href="parking" class="text-body"><h3>104동</h3></a></p>
      </div>
    </div>  
    <div class="card bg-warning">
      <div class="card-body text-center">
        <p class="card-text"><a href="parking" class="text-body"><h3>105동</h3></a></p>
      </div>
    </div>
    <div class="card bg-success">
      <div class="card-body text-center">
        <p class="card-text"><a href="parking" class="text-body"><h3>106동</h3></a></p>
      </div>
    </div>
  </div>
</div>


</body>
</html>
