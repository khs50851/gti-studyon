<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyOn PW찾기</title>
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
	//모든 공백 체크 정규식
	var empJ = /\s/g;
//이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
$("#mem_email").blur(function() {
	if (mailJ.test($(this).val())) {
		$("#email_check").text('');
		} else {
			$('#email_check').text('올바른 이메일 양식응로 작성해주세요!');
			$('#email_check').css('color', 'red');
			return false;
			}
	});
	
	$('form').on('submit',function(){
		if($('#mem_id').val()==''){
			$('#id_check').text('ID를 입력하세요.');
			$('#id_check').css('color', 'red');
			$('#id_check').fadeOut(2000);
			return false;
		}
		if($('#mem_email').val()==''){
			$('#email_check').text('이메일을 입력하세요.');
			$('#email_check').css('color', 'red');
			$('#email_check').fadeOut(2000);
			return false;
		}
		var inval_Arr = new Array(2).fill(false);
		if (idJ.test($('#mem_id').val())) {
			inval_Arr[0] = true;
			} else {
				inval_Arr[0] = false;
				alert('아이디를 확인하세요.');
				return false;
				}
		// 이메일 정규식
		if (mailJ.test($('#mem_email').val())){
			console.log(mailJ.test($('#mem_email').val()));
			inval_Arr[1] = true;
			} else {
				inval_Arr[1] = false;
				alert('이메일을 확인하세요.');
				return false;
				} 
				//전체 유효성 검사
				var validAll = true;
				for(var i = 0; i < inval_Arr.length; i++){
					if(inval_Arr[i] == false){
						validAll = false;
						}
					}
				if(validAll == true){ // 유효성 모두 통과
					
					alert('이메일로 임시 비밀번호가 발송되었습니다. 로그인 후 마이페이지에서 비밀번호를 변경 해주세요!');
				}else{
					alert('정보를 다시 확인하세요.');
					}
		
		
		
	}); //End form.submit
}) // End Jquery
</script>

</head>
<body>
<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>PW찾기 </h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
		
			<form action="So_Pwchk" method="post" role="form"
				id="usercheck" name="member">
				<div class="form-group">
					<label for="mem_id">ID</label> <input type="text" class="form-control"
						id="mem_id" name="mem_id" placeholder="ID">
					<div class="eheck_font" id="id_check"></div>
				</div>
				<div class="form-group">
					<label for="mem_email">E-mail</label> <input type="text"
						class="form-control" id="mem_email" name="mem_email"
						placeholder="E-mail">
					<div class="eheck_font" id="email_check"></div>
				</div>
			
				<div class="form-group text-center">
					<button type="submit" id="submit" class="btn btn-primary">PW찾기</button>
					<button type="button" id="button" class="btn btn-primary" onclick="history.back()">이전으로</button>
				</div>
			</form>
			
		</div>
	</article>
		<c:choose>
	<c:when test="${row2==1 }">
		<script>
			alert('ID와Email을 확인해주세요! Email이 기억나지 않는경우 관리자에게 문의해주세요!');
		</script>
	</c:when>
</c:choose>

	
</body>
</html>