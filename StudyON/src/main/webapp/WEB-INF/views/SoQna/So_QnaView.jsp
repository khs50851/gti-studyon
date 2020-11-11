<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.qna_content img {
	max-width: 600px;
	height: auto;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">


<script>
$(document).ready(function(){
			var formObj = $("form[role='form1']");
			$("#modify_Btn").click(function() {
				formObj.attr("action", "So_QnaModify");
				formObj.attr("method", "get")
				formObj.submit();
			});

			$("#delete_Btn").click(function() {
				   var delConfirm = confirm('삭제하시겠습니까?');
				   if (!delConfirm) {
					   alert('삭제가 취소되었습니다.');
				      	return false;
				   }else{
					   alert('삭제되었습니다!');
				   }
				formObj.attr("action", "So_QnaDelete?qna_bno=${qna_bno}&page=${page}");
				formObj.attr("method", "get")
				formObj.submit();
			});
			
}) // j쿼리 끝			


//댓글 관련
//댓글 리스트
$(document).ready(function(){
	showReplyList();
});

	function showReplyList(){
		var qna_bno = "${qvo.qna_bno}";
		var paramData = {"qna_bno":qna_bno};
		console.log("qna_bno"+qna_bno);
		$.ajax({
            type: 'POST',
            url: 'So_ReplyList',
            data: paramData,
            dataType: 'json',
            contentType: "application/json; charset=UTF-8",
            success: function(result) {
               	var htmls = "";
			if(result.length < 1){
				htmls.push("등록된 댓글이 없습니다.");
			} else {
	                    $(result).each(function(){
	                     htmls += '<div class="media text-muted pt-3" id="reply_bno' + this.reply_bno + '">';
	                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	                     htmls += '<title>Placeholder</title>';
	                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	                     htmls += '</svg>';
	                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                     htmls += '<span class="d-block">';
	                     htmls += '<strong class="text-gray-dark">' + this.mem_id + '</strong>';
	                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply1(' + this.reply_bno + ', \'' + this.mem_id + '\', \'' + this.reply_content + '\' )" style="padding-right:5px">수정</a>';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.reply_bno + ')" >삭제</a>';
	                     htmls += '</span>';
	                     htmls += '</span>';
	                     htmls += this.reply_content;
	                     htmls += '</p>';
	                     htmls += '</div>';
	                });	//each end
			}
			$("#replyList1").html(htmls);
            }	   // Ajax success end
		});	// Ajax end
	}

	
//댓글 등록

$(document).on('click', '#btnReplySave', function(){
		var qna_bno2 = "${qvo.qna_bno}";
		var allData={"reply_content":$('#reply_content').val(),"qna_bno":qna_bno2};
		$.ajax({
			async:true,
			type : 'POST',
			data : JSON.stringify(allData),
			url : 'So_ReplyInsert',
			dataType : "json",
    	    contentType: "application/json; charset=UTF-8",
			success : function(data){
				console.log(data)
				if(data.cnt>0){
					alert('댓글이 등록되었습니다!');
					console.log(data.cnt);
					$('#reply_content').val('');
					showReplyList();
				}
			}
		});
		//ajax// 등록 끝
});

	//댓글 수정
		function fn_editReply1(reply_bno, mem_id, reply_content){
			var htmls = "";
			console.log("reply_bno : "+reply_bno);
			console.log("mem_id : "+mem_id);
			console.log("reply_content : "+reply_content);
			htmls += '<div class="media text-muted pt-3" id="reply_bno' + reply_bno + '">';
			htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
			htmls += '<title>Placeholder</title>';
			htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
			htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
			htmls += '</svg>';
			htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
			htmls += '<span class="d-block">';
			htmls += '<strong class="text-gray-dark">' + mem_id + '</strong>';
			htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + reply_bno + ', \'' + mem_id + '\', \'' + reply_content + '\')" style="padding-right:5px">저장</a>';
			htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
			htmls += '</span>';
			htmls += '</span>';		
			htmls += '<textarea name="reply_content" id="editContent" class="form-control" rows="3">';
			htmls += reply_content;
			htmls += '</textarea>';
			htmls += '</p>';
			htmls += '</div>';
			$('#reply_bno' + reply_bno).replaceWith(htmls);
			$('#reply_bno' + reply_bno + ' #editContent').focus();
		}

	//수정 클릭시
	function fn_updateReply(reply_bno,mem_id,reply_content){
	var allData={"reply_bno":reply_bno,"mem_id":mem_id,"reply_content":reply_content};
	$.ajax({
		async:false,
		type : 'POST',
		data : JSON.stringify(allData),
		url : 'So_ReviewModify',
		dataType : "json",
        contentType: "application/json; charset=UTF-8",
		success : function(data){
			console.log(data)
			if(data.cnt>0){
				console.log("data.page 값 : "+data.page);
				var oCar = new Object();
				oCar.value = data.page;
				moreList(oCar);
				}
			}
		});//ajax///
}

	
</script>
</head>
<body>
	<form role="form1" method="get" autocomplete="off">
		<input type="hidden" name="qna_bno" value="${qvo.qna_bno}" />
		<input type="hidden" name="page" value="${page}" />
		
		<div class="inputArea">
			<span>${qvo.qna_title }</span>
		</div>

		<div class="inputArea">
			<label for="mem_id">작성자 : </label> <span>${qvo.mem_id}&nbsp;&nbsp;${qvo.regdate.substring(0,10) }</span>
		</div>


		<div class="inputArea">
			<label for="gdsDes">내용</label>
			<div class="qna_content">${qvo.qna_content }</div>
		</div>

		<div class="inputArea">
			<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
			<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
		</div>
	</form>
	
	<!-- Reply Form {s} -->

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form name="form" id="form" role="form" method="post" action="So_Reply">
				<input type="hidden" name="qna_bno" value="${qvo.qna_bno }"/>
				<div class="row">
					<div class="col-sm-10">
						<textarea id="reply_content" name="reply_content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>
					</div>
				</div>
				</form>
			</div>
			<!-- Reply Form {e} -->

			<!-- Reply List {s}-->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
				<div id="replyList1"></div>
			</div> 
			<!-- Reply List {e}-->

</body>
</html>