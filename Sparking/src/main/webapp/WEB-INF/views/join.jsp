<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
<meta charset="UTF-8">
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#memId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#memId").focus();
					return false;
				}
				if($("#memPw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#memPw").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
			});
			
				
			
		})
	</script>

<body>
<section id="container">
			<form action="join" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="memId">아이디</label>
					<input class="form-control" type="text" id="memId" name="memId" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="memPw">패스워드</label>
					<input class="form-control" type="password" id="memPw" name="memPw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="APT_Dong">동 이름</label>
					<input class="form-control" type="text" id="APT_Dong" name="apt_dong" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="APT_HNum">호수</label>
					<input class="form-control" type="text" id="APT_HNum" name="apt_hnum" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="APT_HNum">주차 차량번호</label>
					<input class="form-control" type="text" id="car_num" name="car_num" />
				</div>
				
				
				<div class="form-group has-feedback">
					<label class="control-label" for="APT_Dong">선호 주차시간</label>
					<input class="form-control" type="time" id="APT_Dong" name="p_intime" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="APT_Dong">선호 외출시간</label>
					<input class="form-control" type="time" id="APT_Dong" name="p_outtime" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="APT_Dong">아파트 번호</label>
					<input class="form-control" type="text" id="APT_Num" name="apt_num"/>
				</div>
				
				
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
</body>
</html>