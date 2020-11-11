<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qna게시판</title>

<script type="text/javascript">
	function search() {
		if (bsearch.key.value == "") {
			alert("검색어를 입력하세요");
			bsearch.focus();
			return;
		}
		bsearch.submit();
	}
</script>
</head>
<body>
	<div id="root">
		<header>
			<h1>QNA 게시판</h1>
		</header>

		<hr />

		<nav>처음화면 - 리스트</nav>

		<hr />

		<form name="bsearch" method="post" action="So_Qna">
			<input type="hidden" name="page" value="${page }">
			<!-- 검색어를 이용하여 글제목, 작성자, 글내용 중에 하나를 입력 받아 처리하기 위한 부분 -->
			<tr>
				<td><select name="search">
						<option value="qna_title"
							<c:if test="${pageVO.search=='qna_title' }">selected</c:if>>글제목</option>
						<option value="mem_id"
							<c:if test="${pageVO.search=='mem_id' }">selected</c:if>>작성자</option>
						<option value="qna_content"
							<c:if test="${pageVO.search=='qna_content' }">selected</c:if>>글내용</option>
				</select></td>
				<td><input type="text" size=20 name="key"
					value="${pageVO.key }"></td>
				<td><a href="javascript:search()">글검색</a></td>
			</tr>
		</form>
		
		<div>
			<a href="So_QnaWrite?page=${page }">글쓰기</a>
			
		</div>
		
		<section id="container">
		
			<c:if test="${empty list }">
				<tr onMouseOver="style.backgroundColor='#D1EEEE'"
					onMouseOut="style.backgroundColor=''">
					<td align="center" height="25" colspan="5"><font face="돋움"
						size="2" color="#000000">등록된 글이 없습니다.</font></td>
				</tr>
			</c:if>

			<table>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><a href="So_QnaView?qna_bno=${list.qna_bno }&page=${page}">${list.qna_title}</a>&nbsp;${list.mem_id}&nbsp;${list.regdate.substring(0,10) }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		<hr />
	</div>
	
	        <table width="700" border="0" cellspacing="0" cellpadding="5">
          <tr>&nbsp;</tr>
          <tr>
             <td colspan="5">        
                <div align="center">${listPage }</div>
			  </td>
			 </tr>
		</table>
	

	<c:if test="${row==1 }">
		<script>
			alert('게시글이 수정되었습니다');
		</script>
	</c:if>
	
	<c:if test="${row3==1 }">
		<script>
			alert('게시글이 등록되었습니다');
			
		</script>
	</c:if>
</body>
</html>