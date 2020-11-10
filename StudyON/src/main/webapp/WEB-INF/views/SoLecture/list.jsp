<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../SoMain/header.jsp" %>

<section id="lectList">

	<table>
		<tr>
			<th>강의 이름</th>
			<th>강의코드</th>
			<th>강사 이름</th>
			<th>가격</th>
			<th>태그 1</th>
			<th>태그 2</th>
			<th>태그 3</th>
			<th>태그 4</th>
			<th>태그 5</th>
			<th>강의 설명</th>
			<th>강의 썸네일</th>
		</tr>
		
		<c:forEach items="${list}" var="lecture">
			<tr>
				<td><c:out value="${lecture.lect_code}" /></td>
				<td><c:out value="${lecture.lect_name}" /></td>
				<td><c:out value="${lecture.lect_teacher}" /></td>
				<td><c:out value="${lecture.lect_price}" /></td>
				<td><c:out value="${lecture.lect_tag1}" /></td>
				<td><c:out value="${lecture.lect_tag2}" /></td>
				<td><c:out value="${lecture.lect_tag3}" /></td>
				<td><c:out value="${lecture.lect_tag4}" /></td>
				<td><c:out value="${lecture.lect_tag5}" /></td>
				<td><c:out value="${lecture.lect_intro}" /></td>
				<td><c:out value="${lecture.lect_thumb}" /></td>
			</tr>	
		</c:forEach>
		
	</table>

</section>





<%@ include file = "../SoMain/footer.jsp" %>
