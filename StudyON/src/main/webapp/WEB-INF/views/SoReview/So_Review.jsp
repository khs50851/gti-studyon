<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}

.wrap{
    max-width: 480px;
    margin: 0 auto; /* 화면 가운데로 */
    background-color: #fff;
    height: 100%;
    padding: 20px;
    box-sizing: border-box;

}
.reviewform textarea{
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
}
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}

.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">

<script>
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
    
    
    
}


let rating = new Rating();//별점 인스턴스 생성


document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
    
    
  //상품평 작성 글자수 초과 체크 이벤트 리스너
    document.querySelector('.review_textarea').addEventListener('keydown',function(){
        //리뷰 400자 초과 안되게 자동 자름
        let review = document.querySelector('.review_textarea');
        let lengthCheckEx = /^.{400,}$/;
        if(lengthCheckEx.test(review.value)){
            //400자 초과 컷
            review.value = review.value.substr(0,400);
        }
    });    
    
    
    
  //저장 전송전 필드 체크 이벤트 리스너
    document.querySelector('#save').addEventListener('click', function(e){
        //별점 선택 안했으면 메시지 표시
        if(rating.rate == 0){
            rating.showMessage('rate');
            return false;
        }
        //리뷰 5자 미만이면 메시지 표시
        if(document.querySelector('.review_textarea').value.length < 5){
            rating.showMessage('review');
            return false;
        }
        
      			//폼 서밋
    			var lists = [];
				$("input[name='rating']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
 				  lists.push($(this).val());
 				 });

        		var allData={"rating":lists,"contents":$('#contents').val()};
				$.ajax({
					async:true,
					type : 'POST',
					data : JSON.stringify(allData),
					url : 'So_Review',
					dataType : "json",
		            contentType: "application/json; charset=UTF-8",
					success : function(data){
						console.log(data)
						if(data.cnt>0){
							 $("input[type=checkbox]").prop("checked", false);
							 $('#contents').val('');
								alert('리뷰가 등록되었습니다!');
								console.log(data.cnt);
								showReplyList();
							}
						}
					});//ajax///
    });    
    
    
});

