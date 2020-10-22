<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyOn 로그인</title>
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--  <script type="text/javascript" src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>-->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">

<style type="text/css">
td {
	border: 1px solid #000000;
	border-collapse: collapse;
}
</style>
<script>
$(document).ready(function(){
	$('form').on('submit',function(){
		if($('#mem_id').val()==''){
			$('#id_check').text('아이디를 입력하세요.');
			$('#id_check').css('color', 'red');
			$('#id_check').fadeOut(2000);
			return false;
		}
		if($('#mem_pw').val()==''){
			$('#pw_check').text('비밀번호를 입력하세요.');
			$('#pw_check').css('color', 'red');
			$('#pw_check').fadeOut(2000);
			return false;
		}
	}); //End form.submit
	
	$('#searchid').on('click',function(){
			location.href="So_Idchk";
		});
	$('#searchpw').on('click',function(){
		location.href="So_Pwchk";
	});
	$('#searchidpw').on('click',function(){
		location.href="SearchIdPw";
	});
	
}) // End Jquery
</script>

</head>
<body>
<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>로그인</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
		
			<form action="So_Login" method="post" role="form"
				id="usercheck" name="member">
				<div class="form-group">
					<label for="id">아이디</label> <input type="text" class="form-control"
						id="mem_id" name="mem_id" placeholder="ID">
					<div class="eheck_font" id="id_check"></div>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label> <input type="password"
						class="form-control" id="mem_pw" name="mem_pw"
						placeholder="PASSWORD">
					<div class="eheck_font" id="pw_check"></div>
				</div>
			
				<div class="form-group text-center">
					<button type="submit" id="submit" class="btn btn-primary">로그인</button>
				</div>
				<div class="form-group text-center">
					<button type="button" id="searchid" class="btn btn-primary">ID찾기</button>
				</div>
				<div class="form-group text-center">
					<button type="button" id="searchpw" class="btn btn-primary">PW찾기</button>
				</div>
			</form>
			
		</div>
	</article>
	
	
	
		<c:choose>
	<c:when test="${msg==0 }">
		<script>
		alert("아이디 혹은 비밀번호를 확인하세요");
		location.replace("/SoMember/So_Login");
		</script>
	</c:when>
	<c:when test="${msg==1 }">
		<script>
			alert("회원 인증을 후 로그인이 가능합니다");
			location.replace("/SoMember/So_Login");
		</script>
	</c:when>
</c:choose>

	
</body>
</html>