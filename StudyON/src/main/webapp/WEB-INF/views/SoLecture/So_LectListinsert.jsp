<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../SoMain/header.jsp" %>

<script>
	
	/* script Upload Ajax */
	$(document).ready(function(){
		/* 파일 사이즈 및 확장자 체크 */
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 1073741824; // 1GB
		
		function checkExtension(fileName, fileSize) {
			
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("#uploadBtn").on("click", function(e){
			
			var formData = new FormData();
			formData.append("lect_name",$("#lect_name").val());
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			
			
			console.log(files);
			
			// add filedate to formdata
			for(var i = 0; i < files.length; i++) {
				
				if(!checkExtension(files[i].name, files[i].size) ) {
					return false;
				}
				
				formData.append("uploadFile", files[i]);
				
			}
			
			
			$.ajax({
				url: 'uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				success: function(result){
					alert("Uploaded");
				}
			}) //$.ajax
			
		});
	});
</script>

<!-- <section id="uploadForm">
	<form action="uploadFormAction" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile" multiple>
		<button>Submit</button>
	</form>
</section> -->

<section id="uploadAjax">
	
	<div id="lectListInsertForm">
		<form action="" method="" role="form">
			<div id="name">
				<label for="name">강의명</label>
				<input type="text" id="lect_name" name="lect_name" value="<c:out value='${list.lect_name}' />" readonly="readonly">
			</div>
			
			<div id="code">
				<label for="code">강의코드</label>
				<input type="text" id="lect_code" name="lect_code" value="<c:out value='${list.lect_code}' />" readonly="readonly">
			</div>
			
			<div id="round">
				<label for="round">강의회차</label>
				<input type="text" id="lect_round" name="lect_round" placeholder="lect_round">
			</div>
		</form>
	</div>
		
	<div class="uploadDIV">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<button id="uploadBtn">Upload</button>
	
</section>



<%@ include file = "../SoMain/footer.jsp" %>