Rating.prototype.showMessage = function(type){//경고메시지 표시
    switch(type){
        case 'rate':
            //안내메시지 표시
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //안내메시지 표시
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
}

//리뷰 삭제

function fn_deleteReply(bno,page){
		var allData={"bno": bno,"page":page};
		$.ajax({
			async:false,
			type : 'POST',
			data : JSON.stringify(allData),
			url : 'So_ReviewDelete',
			dataType : "json",
	        contentType: "application/json; charset=UTF-8",
			success : function(data){
				console.log(data)
				if(data.cnt>0){
					console.log("data.page 값 : "+data.page);
					alert('삭제되었습니다!');
					var oCar1 = new Object();
					oCar1.value = data.page;
					moreList(oCar1);
					}
				}
			});
	}



$(document).ready(function(){
		showReplyList();
	
});

// 이전 코드 생략


function showReplyList(){
var page = '${page}';
console.log("리플라이 리스트에서의 페이지 : "+page);
	$.ajax({
        type: 'POST',
        url: "getReqlyList",
        async:false,
        data:{"page":page},
        dataType: 'json',
        success: function(result) {
           	var htmls = "";
		if(result.length < 1){
			htmls.push("등록된 리뷰 없습니다.");
		} else {
					var a = 0;
                    $(result).each(function(){
                     htmls += '<div id=rate2>'
                     htmls +=	"<span>평점 : </span>"
                    	for(var i = 0; i < this.rate; i++){
                      		htmls += "<span>★</span>"
                      		}
                     htmls += '</div>'
                     htmls += '<div class="media text-muted pt-3" id="bno' + this.bno + '">';
                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
                     htmls += '<title>Placeholder</title>';
                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
                     htmls += '</svg>';
                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
                     htmls += '<span class="d-block">';
                     htmls += '<strong class="text-gray-dark">' + this.mem_id + '</strong>';
                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.bno + ', \'' + this.mem_id + '\', \'' + this.contents + '\', \'' + this.rate + '\', \'' + page + '\' )" style="padding-right:5px">수정</a>';
                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.bno + ', \''+ page +'\')" )>삭제</a>';
                     htmls += '</span>';
                     htmls += '</span>';
                     htmls += this.contents;
                     htmls += '</p>';
                     htmls += '</div>';
					 
					 a=a+1;
					 if(a==result.length){
			         htmls += "<div class='btns addlistbtnarea'>"+"<button id='addlistbtn' onclick='javascript:moreList(this);' value='2' class='btn btn-primary btn-block'>"+"더보기"+"</button>"+"</div>"
			             
			         }
                     
                });	//each end
                   
		}
		
		$("#replyList").html(htmls);
		
        }	   // Ajax success end
	});	// Ajax end
}



function fn_editReply(bno, mem_id, contents,rate,page){
	console.log("그냥 수정창의 rate? : "+rate);
	console.log("수정을 눌렀을때 page : "+page);
	var htmls = "";
	$('.rate5').remove();
	$('#rate2').remove();
	htmls += '<div id=ratearea>'+"평점 : &nbsp;"
	htmls +=	"<select name='rate' id='rate'>"
		   +	"<option value='0'>"+'선택'+"</option>"
		   +	"<option value='1'>"+'★'+"</option>"
		   +	"<option value='2'>"+'★★'+"</option>"
		   +	"<option value='3'>"+'★★★'+"</option>"
		   +	"<option value='4'>"+'★★★★'+"</option>"
		   +	"<option value='5'>"+'★★★★★'+"</option>"
		   +	"</select>"
		   
	var rate = rate;	   
	console.log("1번(매개변수에서 받은거) rate값 : "+rate)
	
		  $(function(){	
				$(document).ready(function(){
					$('select[name=rate]').change(function() {
							rate = $(this).val();
							console.log("2번 rate 변경값 : "+rate);
							
					});
					
				});
				
			});
	
	console.log("3번 rate(선택한거) 값? : "+rate);
	htmls += '</div>' 	
	htmls += '<div class="media text-muted pt-3" id="bno' + bno + '">';
	htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	htmls += '<title>Placeholder</title>';
	htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	htmls += '</svg>';
	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	htmls += '<span class="d-block">';
	htmls += '<strong class="text-gray-dark">' + mem_id + '</strong>';
	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + bno + ', \'' + mem_id + '\', \'' + rate + '\', \'' + page + '\')" style="padding-right:5px">저장</a>';
	htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
	htmls += '</span>';
	htmls += '</span>';		
	htmls += '<textarea name="contents" id="editContent" class="form-control" rows="3">';
	htmls += contents;
	htmls += '</textarea>';
	htmls += '</p>';
	htmls += '</div>';
	$('#bno' + bno).replaceWith(htmls);
	$('#bno' + bno + ' #editContent').focus();
}

function fn_updateReply(bno,mem_id,rate,page){
	console.log("수정창업뎃창의 rate : "+rate);
	console.log("업데이트 창의 page : "+page);
	var replyEditContent = $('#editContent').val();
	var allData={"rate":rate,"contents":replyEditContent,"bno":bno,"mem_id":mem_id,"page":page};
	
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


function moreList(btn){
    console.log("moreList에서 받은 매개변수 : "+btn);
    console.log("moreList 매개변수로 들어온 (버튼객체)의 value = 페이징 "+btn.value);
    var page = btn.value;
    console.log("btn이 들어간 page 값 : "+page);
    $.ajax({
        url : "getReqlyListMore",
        type : "post",
        cache : false,
        async:false,
        dataType: 'json',
        data : {"page":btn.value },
        success : function(result){
        	var htmls = "";
            if(result.length==0){
                // 더 불러올 펀딩 목록이 없는 경우 버튼을 disabled 지정하면 불투명해지면서 클릭불가능해짐 (부트스트랩)
                $('#addlistbtn').attr("class","btn btn-primary btn-block disabled");
                $('#addlistbtn').text("더 불러올 펀딩목록이 없습니다");
            } else {
            	var a = 0;
                $(result).each(function(){
                	htmls += '<div class=rate5>'
                        htmls +=	"<span'>평점 : </span>"
                       	for(var i = 0; i < this.rate; i++){
                         		htmls += "<span>★</span>"
                         		}
                        htmls += '</div>'
                 htmls += '<div class="media text-muted pt-3" id="bno' + this.bno + '">';
                 htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
                 htmls += '<title>Placeholder</title>';
                 htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
                 htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
                 htmls += '</svg>';
                 htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
                 htmls += '<span class="d-block">';
                 htmls += '<strong class="text-gray-dark">' + this.mem_id + '</strong>';
                 htmls += '<span style="padding-left: 7px; font-size: 9pt">';
                 htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.bno + ', \'' + this.mem_id + '\', \'' + this.contents  + '\', \'' + this.rate + '\', \'' + page + '\' )" style="padding-right:5px">수정</a>';
                 htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.bno + ', \''+ page +'\')" >삭제</a>';
                 htmls += '</span>';
                 htmls += '</span>';
                 htmls += this.contents;
                 htmls += '</p>';
                 htmls += '</div>';
				 
				 a=a+1;
				 console.log(result.length);
                 
            });	//each end
           
                // 기존 버튼을 지우고 새로 만들어줄때 value 값을 1 증가시켜서 다음 10개를 불러올 페이징넘버를 기억하게함.
                var pagingNum = Number(btn.value) + 1;
            	console.log("페이징넘버 : "+pagingNum);
                htmls += '<tr id="addlistbtnarea">'
                    +'<td colspan="5"><div class="btns">'
                    +'<button type="button" id="addlistbtn" onclick="javascript:moreList(this);"'
                    +'value="'+pagingNum+'" class="btn btn-primary btn-block">'
                    +'더보기</button></div></td></tr>"';
                //console.log("content : "+content);
                $('#addlistbtnarea').remove();
                $("#replyList").html(htmls);
           }
        },
        error : function(){
           alert('ajax 통신 실패');
        }
  
});
}

</script>
</head>

<body>

<!--  
<div class="wrap">
    <h1>후기</h1>
    <form name="reviewform" class="reviewform" method="post" action="So_Review">
        <input type="hidden" name="rate" id="rate" value="0"/>
        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
 
        <div class="review_rating">
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">-->
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                
                <!--  
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>
        <div class="review_contents">
            <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
            <textarea rows="10" class="review_textarea" name="contents" id="contents"></textarea>
        </div>   
        <div class="cmd">
            <input type="button" name="save" id="save" value="등록">
        </div>
    </form>
</div>
-->
	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form name="reviewform" id="form" class="reviewform" action="So_Review" role="form" method="post">
				  <input type="hidden" name="rate" id="rate" value="0"/>
        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
 
        <div class="review_rating">
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">
              <!--    해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용--> 
                
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>
        
				<div class="row">
				
					<div class="col-sm-10">
					<div class="review_contents">
            <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
						<textarea  id="contents" name="contents" class="form-control review_textarea" rows="3" placeholder="리뷰를 입력해 주세요"></textarea>
					</div>
					</div>
					<div class="col-sm-2">
						<button type="button" name="save" class="btn btn-sm btn-primary" id="save" style="width: 100%; margin-top: 10px"> 저 장 </button>
					</div>
				</div>
				</form>
			</div>
			
			
<!-- 전에 하던 리뷰 리스트 혹시 몰라서 일단 남겨둠 		
<div>
<table class="table table-stripped" id="reviews">
    <thead>
        <tr>
            <th>Rating</th> 
            <th>User</th>
            <th>Text</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="review" items="${list }" varStatus="status">
            
            <tr>
                <td><c:forEach var="rating" items="${ ratingOptions }" varStatus="status" begin="1" end="${ review.rate }">★</c:forEach></td>
                <td>${review.mem_id }</td>
                <td>${ review.contents } |<a href="#" onclick="cmUpdateOpen(${review.bno})">&nbsp; 수정  &nbsp; |</a> &nbsp;  &nbsp; <a href="#" onclick="cmDeleteOpen(${review.bno})">| &nbsp; 삭제  &nbsp; </a>  </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
-->	

<!-- Reply Form {s} -->

		

			<!-- Reply Form {e} -->

			

			<!-- Reply List {s}-->

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>

				<div id="replyList"></div>
			
			</div> 
			<!-- Reply List {e}-->



</body>
</html>