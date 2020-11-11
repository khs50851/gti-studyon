<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qna게시판</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div id="root">
		<header>
			<h1>QNA 게시판</h1>
		</header>

		<hr />

		<nav>처음화면 - 글수정</nav>

		<hr />

		<section id="container">

			<form role="form" method="post" autocomplete="off"
				action="So_QnaModify">
				<input type="hidden" name="page" value="${page }">
				<input type="hidden" name="qna_bno" value="${qvo.qna_bno }"/>
				<p>
					<label for="title">글 제목</label><input type="text" id="title"
						name="qna_title" value="${qvo.qna_title }" />
				</p>
				<p>
					<label for="content">글 내용</label>
					<textarea id="content" name="qna_content">${qvo.qna_content }</textarea>
				</p>
				<script>
					var ckeditor_config = {
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "/SoQna/ckUpload"
					};

					CKEDITOR.replace("content", ckeditor_config);
				</script>

				<div class="inputArea">
					<button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
					<button type="submit" id="back_Btn" class="btn btn-warning">취소</button>
				</div>
				<script>
					$("#back_Btn").click(function() {
						//history.back();
						location.href = "/So_QnaView?qna_bno=" + ${qvo.qna_bno};
					});
				</script>
			</form>

		</section>

		<hr />



	</div>
</body>
</html>