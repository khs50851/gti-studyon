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
		if($('#mem_name').val()==''){
			$('#name_check').text('이름을 입력하세요.');
			$('#name_check').css('color', 'red');
			$('#name_check').fadeOut(2000);
			return false;
		}
		if($('#mem_phone').val()==''){
			$('#phone_check').text('전화번호 입력하세요.');
			$('#phone_check').css('color', 'red');
			$('#phone_check').fadeOut(2000);
			return false;
		}
		
		
		
	}); //End form.submit
}) // End Jquery
</script>

</head>
<body>
<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>ID찾기 </h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
		
			<form action="So_Idchk" method="post" role="form"
				id="usercheck" name="member">
				<div class="form-group">
					<label for="id">이름</label> <input type="text" class="form-control"
						id="mem_name" name="mem_name" placeholder="NAME">
					<div class="eheck_font" id="name_check"></div>
				</div>
				<div class="form-group">
					<label for="pw">전화번호</label> <input type="text"
						class="form-control" id="mem_phone" name="mem_phone"
						placeholder="PASSWORD">
					<div class="eheck_font" id="phone_check"></div>
				</div>
			
				<div class="form-group text-center">
					<button type="submit" id="submit" class="btn btn-primary">ID찾기</button>
					<button type="button" id="button" class="btn btn-primary" onclick="history.back()">이전으로</button>
					
				</div>
			</form>
			
		</div>
	</article>
	
	
	
		<c:choose>
	<c:when test="">
	
	</c:when>
</c:choose>

	
</body>
</html>