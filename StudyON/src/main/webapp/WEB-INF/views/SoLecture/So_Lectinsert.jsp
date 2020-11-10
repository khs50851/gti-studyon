<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../SoMain/header.jsp" %>



<section id="lectInsert">
	
	<div id="lectInsertForm">
		<form action="lectureInsertpro" method="post" role="form">
			
			<div id="name">
				<label for="name">강의명</label>
				<input type="text" id="lect_name" name="lect_name" placeholder="lect_name">
			</div>
			
			<!-- <div id="code">
				<label for="code">강의 코드</label>
				<input type="text" id="lect_code" name="lect_code" placeholder="lect_code">
			</div> -->
			
			<div id="teacher">
				<label for="teacher">강사</label>
				<input type="text" id="lect_teacher" name="lect_teacher" placeholder="lect_teacher"> 
			</div>
			
			<div id="price">
				<label for="price">가격</label>
				<input type="text" id="lect_price" name="lect_price" placeholder="lect_price"> 
			</div>
			
			<div id="tag">
				<label for="tag">강의 태그</label>
				<input type="text" id="lect_tag1" name="lect_tag1" placeholder="lect_tag1">
				<input type="text" id="lect_tag2" name="lect_tag2" placeholder="lect_tag2">
				<input type="text" id="lect_tag3" name="lect_tag3" placeholder="lect_tag3">
				<input type="text" id="lect_tag4" name="lect_tag4" placeholder="lect_tag4">
				<input type="text" id="lect_tag5" name="lect_tag5" placeholder="lect_tag5"> 
			</div>
			
			<div id="intro">
				<label for="intro">강의 설명</label>
				<textarea id="lect_intro" name="lect_intro" placeholder="lect_intro"></textarea>
			</div>
			
			<div id="thumb">
				<label for="intro">강의 썸네일</label>
				<textarea id="lect_thumb" name="lect_thumb" placeholder="lect_thumb"></textarea>
			</div>
			
			<div id="insertButton">
				<button type="submit">등록</button>
				<button type="reset">다시쓰기</button>
			</div>
			
		</form>
	</div>
	
</section>




<%@ include file = "../SoMain/footer.jsp" %>